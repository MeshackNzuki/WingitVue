<?php

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Model;

class FeePayment extends Model
{
    protected $fillable = ['student_id', 'amount', 'payment_date'];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }
}
