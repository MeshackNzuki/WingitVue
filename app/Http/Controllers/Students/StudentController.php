<?php

namespace App\Http\Controllers;
use App\Models\student;
use Illuminate\Http\Request;
use App\Http\Requests\StorestudentRequest;
use App\Http\Requests\UpdatestudentRequest;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $query = '')
    {
        //where('name', 'like',"%{$query}%")

        if ($query != '') {
            return response()->json(
                student::where('class', '<', '5')
                    ->where('adm', 'like', "%{$query}%")
                    ->paginate(80)
            );
        } else {
            return response()->json(student::where('class', '<', '5')->paginate(80));
        }
    }
    public function alumni(Request $request, $query = '')
    {
        if ($query != '') {
            return response()->json(
                student::where('class', '<', '4')
                    ->where('adm', 'like', "%{$query}%")
                    ->paginate(80)
            );
        } else {
            return response()->json(student::where('class', '>', '4')->paginate(80));
        }
    }
    /** * Store a newly created resource in storage. * * @param \App\Http\Requests\StorestudentRequest $request * @return \Illuminate\Http\Response */ public function store(StorestudentRequest $request)
    {
        student::create($request->validated());
        return response()->json('success', 200);
    } /** * Display the specified resource. * * @param \App\Models\student $student * @return \Illuminate\Http\Response */
    public function show($id)
    {
        $student = student::find($id)->first();
        return $student;
    } /** * Show the form for editing the specified resource. * * @param \App\Models\student $student * @return \Illuminate\Http\Response */
    public function edit(student $student)
    {
        return response()->json('student.edit', ['student' => $student]);
    } /** * Update the specified resource in storage. * * @param \App\Http\Requests\UpdatestudentRequest $request * @return \Illuminate\Http\Response */
    public function update(UpdatestudentRequest $request, $id)
    {
        $student = student::find($id);
        $student->name = $request->name;
        $student->address = $request->address;
        $student->gender = $request->gender;
        $student->class = $request->class;
        $student->age = $request->age;
        $student->phone = $request->phone;
        $student->email = $request->email;
        $student->save();
        response()->json("success", 200);
        return redirect()->route('students');
    }
    public function promote_all(Request $request)
    {
        student::increment('class', 1);
    }
    public function demote_all(Request $request)
    {
        student::decrement('class', 1);
    }
    public function promote_one_by_one(Request $request, $param)
    {
        student::where('adm', $param)->increment('class', 1);
    }
    public function demote_one_by_one(Request $request, $param)
    {
        student::where('adm', $param)->decrement('class', 1);
    } /** * Remove the specified resource from storage. * * @param \App\Models\student $student * @return \Illuminate\Http\Response */
    public function destroy($id)
    {
        student::find($id)->delete();
        return redirect()->route('students');
    }
}
