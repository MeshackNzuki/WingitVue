<?php


namespace App\Http\Exams\Controllers;

use App\Models\Paper;
use App\Models\Subject;
use Illuminate\Http\Request;

class PapersController extends Controller
{
    // Fetch all papers
    public function index()
    {
        $papers = Paper::with('subject')->get();
        return response()->json($papers);
    }

    // Store a new paper
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'subject_id' => 'required|exists:subjects,id',
            'exam_id' => 'required|exists:subjects,id',
            'comments' => 'nullable|string',
        ]);

        $paper = Paper::create($validated);
        return response()->json($paper, 201);
    }

    // Fetch a single paper
    public function show(Paper $paper)
    {
        $paper->load('subject');
        return response()->json($paper);
    }

    // Update an existing paper
    public function update(Request $request, Paper $paper)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'subject_id' => 'required|exists:subjects,id',
            'exam_id' => 'required|exists:subjects,id',
            'comments' => 'nullable|string',
        ]);

        $paper->update($validated);
        return response()->json($paper);
    }

    // Delete a paper
    public function destroy(Paper $paper)
    {
        $paper->delete();
        return response()->json(['message' => 'Paper deleted successfully']);
    }
}
