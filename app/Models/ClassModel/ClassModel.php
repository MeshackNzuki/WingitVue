<?php

namespace App\Models\ClassModel;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class ClassModel extends Model
{
    use HasFactory, HasRoles, HasApiTokens;

    public $table = 'classes';

    protected $guarded = [];

}
