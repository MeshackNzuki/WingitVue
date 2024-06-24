<?php

namespace App\Http\Controllers\Hostel;

use App\Models\Hostel\Hostel;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class HostelController extends Controller
{
    public function index()
    {
        $hostels = Hostel::latest()->paginate(10);
        return $this->ResSuccess($hostels);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'number_of_rooms' => 'required|integer',
            'photo' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // Handle file upload (photo)
        $photoPath = $request->file('photo')->store('hostels', 'public');

        $hostel = Hostel::create([
            'name' => $request->input('name'),
            'number_of_rooms' => $request->input('number_of_rooms'),
            'photo' => $photoPath,
        ]);
   
        return $this->ResSuccess($hostels ,201);
    }

    public function show(Hostel $hostel)
    {
        return $this->ResSuccess($hostels ,201);
    }

    public function update(Request $request, Hostel $hostel)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'number_of_rooms' => 'required|integer',
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // Update hostel record
        $hostel->update([
            'name' => $request->input('name'),
            'number_of_rooms' => $request->input('number_of_rooms'),
        ]);

        // Handle file upload (photo) if provided
        if ($request->hasFile('photo')) {
            Storage::disk('public')->delete($hostel->photo); // Delete old photo
            $photoPath = $request->file('photo')->store('hostels', 'public');
            $hostel->update(['photo' => $photoPath]);
        }
   
        return $this->ResSuccess($hostel);
    }

    public function destroy(Hostel $hostel)
    {
        // Delete hostel photo from storage
        Storage::disk('public')->delete($hostel->photo);

        // Delete hostel record
        $hostel->delete();

        return $this->ResSuccess(['message' => 'Hostel deleted successfully']);
    }
}
