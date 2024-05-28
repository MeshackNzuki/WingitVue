<?php

namespace App\Http\Controllers;

use App\Models\staff;
use Illuminate\Http\Request;
use App\Http\Requests\StoreStaffRequest;
class StaffController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $query = '')
    {
        if ($query != '') {
            return response()->json(staff::Where('name', 'like',"%{$query}%")
            ->orWhere('id_number', 'like',"%{$query}%")->orWhere('employeeno', 'like',"%{$query}%")->paginate());
        } else {
            return response()->json(staff::paginate(20));
           
        }
        
        
                       
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StorestaffRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreStaffRequest $request)
    {
        staff::create($request->validated());

        return response()->json('success' ,200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\staff  $staff
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $staff = staff::find($id)->first();
        return $staff;
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdatestaffRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $staff = staff::find($id);
        $staff->employee_no = $request->employeeno;
        $staff->name = $request->name;
        $staff->id_number = $request->id_number;
        $staff->title = $request->title;
        $staff->phone = $request->phone;
        $staff->email = $request->email;
        $staff->save();
        response()->json("success", 200);
        return redirect()->route('staffs');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\staff  $staff
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        staff::find($id)->delete();
        return redirect()->route('staffs');
    }
}
