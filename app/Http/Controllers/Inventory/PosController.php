<?php

namespace App\Http\Controllers\Inventory;

use App\Models\Inventory\Product;
use App\Models\Inventory\Customer;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;

class PosController extends Controller
{
    public function index(Request $request)
    {
        $products = Product::with(['category', 'unit'])->get();
        $customers = Customer::all()->sortBy('name');
        $carts = Cart::content();

        return $this->ResSuccess([
            'products' => $products,
            'customers' => $customers,
            'carts' => $carts,
        ]);
    }

    public function addCartItem(Request $request)
    {
        $rules = [
            'id' => 'required|numeric',
            'name' => 'required|string',
            'selling_price' => 'required|numeric',
        ];

        $validatedData = $request->validate($rules);

        Cart::add(
            $validatedData['id'],
            $validatedData['name'],
            1,
            $validatedData['selling_price'],
            1,
            (array)$options = null
        );

        return $this->ResSuccess('Product has been added to cart!');
    }

    public function updateCartItem(Request $request, $rowId)
    {
        $rules = [
            'qty' => 'required|numeric',
            'product_id' => 'numeric'
        ];

        $validatedData = $request->validate($rules);

        if ($validatedData['qty'] > Product::where('id', intval($validatedData['product_id']))->value('quantity')) {
            return $this->ResError('The requested quantity is not available in stock.');
        }

        Cart::update($rowId, $validatedData['qty']);

        return $this->ResSuccess('Product has been updated in cart!');
    }

    public function deleteCartItem(String $rowId)
    {
        Cart::remove($rowId);

        return $this->ResSuccess('Product has been deleted from cart!');
    }
}
