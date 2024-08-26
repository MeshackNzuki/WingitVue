<?php

namespace App\Http\Controllers\Inventory;

use App\Models\Customer;
use App\Http\Requests\Customer\StoreCustomerRequest;
use App\Http\Requests\Customer\UpdateCustomerRequest;
use Illuminate\Http\Request;
use Str;

class CustomerController extends Controller
{
    public function index(Request $request)
    {
        $customers = Customer::where('user_id', auth()->id())->get();

        return $this->ResSuccess($customers);
    }

    public function store(StoreCustomerRequest $request)
    {
        // Handle upload an image
        $image = '';
        if ($request->hasFile('photo')) {
            $image = $request->file('photo')->store('customers', 'public');
        }

        $customer = Customer::create([
            'user_id' => auth()->id(),
            'uuid' => Str::uuid(),
            'photo' => $image,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'shopname' => $request->shopname,
            'type' => $request->type,
            'account_holder' => $request->account_holder,
            'account_number' => $request->account_number,
            'bank_name' => $request->bank_name,
            'address' => $request->address,
        ]);

        return $this->ResSuccess($customer, 'New customer has been created!');
    }

    public function show($uuid)
    {
        $customer = Customer::where('uuid', $uuid)->firstOrFail();
        $customer->loadMissing(['quotations', 'orders']);

        return $this->ResSuccess($customer);
    }

    public function update(UpdateCustomerRequest $request, $uuid)
    {
        $customer = Customer::where('uuid', $uuid)->firstOrFail();

        // Handle upload image with Storage.
        $image = $customer->photo;
        if ($request->hasFile('photo')) {
            if ($customer->photo) {
                unlink(public_path('storage/') . $customer->photo);
            }
            $image = $request->file('photo')->store('customers', 'public');
        }

        $customer->update([
            'photo' => $image,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'shopname' => $request->shopname,
            'type' => $request->type,
            'account_holder' => $request->account_holder,
            'account_number' => $request->account_number,
            'bank_name' => $request->bank_name,
            'address' => $request->address,
        ]);

        return $this->ResSuccess($customer, 'Customer has been updated!');
    }

    public function destroy($uuid)
    {
        $customer = Customer::where('uuid', $uuid)->firstOrFail();
        if ($customer->photo) {
            unlink(public_path('storage/') . $customer->photo);
        }

        $customer->delete();

        return $this->ResSuccess(null, 'Customer has been deleted!');
    }
}
