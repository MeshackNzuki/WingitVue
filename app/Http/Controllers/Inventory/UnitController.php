<?php

namespace App\Http\Controllers\Inventory;

use App\Models\Unit;
use App\Http\Requests\Unit\StoreUnitRequest;
use App\Http\Requests\Unit\UpdateUnitRequest;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;

class UnitController extends Controller
{
    public function index()
    {
        try {
            $units = Unit::where("user_id", auth()->id())
                ->select(['id', 'name', 'slug', 'short_code'])
                ->get();

            return $this->ResSuccess($units, 'Units fetched successfully.');
        } catch (\Exception $e) {
            return $this->ResError('Failed to fetch units.');
        }
    }

    public function show(Unit $unit)
    {
        try {
            $unit->loadMissing('products');

            return $this->ResSuccess($unit, 'Unit details fetched successfully.');
        } catch (\Exception $e) {
            return $this->ResError('Failed to fetch unit details.');
        }
    }

    public function store(StoreUnitRequest $request)
    {
        try {
            $unit = Unit::create([
                "user_id" => auth()->id(),
                'name' => $request->name,
                'slug' => Str::slug($request->name),
                'short_code' => $request->short_code,
            ]);

            return $this->ResSuccess($unit, 'Unit created successfully.');
        } catch (\Exception $e) {
            return $this->ResError('Failed to create unit.');
        }
    }

    public function update(UpdateUnitRequest $request, $slug)
    {
        try {
            $unit = Unit::where(["user_id" => auth()->id(), "slug" => $slug])->firstOrFail();
            $unit->name = $request->name;
            $unit->slug = Str::slug($request->name);
            $unit->short_code = $request->short_code;
            $unit->save();

            return $this->ResSuccess($unit, 'Unit updated successfully.');
        } catch (\Exception $e) {
            return $this->ResError('Failed to update unit.');
        }
    }

    public function destroy(Unit $unit)
    {
        try {
            $unit->delete();

            return $this->ResSuccess(null, 'Unit deleted successfully.');
        } catch (\Exception $e) {
            return $this->ResError('Failed to delete unit.');
        }
    }
}
