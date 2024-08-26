<?php

namespace App\Http\Controllers\Inventory\Product;

use App\Http\Controllers\Controller;
use App\Models\Inventory\Product;
use Exception;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xls;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Response;

class ProductExportController extends Controller
{
    /**
     * Export products to Excel.
     *
     * @return JsonResponse
     */
    public function create(): JsonResponse
    {
        $products = Product::all()->sortBy('name');

        $product_array[] = [
            'Product Name',
            'Product Slug',
            'Category Id',
            'Unit Id',
            'Product Code',
            'Stock',
            'Stock Alert',
            'Buying Price',
            'Selling Price',
            'Product Image',
            'Note'
        ];

        foreach ($products as $product) {
            $product_array[] = [
                $product->name,
                $product->slug,
                $product->category_id,
                $product->unit_id,
                $product->code,
                $product->quantity,
                $product->quantity_alert,
                $product->buying_price,
                $product->selling_price,
                $product->product_image,
                $product->note
            ];
        }

        try {
            return $this->exportToExcel($product_array);
        } catch (Exception $e) {
            return $this->ResError('Failed to export products: ' . $e->getMessage());
        }
    }

    /**
     * Export the data to an Excel file and return the response.
     *
     * @param array $products
     * @return JsonResponse
     */
    private function exportToExcel(array $products): JsonResponse
    {
        ini_set('max_execution_time', 0);
        ini_set('memory_limit', '4000M');

        try {
            $spreadSheet = new Spreadsheet();
            $spreadSheet->getActiveSheet()->getDefaultColumnDimension()->setWidth(20);
            $spreadSheet->getActiveSheet()->fromArray($products);
            $excel_writer = new Xls($spreadSheet);

            $filename = 'products.xls';
            $content = $this->saveToString($excel_writer);

            return Response::make($content, 200, [
                'Content-Type' => 'application/vnd.ms-excel',
                'Content-Disposition' => "attachment;filename=\"$filename\"",
                'Cache-Control' => 'max-age=0',
            ]);
        } catch (Exception $e) {
            return $this->ResError('Failed to generate the Excel file: ' . $e->getMessage());
        }
    }

    /**
     * Save the spreadsheet to a string.
     *
     * @param Xls $writer
     * @return string
     */
    private function saveToString(Xls $writer): string
    {
        ob_start();
        $writer->save('php://output');
        $content = ob_get_contents();
        ob_end_clean();
        return $content;
    }
}
