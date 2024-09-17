<?php
namespace App\Exam\Models;

use Illuminate\Database\Eloquent\Model;

class Paper extends Model
{
    protected $fillable = ['exam_id', 'subject_id', 'max_score'];

    // Many Papers belong to one Exam
    public function exam()
    {
        return $this->belongsTo(Exam::class);
    }

    // Many Papers belong to one Subject
    public function subject()
    {
        return $this->belongsTo(Subject::class);
    }

    // One Paper can have many Marks
    public function marks()
    {
        return $this->hasMany(Mark::class);
    }
}
