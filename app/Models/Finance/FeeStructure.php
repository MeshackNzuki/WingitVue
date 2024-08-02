<?php

namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Model;

class FeeStructure extends Model
{
    protected $fillable = ['level_id', 'total_fee'];

    public function level()
    {
        return $this->belongsTo(Level::class);
    }

    public function feeDetails()
    {
        return $this->hasMany(FeeDetail::class);
    }
}
