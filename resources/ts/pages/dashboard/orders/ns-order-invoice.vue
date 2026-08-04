<template>
    <div class="ns-invoice-page">
        <!-- Screen-only controls -->
        <div class="invoice-controls shadow ns-box mb-4">
            <div class="p-3 ns-box-title flex justify-between items-center">
                <ns-button @click="printTable()" type="info">
                    <i class="las la-print"></i>
                    <span>{{ __( 'Print Invoice' ) }}</span>
                </ns-button>
            </div>
        </div>

        <!-- Printable invoice -->
        <div id="invoice-container" class="invoice-document">
            <!-- Company and invoice header -->
            <div class="invoice-header">
                <div class="company-block">
                    <h1>{{ companyName }}</h1>
                    <p v-if="locationName">{{ locationName }}</p>
                </div>

                <div class="invoice-heading">
                    <h2>{{ __( 'INVOICE' ) }}</h2>
                    <div class="invoice-number">
                        {{ order.code }}
                    </div>
                </div>
            </div>

            <!-- Order information -->
            <div class="information-grid">
                <div class="information-card">
                    <h3>{{ __( 'Order Details' ) }}</h3>

                    <div class="detail-row">
                        <span>{{ __( 'Invoice Number' ) }}</span>
                        <strong>{{ order.code }}</strong>
                    </div>

                    <div class="detail-row">
                        <span>{{ __( 'Date' ) }}</span>
                        <strong>{{ order.created_at }}</strong>
                    </div>

                    <div class="detail-row">
                        <span>{{ __( 'Cashier' ) }}</span>
                        <strong>{{ cashierName }}</strong>
                    </div>

                    <div class="detail-row">
                        <span>{{ __( 'Order Type' ) }}</span>
                        <strong>{{ order.type }}</strong>
                    </div>
                </div>

                <div class="information-card">
                    <div class="card-heading-row">
                        <h3>{{ __( 'Customer Details' ) }}</h3>

                        <span
                            class="payment-status"
                            :class="paymentStatusClass">
                            {{ order.paymentStatus }}
                        </span>
                    </div>

                    <div class="detail-row">
                        <span>{{ __( 'Customer' ) }}</span>
                        <strong>{{ customerName }}</strong>
                    </div>

                    <template v-if="billingDetails.length > 0">
                        <div
                            v-for="field of billingDetails"
                            :key="field.id || field.name"
                            class="detail-row">
                            <span>{{ field.label }}</span>
                            <strong>{{ field.value }}</strong>
                        </div>
                    </template>
                </div>
            </div>

            <!-- Products -->
            <div class="products-section">
                <table class="invoice-table">
                    <thead>
                        <tr>
                            <th class="product-column">{{ __( 'Product' ) }}</th>
                            <th>{{ __( 'Unit Price' ) }}</th>
                            <th>{{ __( 'Qty' ) }}</th>
                            <th>{{ __( 'Discount' ) }}</th>
                            <th>{{ __( 'Tax' ) }}</th>
                            <th class="amount-column">{{ __( 'Total' ) }}</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr
                            v-for="product of order.products"
                            :key="product.id">
                            <td class="product-description">
                                <strong>{{ product.name }}</strong>
                                <small v-if="product.unit">
                                    {{ product.unit }}
                                </small>
                            </td>

                            <td class="center">
                                {{ nsCurrency( product.unit_price ) }}
                            </td>

                            <td class="center">
                                {{ product.quantity }}
                            </td>

                            <td class="center">
                                {{ nsCurrency( product.discount ) }}
                            </td>

                            <td class="center">
                                {{ nsCurrency( product.tax_value ) }}
                            </td>

                            <td class="right amount">
                                {{ nsCurrency( product.total_price ) }}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Totals -->
            <div class="invoice-summary-wrapper">
                <div class="invoice-summary">
                    <div class="summary-row">
                        <span>{{ __( 'Subtotal' ) }}</span>
                        <strong>{{ nsCurrency( order.subtotal ) }}</strong>
                    </div>

                    <div
                        v-if="order.discount > 0"
                        class="summary-row">
                        <span>{{ __( 'Discount' ) }}</span>
                        <strong>{{ nsCurrency( - order.discount ) }}</strong>
                    </div>

                    <div
                        v-if="order.total_coupons > 0"
                        class="summary-row">
                        <span>{{ __( 'Coupons' ) }}</span>
                        <strong>{{ nsCurrency( - order.total_coupons ) }}</strong>
                    </div>

                    <div
                        v-if="order.shipping > 0"
                        class="summary-row">
                        <span>{{ __( 'Shipping' ) }}</span>
                        <strong>{{ nsCurrency( order.shipping ) }}</strong>
                    </div>

                    <div
                        v-for="tax of order.taxes"
                        :key="tax.id"
                        class="summary-row">
                        <span>
                            {{ tax.tax_name }}
                            <small>
                                {{ order.tax_type === 'inclusive'
                                    ? __( 'Inclusive' )
                                    : __( 'Exclusive' ) }}
                            </small>
                        </span>

                        <strong>{{ nsCurrency( order.tax_value ) }}</strong>
                    </div>

                    <div class="summary-row grand-total">
                        <span>{{ __( 'Total' ) }}</span>
                        <strong>{{ nsCurrency( order.total ) }}</strong>
                    </div>

                    <div class="summary-row">
                        <span>{{ __( 'Paid' ) }}</span>
                        <strong>{{ nsCurrency( order.tendered ) }}</strong>
                    </div>

                    <div
                        v-if="[ 'partially_paid', 'unpaid' ].includes( order.payment_status )"
                        class="summary-row balance-due">
                        <span>{{ __( 'Due' ) }}</span>
                        <strong>{{ nsCurrency( order.change ) }}</strong>
                    </div>

                    <div
                        v-else
                        class="summary-row">
                        <span>{{ __( 'Change' ) }}</span>
                        <strong>{{ nsCurrency( order.change ) }}</strong>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="invoice-footer">
                <p>{{ __( 'Thank you for your business.' ) }}</p>
                <small>
                    {{ companyName }} · {{ order.code }}
                </small>
            </div>
        </div>
    </div>
