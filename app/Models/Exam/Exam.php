<?php
namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Model;
use app\Http\Models\Level\Level;
class Exam extends Model
{
    protected $fillable = ['exam_term_id', 'level_id', 'name', 'comments'];


    public function examTerm()
    {
        return $this->belongsTo(ExamTerm::class);
    }

  
    public function Level()
    {
        return $this->belongsTo(Level::class);
    }

    public function Term()
    {
        return $this->belongsTo(Term::class);
    }

    public function papers()
    {
        return $this->hasMany(Paper::class);
    }
}
