<?php

namespace App\Http\Controllers\InventoryPurchase;

use App\Enums\PurchaseStatus;
use App\Http\Controllers\Controller;
use App\Http\Requests\Purchase\StorePurchaseRequest;
use App\Models\Category;
use App\Models\Product;
use App\Models\Purchase;
use App\Models\PurchaseDetails;
use App\Models\Supplier;
use Carbon\Carbon;
use Exception;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xls;
use Illuminate\Support\Str;
use App\Traits\ResponseTrait;

class PurchaseController extends Controller
{
    use ResponseTrait;

    public function index()
    {
        try {
            $purchasesCount = Purchase::where('user_id', auth()->id())->count();
            return $this->ResSuccess($purchasesCount, 'Purchase count fetched successfully.');
        } catch (Exception $e) {
            return $this->ResError('Failed to fetch purchase count.');
        }
    }

    public function approvedPurchases()
    {
        try {
            $purchases = Purchase::with('supplier')
                ->where('status', PurchaseStatus::APPROVED->value)
                ->get();

            return $this->ResSuccess($purchases, 'Approved purchases fetched successfully.');
        } catch (Exception $e) {
            return $this->ResError('Failed to fetch approved purchases.');
        }
    }

    public function show($uuid)
    {
        try {
            $purchase = Purchase::where('uuid', $uuid)
                ->with(['supplier', 'details.product'])
                ->firstOrFail();

            return $this->ResSuccess([
                'purchase' => $purchase,
                'products' => $purchase->details,
            ], 'Purchase details fetched successfully.');
        } catch (Exception $e) {
            return $this->ResError('Failed to fetch purchase details.');
        }
    }

    public function edit($uuid)
    {
        try {
            $purchase = Purchase::where('uuid', $uuid)
                ->with(['supplier', 'details'])
                ->firstOrFail();

            return $this->ResSuccess($purchase, 'Purchase data fetched successfully for editing.');
        } catch (Exception $e) {
            return $this->ResError('Failed to fetch purchase data for editing.');
        }
    }

    public function create()
    {
        try {
            $categories = Category::where('user_id', auth()->id())->select(['id', 'name'])->get();
            $suppliers = Supplier::where('user_id', auth()->id())->select(['id', 'name'])->get();

            return $this->ResSuccess([
                'categories' => $categories,
                'suppliers' => $suppliers,
            ], 'Categories and suppliers fetched successfully.');
        } catch (Exception $e) {
            return $this->ResError('Failed to fetch categories and suppliers.');
        }
    }

    public function store(StorePurchaseRequest $request)
    {
        try {
            if (empty($request->invoiceProducts) || $request->invoiceProducts[0]['total'] == 0) {
                return $this->ResError('Please add product!');
            }

            $purchase = Purchase::create([
                'purchase_no' => IdGenerator::generate([
                    'table' => 'purchases',
                    'field' => 'purchase_no',
                    'length' => 10,
                    'prefix' => 'PRS-',
                ]),
                'status' => PurchaseStatus::PENDING->value,
                'created_by' => auth()->user()->id,
                'supplier_id' => $request->supplier_id,
                'date' => $request->date,
                'total_amount' => $request->total_amount,
                'uuid' => Str::uuid(),
                'user_id' => auth()->id(),
            ]);

            if (!empty($request->invoiceProducts)) {
                $details = array_map(function ($product) use ($purchase) {
                    return [
                        'purchase_id' => $purchase->id,
                        'product_id' => $product['product_id'],
                        'quantity' => $product['quantity'],
                        'unitcost' => intval($product['unitcost']),
                        'total' => $product['total'],
                        'created_at' => Carbon::now(),
                    ];
                }, $request->invoiceProducts);

                $purchase->details()->insert($details);
            }

            return $this->ResSuccess(null, 'Purchase has been created successfully.');
        } catch (Exception $e) {
            return $this->ResError('Failed to create purchase.');
        }
    }