</template>

<script>
import { nsCurrency } from '~/filters/currency';
import { __ } from '~/libraries/lang';

export default {
    props: [ 'order', 'billing', 'options' ],

    computed: {
        companyName() {
            if (
                this.options &&
                this.options.ns_store_name &&
                this.options.ns_store_name.value
            ) {
                return this.options.ns_store_name.value;
            }

            return 'FirumanPOS';
        },

        locationName() {
            if (
                this.options &&
                this.options.ns_location_name &&
                this.options.ns_location_name.value
            ) {
                return this.options.ns_location_name.value;
            }

            return '';
        },

        cashierName() {
            return this.order &&
                this.order.user &&
                this.order.user.username
                ? this.order.user.username
                : 'N/A';
        },

        customerName() {
            if (
                this.order &&
                this.order.customer &&
                this.order.customer.name
            ) {
                return this.order.customer.name;
            }

            return __( 'Walk-in Customer' );
        },

        billingDetails() {
            if (
                ! Array.isArray( this.billing ) ||
                ! this.order ||
                ! this.order.billing_address
            ) {
                return [];
            }

            return this.billing
                .map( field => {
                    return {
                        id: field.id,
                        name: field.name,
                        label: field.label,
                        value: this.order.billing_address[ field.name ]
                    };
                } )
                .filter( field => {
                    return field.value !== null &&
                        field.value !== undefined &&
                        field.value !== '' &&
                        field.value !== 'N/A';
                } );
        },

        paymentStatusClass() {
            if ( this.order.payment_status === 'paid' ) {
                return 'status-paid';
            }

            if ( this.order.payment_status === 'partially_paid' ) {
                return 'status-partial';
            }

            return 'status-unpaid';
        }
    },

    methods: {
        __,
        nsCurrency,

        printTable() {
            const invoice = document.getElementById( 'invoice-container' );

            if ( ! invoice ) {
                alert( 'Invoice could not be found.' );
                return;
            }

            const printWindow = window.open( '', '_blank', 'width=1000,height=800' );

            if ( ! printWindow ) {
                alert( 'Please allow pop-ups so the invoice can be printed.' );
                return;
            }

            const styles = `
                @page {
                    size: Letter portrait;
                    margin: 0.45in;
                }

                * {
                    box-sizing: border-box;
                }

                html,
                body {
                    margin: 0;
                    padding: 0;
                    background: #ffffff;
                    color: #111827;
                    font-family: Arial, Helvetica, sans-serif;
                    font-size: 12px;
                }

                .invoice-document {
                    width: 100%;
                    max-width: none;
                    margin: 0;
                    padding: 0;
                    background: #ffffff;
                    color: #111827;
                    box-shadow: none;
                }

                .invoice-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: flex-start;
                    gap: 24px;
                    padding-bottom: 16px;
                    border-bottom: 2px solid #111827;
                }

                .company-block h1 {
                    margin: 0;
                    font-size: 24px;
                    line-height: 1.15;
                    font-weight: 800;
                }

                .company-block p {
                    margin: 6px 0 0;
                    font-size: 11px;
                    color: #4b5563;
                    letter-spacing: 0.1em;
                    text-transform: uppercase;
                }

                .invoice-heading {
                    text-align: right;
                }

                .invoice-heading h2 {
                    margin: 0;
                    font-size: 28px;
                    line-height: 1;
                    font-weight: 800;
                    letter-spacing: 0.08em;
                }

                .invoice-number {
                    margin-top: 8px;
                    font-size: 14px;
                    font-weight: 700;
                    color: #4b5563;
                }

                .information-grid {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 16px;
                    margin-top: 18px;
                }

                .information-card {
                    padding: 14px;
                    border: 1px solid #cbd5e1;
                    border-radius: 4px;
                    background: #ffffff;
                    break-inside: avoid;
                }

                .information-card h3 {
                    margin: 0 0 10px;
                    padding-bottom: 7px;
                    border-bottom: 1px solid #cbd5e1;
                    font-size: 14px;
                    font-weight: 800;
                }

                .card-heading-row {
                    display: flex;
                    justify-content: space-between;
                    align-items: flex-start;
                    gap: 12px;
                }

                .card-heading-row h3 {
                    flex: 1;
                }

                .detail-row {
                    display: flex;
                    justify-content: space-between;
                    align-items: flex-start;
                    gap: 18px;
                    padding: 4px 0;
                    font-size: 11px;
                }

                .detail-row span {
                    color: #4b5563;
                    white-space: nowrap;
                }

                .detail-row strong {
                    text-align: right;
                    color: #111827;
                }

                .payment-status {
                    display: inline-block;
                    padding: 4px 8px;
                    border: 1px solid #86efac;
                    border-radius: 999px;
                    font-size: 9px;
                    font-weight: 800;
                    letter-spacing: 0.06em;
                    text-transform: uppercase;
                    white-space: nowrap;
                }

                .products-section {
                    margin-top: 20px;
                }

                .invoice-table {
                    width: 100%;
                    border-collapse: collapse;
                    table-layout: fixed;
                    font-size: 11px;
                }

                .invoice-table thead {
                    display: table-header-group;
                }

                .invoice-table thead th {
                    padding: 9px 7px;
                    border-top: 1px solid #111827;
                    border-bottom: 2px solid #111827;
                    background: #f3f4f6;
                    font-size: 9px;
                    font-weight: 800;
                    letter-spacing: 0.03em;
                    text-align: center;
                    text-transform: uppercase;
                }

                .invoice-table thead th:first-child {
                    width: 30%;
                    text-align: left;
                }

                .invoice-table thead th:last-child {
                    text-align: right;
                }

                .invoice-table tbody td {
                    padding: 10px 7px;
                    border-bottom: 1px solid #e5e7eb;
                    vertical-align: middle;
                }

                .product-description strong,
                .product-description small {
                    display: block;
                }

                .product-description small {
                    margin-top: 2px;
                    color: #6b7280;
                }

                .center {
                    text-align: center;
                }

                .right {
                    text-align: right;
                }

                .amount {
                    font-weight: 700;
                }

                .invoice-summary-wrapper {
                    display: flex;
                    justify-content: flex-end;
                    margin-top: 18px;
                    break-inside: avoid;
                }

                .invoice-summary {
                    width: 42%;
                    min-width: 280px;
                }

                .summary-row {
                    display: flex;
                    justify-content: space-between;
                    align-items: flex-start;
                    gap: 24px;
                    padding: 6px 3px;
                    border-bottom: 1px solid #e5e7eb;
                    font-size: 11px;
                }

                .summary-row span {
                    color: #4b5563;
                }

                .summary-row span small {
                    display: block;
                    margin-top: 2px;
                    font-size: 8px;
                    color: #6b7280;
                }

                .summary-row strong {
                    white-space: nowrap;
                }

                .grand-total {
                    margin-top: 4px;
                    padding: 10px 5px;
                    border-top: 2px solid #111827;
                    border-bottom: 2px solid #111827;
                    font-size: 16px;
                    font-weight: 900;
                }

                .invoice-footer {
                    margin-top: 30px;
                    padding-top: 14px;
                    border-top: 1px solid #cbd5e1;
                    text-align: center;
                    color: #4b5563;
                    break-inside: avoid;
                }

                .invoice-footer p {
                    margin: 0 0 4px;
                    font-size: 11px;
                    font-weight: 700;
                }

                .invoice-footer small {
                    font-size: 8px;
                }
            `;

            printWindow.document.open();
            printWindow.document.write(`
                <!DOCTYPE html>
                <html>
                    <head>
                        <meta charset="utf-8">
                        <title></title>
                        <style>${styles}</style>
                    </head>
                    <body>
                        ${invoice.outerHTML}
                    </body>
                </html>
            `);
            printWindow.document.close();

            printWindow.focus();

            setTimeout( () => {
                printWindow.print();
                printWindow.close();
            }, 500 );
        }
    }
};
</script>

