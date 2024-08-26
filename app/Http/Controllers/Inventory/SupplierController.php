<?php

namespace App\Http\Controllers\Inventory;

use App\Models\Inventory\Supplier;
use App\Http\Requests\Supplier\StoreSupplierRequest;
use App\Http\Requests\Supplier\UpdateSupplierRequest;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;

class SupplierController extends Controller
{
    public function index()
    {
        try {
            $suppliersCount = Supplier::where("user_id", auth()->id())->count();

            return $this->ResSuccess($suppliersCount, 'Suppliers count fetched successfully.');
        } catch (\Exception $e) {
            return $this->ResError('Failed to fetch suppliers count.');
        }
    }

    public function store(StoreSupplierRequest $request)
    {
        try {
            $image = "";
            if ($request->hasFile('photo')) {
                $image = $request->file('photo')->store("suppliers", "public");
            }

            $supplier = Supplier::create([
                "user_id" => auth()->id(),
                "uuid" => Str::uuid(),
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

            return $this->ResSuccess($supplier, 'Supplier created successfully.');
        } catch (\Exception $e) {
            return $this->ResError('Failed to create supplier.');
        }
    }

    public function show($uuid)
    {
        try {
            $supplier = Supplier::where("uuid", $uuid)->firstOrFail();
            $supplier->loadMissing('purchases');

            return $this->ResSuccess($supplier, 'Supplier details fetched successfully.');
        } catch (\Exception $e) {
            return $this->ResError('Failed to fetch supplier details.');
        }
    }

    public function update(UpdateSupplierRequest $request, $uuid)
    {
        try {
            $supplier = Supplier::where("uuid", $uuid)->firstOrFail();

            /**
             * Handle upload image with Storage.
             */
            $image = $supplier->photo;
            if ($request->hasFile('photo')) {

                // Delete Old Photo
                if ($supplier->photo) {
                    unlink(public_path('storage/') . $supplier->photo);
                }

                $image = $request->file('photo')->store("suppliers", "public");
            }

            $supplier->update([
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'photo' => $image,
                'shopname' => $request->shopname,
                'type' => $request->type,
                'account_holder' => $request->account_holder,
                'account_number' => $request->account_number,
                'bank_name' => $request->bank_name,
                'address' => $request->address,
            ]);

            return $this->ResSuccess($supplier, 'Supplier updated successfully.');
        } catch (\Exception $e) {
            return $this->ResError('Failed to update supplier.');
        }
    }

    public function destroy($uuid)
    {
        try {
            $supplier = Supplier::where("uuid", $uuid)->firstOrFail();

            /**
             * Delete photo if exists.
             */
            if ($supplier->photo) {
                unlink(public_path('storage/suppliers/') . $supplier->photo);
            }

            $supplier->delete();

            return $this->ResSuccess(null, 'Supplier deleted successfully.');
        } catch (\Exception $e) {
            return $this->ResError('Failed to delete supplier.');
        }
    }
}
