<?php

namespace App\Http\Controllers\Inventory;

use App\Models\Inventory\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $products = Product::all();

        if ($request->has('category_id')) {
            $products = Product::query()
                ->where('category_id', $request->get('category_id'))
                ->get();
        }

        return $this->ResSuccess($products);
    }
}
