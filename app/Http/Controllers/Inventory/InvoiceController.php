<?php

namespace App\Http\Controllers\Inventory;

use App\Models\Inventory\Customer;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Http\Requests\Invoice\StoreInvoiceRequest;

class InvoiceController extends Controller
{
    public function create(StoreInvoiceRequest $request, Customer $customer)
    {
        $customer = Customer::where('id', $request->get('customer_id'))->firstOrFail();
        $carts = Cart::content();

        return $this->ResSuccess([
            'customer' => $customer,
            'carts' => $carts,
        ]);
    }
}
