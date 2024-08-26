<?php

namespace App\Http\Controllers\Inventory\Order;

use App\Models\Inventory\Customer;
use App\Models\Inventory\Order;
use App\Models\Inventory\OrderDetails;
use App\Models\Inventory\Product;

use App\Http\Controllers\Controller;
use App\Mail\StockAlert;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class DueOrderController extends Controller
{
    public function index(Request $request)
    {
        $orders = Order::where('due', '>', 0)
            ->latest()
            ->with('customer')
            ->get();

        return $this->ResSuccess($orders, 'Due orders retrieved successfully.');
    }

    public function show(Order $order)
    {
        $order->loadMissing(['customer', 'details']);

        return $this->ResSuccess($order, 'Order details retrieved successfully.');
    }

    public function edit(Order $order)
    {
        $order->loadMissing(['customer', 'details']);

        $customers = Customer::select(['id', 'name'])->get();

        return $this->ResSuccess([
            'order' => $order,
            'customers' => $customers
        ], 'Edit order data retrieved successfully.');
    }

    public function update(Request $request, Order $order)
    {
        $rules = [
            'pay' => 'required|numeric'
        ];

        $validatedData = $request->validate($rules);

        $mainPay = $order->pay;
        $mainDue = $order->due;

        $paidDue = $mainDue - $validatedData['pay'];
        $paidPay = $mainPay + $validatedData['pay'];

        $order->update([
            'due' => $paidDue,
            'pay' => $paidPay
        ]);

        // No more due
        if ($paidDue == 0) {
            $order->update([
                'order_status' => 1
            ]);

            $products = OrderDetails::where('order_id', $order->id)->get();
            $stockAlertProducts = [];

            foreach ($products as $product) {
                $productEntity = Product::find($product->product_id);
                $newQty = $productEntity->quantity - $product->quantity;

                if ($newQty < $productEntity->quantity_alert) {
                    $stockAlertProducts[] = $productEntity;
                }

                $productEntity->update(['quantity' => $newQty]);
            }

            if (count($stockAlertProducts) > 0) {
                $listAdmin = User::pluck('email')->toArray();
                Mail::to($listAdmin)->send(new StockAlert($stockAlertProducts));
            }
        }

        return $this->ResSuccess([], 'Due amount has been updated successfully.');
    }
}
