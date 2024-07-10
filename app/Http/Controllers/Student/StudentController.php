<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\Student\Student;
use App\Models\Grade;
use App\Models\ParentModel;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;


class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index($query='')
    {
        $studentData = Student::with('class');

        if ($query != '') {
            $students =  $studentData
            ->where('admission', 'like', "%{$query}%")
            ->paginate(20);

            return $this->ResSuccess($students);
           
        } else {
             $students =  $studentData->latest()->paginate(20);
             return $this->ResSuccess($students);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function create()
    {
        $classes = Grade::latest()->get();
        $parents = ParentModel::with('user')->latest()->get();

        return $this->ResSuccess([
            'classes' => $classes,
            'parents' => $parents
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $request->validate([
            'first_name'          => 'required|string|max:255',
            'second_name'         => 'required|string|max:255',
            'guardian_email'      => 'required|email|max:255',
            'phone'              => 'required|string|max:255',
            'dormitory'          => 'required|string|max:255',
            'photo'              => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'gender'             => 'required|string',
            'dateofbirth'        => 'required|date',
            'class_id'              => 'required|',
            'admission'          => 'required|string|max:255',
        ]);

        // Handle file upload (photo)
        if ($request->hasFile('photo')) {
            $photo = $request->file('photo')->store('students', 'public');
        } else {
            $photo = null; // Handle default photo or error scenario
        }

        // Create student record
        $student = Student::create([
            'first_name'    => $request->input('first_name'),
            'second_name'   => $request->input('second_name'),
            'guardian_email'=> $request->input('guardian_email'),
            'phone'         => $request->input('phone'),
            'dormitory'     => $request->input('dormitory'),
            'photo'         => $photo,
            'gender'        => $request->input('gender'),
            'date_of_birth' => $request->input('dateofbirth'),
            'class_id'         => $request->input('class_id'),
            'admission'     => $request->input('admission'),
        ]);

        return $this->ResSuccess($student, 201); // Return with HTTP status 201 (Created)
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Student $student)
    {
        return $this->ResSuccess($student);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Student $student)
    {
        $classes = Grade::latest()->get();
        $parents = ParentModel::with('user')->latest()->get();

        return $this->ResSuccess([
            'student' => $student,
            'classes' => $classes,
            'parents' => $parents
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Student $student)
    {
        $request->validate([
            'first_name'          => 'required|string|max:255',
            'second_name'         => 'required|string|max:255',
            'guardian_email'      => 'required|email|max:255',
            'phone'              => 'required|string|max:255',
            'dormitory'          => 'required|string|max:255',
            'photo'              => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'gender'             => 'required|string',
            'dateofbirth'        => 'required|date',
            'class_id'              => 'required|',
            'admission'          => 'required|string|max:255',
        ]);

        // Update student record
        $student->update([
            'first_name'    => $request->input('first_name'),
            'second_name'   => $request->input('second_name'),
            'guardian_email'=> $request->input('guardian_email'),
            'phone'         => $request->input('phone'),
            'dormitory'     => $request->input('dormitory'),
            'photo'         => $photo,
            'gender'        => $request->input('gender'),
            'date_of_birth' => $request->input('dateofbirth'),
            'class_id'         => $request->input('class_id'),
            'admission'     => $request->input('admission'),
        ]);

        // Handle file upload (photo) if provided
        if ($request->hasFile('photo')) {
            $photo = $request->file('photo')->store('students', 'public');
            $student->update(['photo' => $photo]);
        }

        return $this->ResSuccess($student);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Student $student)
    {
        // Delete related records if necessary (e.g., user, roles, etc.)

        $student->delete();

        return $this->ResSuccess(['message' => 'Student deleted successfully']);
    }
}
