<?php

namespace App\Models\Level;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class Level extends Model
{
    use HasFactory, HasRoles, HasApiTokens;

    public $table = 'levels';

    protected $guarded = [];

    public function feeStructures()
    {
        return $this->hasMany(FeeStructure::class);
    }

    public function streams()
    {
        return $this->hasMany(Stream::class);
    }

}
