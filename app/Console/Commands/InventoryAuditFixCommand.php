<?php

namespace App\Console\Commands;

use App\Models\Product;
use App\Models\ProductUnitQuantity;
use App\Models\Unit;
use App\Models\UnitGroup;
use Illuminate\Console\Command;

class InventoryAuditFixCommand extends Command
{
    protected $signature = 'ns:inventory:audit-fix {--dry-run : Only report issues, do not modify}';

    protected $description = 'Audit products and fix missing or invalid unit assignments and unit quantities.';

    public function handle()
    {
        $dryRun = (bool) $this->option('dry-run');

        $total = Product::excludeVariations()->count();
        $withoutUnits = Product::excludeVariations()->doesntHave('unit_quantities')->count();
        $this->info("Total non-variation products: {$total}");
        $this->info("Products WITHOUT unit quantities: {$withoutUnits}");

        $issues = [
            'missing_unit_quantities' => [],
            'invalid_unit_group' => [],
            'unit_group_without_units' => [],
        ];

        Product::excludeVariations()
            ->with('unit_quantities', 'unitGroup.units')
            ->orderBy('id')
            ->chunk(500, function ($chunk) use (&$issues, $dryRun) {
                foreach ($chunk as $product) {
                    $hasUnitQuantities = $product->unit_quantities->count() > 0;

                    // Validate unit group
                    $unitGroupId = (int) ($product->unit_group ?? 0);
                    $unitGroup = $unitGroupId > 0 ? UnitGroup::find($unitGroupId) : null;
                    if ($unitGroupId > 0 && ! $unitGroup) {
                        $issues['invalid_unit_group'][] = $product->id;
                    }

                    if ($unitGroup instanceof UnitGroup && $unitGroup->units()->count() === 0) {
                        $issues['unit_group_without_units'][] = $product->id;
                    }

                    if (! $hasUnitQuantities) {
                        $issues['missing_unit_quantities'][] = $product->id;

                        if (! $dryRun) {
                            // Pick a unit: prefer from unit group, else first available unit
                            $unit = null;
                            if ($unitGroup instanceof UnitGroup) {
                                $unit = $unitGroup->units()->first();
                            }
                            if (! $unit instanceof Unit) {
                                $unit = Unit::first();
                            }

                            if ($unit instanceof Unit) {
                                $uq = new ProductUnitQuantity;
                                $uq->product_id = $product->id;
                                $uq->unit_id = $unit->id;
                                $uq->quantity = 0.0;
                                $uq->low_quantity = 0.0;
                                $uq->sale_price = 0.0;
                                $uq->sale_price_edit = 0.0;
                                $uq->wholesale_price = 0.0;
                                $uq->wholesale_price_edit = 0.0;
                                $uq->barcode = $product->barcode ?? null;
                                $uq->save();
                                $this->line("Fixed: created unit quantity for product ID {$product->id} using unit ID {$unit->id}");
                            } else {
                                $this->line("Skipped: no units available to assign for product ID {$product->id}");
                            }
                        }
                    }
                }
            });

        $this->newLine();
        $this->info('Audit Summary');
        $this->line(' - Missing unit quantities: ' . count($issues['missing_unit_quantities']));
        $this->line(' - Invalid unit group reference: ' . count($issues['invalid_unit_group']));
        $this->line(' - Unit group with no units: ' . count($issues['unit_group_without_units']));

        if ($dryRun) {
            $this->newLine();
            $this->info('Use without --dry-run to auto-create missing unit quantities.');
        }

        return 0;
    }
}
