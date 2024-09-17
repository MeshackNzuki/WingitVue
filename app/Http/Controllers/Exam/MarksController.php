<?php

namespace App\Http\ExamControllers;

use App\Models\Mark;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

class MarksController extends Controller
{
    // Store Marks for Students
    public function store(Request $request)
    {
        $validated = $request->validate([
            'exam_id' => 'required|exists:exams,id', 
            'subject_id' => 'required|exists:subjects,id',
            'students' => 'required|array',
            'students.*.id' => 'required|exists:students,id',
            'students.*.marks' => 'nullable|integer|min:0|max:100',
            'students.*.comments' => 'nullable|string',
        ]);

        foreach ($validated['students'] as $studentData) {
            // Check if the mark already exists
            $mark = Mark::firstOrNew([
                'student_id' => $studentData['id'],
                'exam_id' => $validated['exam_id'], 
                'subject_id' => $validated['subject_id']
            ]);

            // Update or create a new entry
            $mark->marks = $studentData['marks'];
            $mark->comments = $studentData['comments'] ?? null;
            $mark->save();
        }

        return $this->ResSuccess(['message' => 'Marks saved successfully!'], 200);
    }
}
