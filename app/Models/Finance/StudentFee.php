<?php
namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Model;

class StudentFee extends Model
{
    protected $fillable = ['student_id', 'level_id', 'total_fee', 'balance'];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function level()
    {
        return $this->belongsTo(Level::class);
    }
}
