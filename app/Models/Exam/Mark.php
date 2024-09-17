<?php

namespace App\Exam\Models;
use Illuminate\Database\Eloquent\Model;

class Mark extends Model
{
    protected $fillable = ['paper_id', 'student_id', 'score'];

    // Many Marks belong to one Paper
    public function paper()
    {
        return $this->belongsTo(Paper::class);
    }

    // Many Marks belong to one Student (assuming you have a Student model)
    public function student()
    {
        return $this->belongsTo(Student::class);
    }
}
