<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class Student extends Model
{
    use HasFactory, HasRoles, HasApiTokens;

    protected $guarded = [];

   // Define relationships and other methods as needed

   // Example of relationships:
    public function courses()
    {
        return $this->hasMany(Course::class);
    }

   // Example of accessor or mutator:
    public function getFullNameAttribute()
    {
        return "{$this->first_name} {$this->last_name}";
    }

    //Example of scope:
    public function scopeActive($query)
    {
        return $query->where('active', true);
    }
}
