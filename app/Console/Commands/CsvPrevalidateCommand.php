<?php

namespace App\Console\Commands;

use App\Models\Product;
use App\Models\ProductUnitQuantity;
use App\Models\Unit;
use App\Models\UnitGroup;
use Illuminate\Console\Command;

class CsvPrevalidateCommand extends Command
{
    protected $signature = 'ns:csv:prevalidate {path : Path to CSV file} {--delimiter=, : CSV delimiter} {--has-header : Treat first row as header} {--report=report.csv : Output report CSV}';

    protected $description = 'Validate a product CSV before import (unit groups, units, unit quantities, barcodes/SKUs). Generates a fix report.';

    public function handle()
    {
        $path = $this->argument('path');
        $delimiter = $this->option('delimiter');
        $hasHeader = (bool) $this->option('has-header');
        $reportPath = $this->option('report');

        if (! is_readable($path)) {
            $this->error("CSV not readable: {$path}");
            return 1;
        }

        $fh = fopen($path, 'r');
        if (! $fh) {
            $this->error('Unable to open CSV file');
            return 1;
        }

        $headers = [];
        if ($hasHeader) {
            $headers = fgetcsv($fh, 0, $delimiter) ?: [];
        }

        $issues = [];
        $rows = 0;
        while (($row = fgetcsv($fh, 0, $delimiter)) !== false) {
            $rows++;
            $data = $this->mapRow($headers, $row);

            $productId = (int)($data['id'] ?? 0);
            $name = trim((string)($data['name'] ?? ''));
            $sku = trim((string)($data['sku'] ?? ''));
            $barcode = trim((string)($data['barcode'] ?? ''));
            $unitGroupId = (int)($data['unit_group'] ?? 0);
            $unitId = (int)($data['unit_id'] ?? 0);
            $quantity = (float)($data['quantity'] ?? -1);
            $salePrice = (float)($data['sale_price_edit'] ?? ($data['sale_price'] ?? -1));

            $rowIssues = [];

            // Basic presence
            if ($productId <= 0) { $rowIssues[] = 'missing:id'; }
            if ($name === '') { $rowIssues[] = 'missing:name'; }

            // Identifiers
            if ($sku === '') { $rowIssues[] = 'missing:sku'; }
            if ($barcode === '') { $rowIssues[] = 'missing:barcode'; }

            if ($sku !== '' && Product::where('sku', $sku)->exists()) {
                $rowIssues[] = 'duplicate:sku';
            }
            if ($barcode !== '' && (Product::where('barcode', $barcode)->exists() || ProductUnitQuantity::where('barcode', $barcode)->exists())) {
                $rowIssues[] = 'duplicate:barcode';
            }

            // Unit group validity
            $ug = $unitGroupId > 0 ? UnitGroup::find($unitGroupId) : null;
            if ($unitGroupId > 0 && ! $ug) {
                $rowIssues[] = 'invalid:unit_group';
            }
            if ($ug && $ug->units()->count() === 0) {
                $rowIssues[] = 'unit_group_has_no_units';
            }

            // Unit validity
            $unit = $unitId > 0 ? Unit::find($unitId) : null;
            if ($unitId > 0 && ! $unit) {
                $rowIssues[] = 'invalid:unit_id';
            }
            if ($unit && $ug && ! $ug->units()->where('id', $unit->id)->exists()) {
                $rowIssues[] = 'unit_not_in_group';
            }

            // Quantities/prices
            if ($quantity < 0) { $rowIssues[] = 'missing:quantity'; }
            if ($salePrice < 0) { $rowIssues[] = 'missing:sale_price_edit'; }

            if (! empty($rowIssues)) {
                $issues[] = [
                    'row' => $rows,
                    'id' => $productId,
                    'name' => $name,
                    'sku' => $sku,
                    'barcode' => $barcode,
                    'unit_group' => $unitGroupId,
                    'unit_id' => $unitId,
                    'quantity' => $quantity,
                    'sale_price_edit' => $salePrice,
                    'problems' => implode('|', $rowIssues),
                    'suggestion' => $this->suggestFix($ug, $unit),
                ];
            }
        }
        fclose($fh);

        $this->info("Rows checked: {$rows}");
        $this->info("Rows with issues: ".count($issues));

        // Write report
        $this->writeReport($reportPath, $issues);
        $this->info("Report written to: {$reportPath}");

        if (count($issues) > 0) {
            $this->warn('Import may break POS visibility. Please fix listed issues before import.');
        } else {
            $this->info('CSV looks good.');
        }

        return 0;
    }

    private function mapRow(array $headers, array $row): array
    {
        if (empty($headers)) {
            // Assume fixed order if no headers
            // id,name,sku,barcode,unit_group,unit_id,quantity,sale_price_edit
            return [
                'id' => $row[0] ?? null,
                'name' => $row[1] ?? null,
                'sku' => $row[2] ?? null,
                'barcode' => $row[3] ?? null,
                'unit_group' => $row[4] ?? null,
                'unit_id' => $row[5] ?? null,
                'quantity' => $row[6] ?? null,
                'sale_price_edit' => $row[7] ?? null,
            ];
        }
        $data = [];
        foreach ($headers as $i => $key) {
            $data[strtolower(trim($key))] = $row[$i] ?? null;
        }
        return $data;
    }

    private function suggestFix(?UnitGroup $ug, ?Unit $unit): string
    {
        if (! $ug) {
            return 'Create/assign valid unit_group with at least one unit';
        }
        if ($ug && (! $unit || ! $ug->units()->where('id', $unit->id)->exists())) {
            $candidate = $ug->units()->first();
            if ($candidate) {
                return 'Use unit_id='.$candidate->id.' from the product unit_group';
            }
            return 'Add units to the unit_group before import';
        }
        return 'Ensure quantity>=0 and sale_price_edit present';
    }

    private function writeReport(string $path, array $issues): void
    {
        $fh = fopen($path, 'w');
        if (! $fh) { return; }
        fputcsv($fh, ['row','id','name','sku','barcode','unit_group','unit_id','quantity','sale_price_edit','problems','suggestion']);
        foreach ($issues as $issue) {
            fputcsv($fh, [
                $issue['row'],
                $issue['id'],
                $issue['name'],
                $issue['sku'],
                $issue['barcode'],
                $issue['unit_group'],
                $issue['unit_id'],
                $issue['quantity'],
                $issue['sale_price_edit'],
                $issue['problems'],
                $issue['suggestion'],
            ]);
        }
        fclose($fh);
    }
}
