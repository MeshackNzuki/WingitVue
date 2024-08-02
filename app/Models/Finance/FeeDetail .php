<?php
namespace App\Models\Finance;

use Illuminate\Database\Eloquent\Model;

class FeeDetail extends Model
{
    protected $fillable = ['fee_structure_id', 'description', 'amount'];

    public function feeStructure()
    {
        return $this->belongsTo(FeeStructure::class);
    }
}
