<?php

namespace App\Http\Controllers\Inventory;

use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;

class CartController extends Controller
{
    public function add(Request $request)
    {
        // Validate request data
        $validatedData = $request->validate([
            'id' => 'required|numeric',
            'name' => 'required|string',
            'selling_price' => 'required|numeric',
            'qty' => 'required|numeric|min:1',
            'options' => 'nullable|array',
        ]);

        // Add item to cart
        Cart::add(
            $validatedData['id'],
            $validatedData['name'],
            $validatedData['qty'],
            $validatedData['selling_price'],
            0, // You might need to change this if you use a different cart setup
            $validatedData['options']
        );

        return $this->ResSuccess(Cart::content(), 'Item has been added to cart!');
    }

    public function update(Request $request, $rowId)
    {
        // Validate request data
        $validatedData = $request->validate([
            'qty' => 'required|numeric|min:1',
        ]);

        // Update item in cart
        $cartItem = Cart::get($rowId);
        if (!$cartItem) {
            return $this->ResError('Item not found in cart.');
        }

        Cart::update($rowId, $validatedData['qty']);

        return $this->ResSuccess(Cart::content(), 'Cart item has been updated!');
    }

    public function delete(Request $request, $rowId)
    {
        // Remove item from cart
        $cartItem = Cart::get($rowId);
        if (!$cartItem) {
            return $this->ResError('Item not found in cart.');
        }

        Cart::remove($rowId);

        return $this->ResSuccess(Cart::content(), 'Cart item has been removed!');
    }
}
