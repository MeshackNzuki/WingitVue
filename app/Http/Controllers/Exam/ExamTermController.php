<?php

namespace App\Http\Controllers;

use App\Models\Exam\ExamTerm;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ExamTermController extends Controller
{
    /**
     * Display a listing of the exam terms.
     */
    public function index()
    {
        $examTerms = ExamTerm::all();
        return  $this->ResSuccess($examTerms);
    }

    /**
     * Store a newly created exam term in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'comments' => 'nullable|string',
        ]);

        $examTerm = ExamTerm::create([
            'name' => $request->name,
            'comments' => $request->comments,
        ]);

        return  $this->ResSuccess($examTerm, 201);
    }

    /**
     * Display the specified exam term.
     */
    public function show($id)
    {
        $examTerm = ExamTerm::findOrFail($id);
        return  $this->ResSuccess($examTerm);
    }

    /**
     * Show the form for editing the specified exam term.
     */
    public function edit($id)
    {
        // Typically used for showing a form in a web app, not needed for API
    }

    /**
     * Update the specified exam term in storage.
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'comments' => 'nullable|string',
        ]);

        $examTerm = ExamTerm::findOrFail($id);
        $examTerm->update([
            'name' => $request->name,
            'comments' => $request->comments,
        ]);

        return  $this->ResSuccess($examTerm);
    }

    /**
     * Remove the specified exam term from storage.
     */
    public function destroy($id)
    {
        $examTerm = ExamTerm::findOrFail($id);
        $examTerm->delete();

        return  $this->ResSuccess(['message' => 'Exam Term deleted successfully.']);
    }
}
