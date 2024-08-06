<?php

namespace App\Models\Level;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class Stream extends Model
{
    use HasFactory, HasRoles, HasApiTokens;

    public $table = 'streams';

    protected $guarded = [];

    public function level()
    {
        return $this->belongsTo(Level::class);
    }

}