    public function update($uuid)
    {
        try {
            $purchase = Purchase::where('uuid', $uuid)->firstOrFail();
            $products = PurchaseDetails::where('purchase_id', $purchase->id)->get();

            foreach ($products as $product) {
                Product::where('id', $product->product_id)
                    ->increment('quantity', $product->quantity);
            }

            $purchase->update([
                'status' => PurchaseStatus::APPROVED->value,
                'updated_by' => auth()->user()->id,
            ]);

            return $this->ResSuccess(null, 'Purchase has been approved successfully.');
        } catch (Exception $e) {
            return $this->ResError('Failed to approve purchase.');
        }
    }

    public function destroy($uuid)
    {
        try {
            $purchase = Purchase::where('uuid', $uuid)->firstOrFail();

            // Delete related purchase details if needed

            $purchase->delete();

            return $this->ResSuccess(null, 'Purchase has been deleted successfully.');
        } catch (Exception $e) {
            return $this->ResError('Failed to delete purchase.');
        }
    }

    public function purchaseReport()
    {
        try {
            $purchases = Purchase::with('supplier')
                ->where('date', today()->format('Y-m-d'))
                ->get();

            return $this->ResSuccess($purchases, 'Purchase report fetched successfully.');
        } catch (Exception $e) {
            return $this->ResError('Failed to fetch purchase report.');
        }
    }

    public function getPurchaseReport()
    {
        return view('purchases.report-purchase');
    }

    public function exportPurchaseReport(Request $request)
    {
        $rules = [
            'start_date' => 'required|string|date_format:Y-m-d',
            'end_date' => 'required|string|date_format:Y-m-d',
        ];

        $validatedData = $request->validate($rules);

        try {
            $sDate = $validatedData['start_date'];
            $eDate = $validatedData['end_date'];

            $purchases = DB::table('purchase_details')
                ->join('products', 'purchase_details.product_id', '=', 'products.id')
                ->join('purchases', 'purchase_details.purchase_id', '=', 'purchases.id')
                ->join('users', 'users.id', '=', 'purchases.created_by')
                ->whereBetween('purchases.updated_at', [$sDate, $eDate])
                ->where('purchases.status', '1')
                ->select('purchases.purchase_no', 'purchases.updated_at', 'purchases.supplier_id', 'products.code', 'products.name', 'purchase_details.quantity', 'purchase_details.unitcost', 'purchase_details.total', 'users.name as created_by')
                ->get();

            $purchase_array = [
                ['Date', 'No Purchase', 'Supplier', 'Product Code', 'Product', 'Quantity', 'Unitcost', 'Total', 'Created By']
            ];

            foreach ($purchases as $purchase) {
                $purchase_array[] = [
                    'Date' => $purchase->updated_at,
                    'No Purchase' => $purchase->purchase_no,
                    'Supplier' => $purchase->supplier_id,
                    'Product Code' => $purchase->code,
                    'Product' => $purchase->name,
                    'Quantity' => $purchase->quantity,
                    'Unitcost' => $purchase->unitcost,
                    'Total' => $purchase->total,
                    'Created By' => $purchase->created_by,
                ];
            }

            return $this->exportExcel($purchase_array);
        } catch (Exception $e) {
            return $this->ResError('Failed to export purchase report.');
        }
    }

    public function exportExcel($products)
    {
        ini_set('max_execution_time', 0);
        ini_set('memory_limit', '4000M');

        try {
            $spreadSheet = new Spreadsheet();
            $spreadSheet->getActiveSheet()->getDefaultColumnDimension()->setWidth(20);
            $spreadSheet->getActiveSheet()->fromArray($products);
            $Excel_writer = new Xls($spreadSheet);

            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename="purchase-report.xls"');
            header('Cache-Control: max-age=0');
            ob_end_clean();
            $Excel_writer->save('php://output');
            exit();
        } catch (Exception $e) {
            return $this->ResError('Failed to generate Excel report.');
        }
    }
}