<style scoped>
.ns-invoice-page {
    width: 100%;
}

.invoice-document {
    max-width: 1100px;
    margin: 0 auto;
    padding: 36px;
    background: #ffffff;
    color: #1f2937;
    box-sizing: border-box;
    box-shadow: 0 4px 18px rgba(0, 0, 0, 0.08);
}

.invoice-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 30px;
    padding-bottom: 24px;
    border-bottom: 3px solid #1f2937;
}

.company-block h1 {
    margin: 0;
    font-size: 30px;
    line-height: 1.15;
    font-weight: 800;
    color: #111827;
}

.company-block p {
    margin: 7px 0 0;
    font-size: 15px;
    color: #6b7280;
    letter-spacing: 0.08em;
    text-transform: uppercase;
}

.invoice-heading {
    text-align: right;
}

.invoice-heading h2 {
    margin: 0;
    font-size: 34px;
    line-height: 1;
    font-weight: 800;
    letter-spacing: 0.08em;
    color: #111827;
}

.invoice-number {
    margin-top: 10px;
    font-size: 17px;
    font-weight: 700;
    color: #4b5563;
}

.information-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 22px;
    margin-top: 26px;
}

.information-card {
    padding: 20px;
    border: 1px solid #d1d5db;
    border-radius: 6px;
    background: #f9fafb;
}

