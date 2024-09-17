<?php

namespace App\Exam\Models;

use Illuminate\Database\Eloquent\Model;

class ExamTerm extends Model
{
    protected $fillable = ['name', 'comments'];

    // One ExamTerm can have many Exams
    public function exams()
    {
        return $this->hasMany(Exam::class);
    }
}
