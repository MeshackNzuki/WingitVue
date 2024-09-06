<?php

namespace App\Http\Controllers;

use App\Models\Mark;
use Illuminate\Http\Request;

class MarksController extends Controller
{
    // Store Marks for Students
    public function store(Request $request)
    {
        $validated = $request->validate([
            'class_id' => 'required|exists:classes,id',
            'subject_id' => 'required|exists:subjects,id',
            'students' => 'required|array',
            'students.*.id' => 'required|exists:students,id',
            'students.*.marks' => 'nullable|integer|min:0|max:100',
            'students.*.comments' => 'nullable|string',
        ]);

        foreach ($validated['students'] as $studentData) {
            // Check if mark already exists
            $mark = Mark::firstOrNew([
                'student_id' => $studentData['id'],
                'class_id' => $validated['class_id'],
                'subject_id' => $validated['subject_id']
            ]);

            // Update or create new entry
            $mark->marks = $studentData['marks'];
            $mark->comments = $studentData['comments'] ?? null;
            $mark->save();
        }

        return response()->json(['message' => 'Marks saved successfully!'], 200);
    }
}