.information-card h3 {
    margin: 0 0 14px;
    padding-bottom: 9px;
    border-bottom: 1px solid #d1d5db;
    font-size: 17px;
    font-weight: 800;
    color: #111827;
}

.card-heading-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 15px;
}

.card-heading-row h3 {
    flex: 1;
}

.detail-row {
    display: flex;
    justify-content: space-between;
    gap: 20px;
    padding: 5px 0;
    font-size: 14px;
}

.detail-row span {
    color: #6b7280;
}

.detail-row strong {
    text-align: right;
    color: #111827;
}

.payment-status {
    display: inline-block;
    padding: 5px 10px;
    border-radius: 999px;
    font-size: 11px;
    font-weight: 800;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    white-space: nowrap;
}

.status-paid {
    background: #dcfce7;
    color: #166534;
}

.status-partial {
    background: #fef3c7;
    color: #92400e;
}

.status-unpaid {
    background: #fee2e2;
    color: #991b1b;
}

.products-section {
    margin-top: 28px;
}

.invoice-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 14px;
}

.invoice-table thead th {
    padding: 12px 10px;
    border-top: 1px solid #111827;
    border-bottom: 2px solid #111827;
    background: #f3f4f6;
    color: #111827;
    font-size: 12px;
    font-weight: 800;
    letter-spacing: 0.04em;
    text-align: center;
    text-transform: uppercase;
}

