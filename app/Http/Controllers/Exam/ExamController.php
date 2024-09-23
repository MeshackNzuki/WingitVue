<?php 

namespace App\Http\Controllers\Exam;

use App\Models\Exam\Exam;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ExamController extends Controller
{
    // Display a listing of exams
    public function index()
    {
        $exams = Exam::with(['term', 'level', 'examTerm'])->get();
        return $this->resSuccess($exams, 200);
    }

    // Store a newly created exam
    public function store(Request $request)
    
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'term_id' => 'required|exists:terms,id',
            'level_id' => 'required|exists:levels,id',
            'exam_term_id' => 'required|exists:exam_terms,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        $exam = Exam::create($validated);
        return $this->resSuccess($exam, 201);
    }

    // Display a specific exam
    public function show(Exam $exam)
    {
        return $this->resSuccess($exam, 200);
    }

    // Update a specific exam
    public function update(Request $request, Exam $exam)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'term_id' => 'required|exists:terms,id',
            'level_id' => 'required|exists:levels,id',
            'exam_term_id' => 'required|exists:exam_terms,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ]);

        $exam->update($validated);
        return $this->resSuccess($exam, 200);
    }

    // Delete a specific exam
    public function destroy(Exam $exam)
    {
        $exam->delete();
        return $this->resSuccess(null, 204);
    }
}
