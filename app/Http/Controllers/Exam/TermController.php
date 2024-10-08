<?php

namespace App\Http\Controllers;

use App\Models\Exam\Term;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TermController extends Controller
{
    // Display a listing of the resource.
    public function index()
    {
        $terms = Term::all();
         return $this->ResSuccess($terms);
    }

    // Store a newly created resource in storage.
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'year' => 'required|digits:4|integer|min:1900',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        $term = Term::create($request->all());
         return $this->ResSuccess($term, 201);
    }

    // Display the specified resource.
    public function show(Term $term)
    {
         return $this->ResSuccess($term);
    }

    // Update the specified resource in storage.
    public function update(Request $request, Term $term)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'year' => 'required|digits:4|integer|min:1900',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        $term->update($request->all());
         return $this->ResSuccess($term);
    }

    // Remove the specified resource from storage.
    public function destroy(Term $term)
    {
        $term->delete();
         return $this->ResSuccess(['message' => 'Term deleted successfully']);
    }
}