.invoice-table thead th.product-column {
    text-align: left;
}

.invoice-table thead th.amount-column {
    text-align: right;
}

.invoice-table tbody td {
    padding: 13px 10px;
    border-bottom: 1px solid #e5e7eb;
    vertical-align: middle;
}

.product-description strong {
    display: block;
    color: #111827;
}

.product-description small {
    display: block;
    margin-top: 3px;
    color: #6b7280;
}

.center {
    text-align: center;
}

.right {
    text-align: right;
}

.amount {
    font-weight: 700;
}

.invoice-summary-wrapper {
    display: flex;
    justify-content: flex-end;
    margin-top: 26px;
}

.invoice-summary {
    width: 390px;
}

.summary-row {
    display: flex;
    justify-content: space-between;
    gap: 30px;
    padding: 8px 4px;
    border-bottom: 1px solid #e5e7eb;
    font-size: 14px;
}

.summary-row span {
    color: #4b5563;
}

.summary-row span small {
    display: block;
    margin-top: 2px;
    font-size: 10px;
    color: #9ca3af;
}

.summary-row strong {
    color: #111827;
    white-space: nowrap;
}

.grand-total {
    margin-top: 5px;
    padding: 14px 8px;
    border-top: 2px solid #111827;
    border-bottom: 2px solid #111827;
    font-size: 19px;
}

.grand-total span,
.grand-total strong {
    color: #111827;
    font-weight: 900;
}

.balance-due span,
.balance-due strong {
    color: #b91c1c;
    font-weight: 800;
}

.invoice-footer {
    margin-top: 45px;
    padding-top: 18px;
    border-top: 1px solid #d1d5db;
    text-align: center;
    color: #6b7280;
}

.invoice-footer p {
    margin: 0 0 5px;
    font-size: 14px;
    font-weight: 700;
    color: #374151;
}

.invoice-footer small {
    font-size: 11px;
}

@media (max-width: 800px) {
    .invoice-document {
        padding: 22px;
    }

    .invoice-header {
        flex-direction: column;
    }

    .invoice-heading {
        text-align: left;
    }

    .information-grid {
        grid-template-columns: 1fr;
    }

    .invoice-table {
        font-size: 12px;
    }

    .invoice-summary {
        width: 100%;
    }
}

@media print {
    .invoice-controls {
        display: none !important;
    }

    .invoice-document {
        max-width: none;
        margin: 0;
        padding: 20px;
        box-shadow: none;
    }

    .information-card,
    .invoice-table thead th {
        -webkit-print-color-adjust: exact;
        print-color-adjust: exact;
    }
}
</style>
