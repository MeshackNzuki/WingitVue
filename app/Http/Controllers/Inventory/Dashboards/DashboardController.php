<?php

namespace App\Http\Controllers\Inventory\Dashboards;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\Purchase;
use App\Models\Quotation;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $userId = auth()->id();

        // Fetch data
        $orders = Order::where('user_id', $userId)->count();
        $products = Product::where('user_id', $userId)->count();
        $purchases = Purchase::where('user_id', $userId)->count();

        $todayPurchases = Purchase::whereDate('date', today()->format('Y-m-d'))->count();
        $todayProducts = Product::whereDate('created_at', today()->format('Y-m-d'))->count();
        $todayQuotations = Quotation::whereDate('created_at', today()->format('Y-m-d'))->count();
        $todayOrders = Order::whereDate('created_at', today()->format('Y-m-d'))->count();

        $categories = Category::where('user_id', $userId)->count();
        $quotations = Quotation::where('user_id', $userId)->count();

        // Return API response
        return $this->ResSuccess([
            'products' => $products,
            'orders' => $orders,
            'purchases' => $purchases,
            'todayPurchases' => $todayPurchases,
            'todayProducts' => $todayProducts,
            'todayQuotations' => $todayQuotations,
            'todayOrders' => $todayOrders,
            'categories' => $categories,
            'quotations' => $quotations,
        ], 'Dashboard data retrieved successfully.');
    }
}
