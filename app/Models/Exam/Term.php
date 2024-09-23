<?php
namespace App\Models\Exam;

use Illuminate\Database\Eloquent\Model;

class Term extends Model
{
    protected $fillable = [];


    public function exam()
    {
        return $this->hasMany(Exam::class);
    }
}
