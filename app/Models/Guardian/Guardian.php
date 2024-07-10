<?php

namespace App\Models\Guardian;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class Guardian extends Model
{
    use HasFactory,HasRoles,HasApiTokens;

    protected $guarded = [];
}
