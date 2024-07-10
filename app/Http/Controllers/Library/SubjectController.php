<?php

namespace App\Http\Controllers\Library;

use App\Http\Controllers\Controller;
use App\Models\Library\Subject;
use App\Http\Requests\Library\StoreSubjectRequest;
use App\Http\Requests\Library\UpdateSubjectRequest;


class SubjectController extends Controller
{


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $categories = Subject::all();
        return $this->ResSuccess($categories);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Subject.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\Library\StoreSubjectRequest  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(StoreSubjectRequest $request)
    {
        $Subject = Subject::create($request->validated());
        return $this->ResSuccess($Subject, 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Library\Subject  $Subject
     * @return \Illuminate\Http\Response
     */
    public function edit(Subject $Subject)
    {
        return view('Subject.edit', [
            'Subject' => $Subject
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\Library\UpdateSubjectRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(UpdateSubjectRequest $request, $id)
    {
        $Subject = Subject::findOrFail($id);
        $Subject->update($request->validated());
        return $this->ResSuccess($Subject);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $Subject = Subject::findOrFail($id);
        $Subject->delete();
        return $this->ResSuccess(['message' => 'Subject deleted successfully.']);
    }
}
