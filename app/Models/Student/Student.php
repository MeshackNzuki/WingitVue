<?php

namespace App\Models\Student;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Level\Level;
use App\Models\Finance\StudentFee;
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

    public function level()
    {
        return $this->belongsTo(Level::class);
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

    public function payments()
    {
        return $this->hasMany(Payment::class);
    }

    public function studentFee()
    {
        return $this->hasOne(StudentFee::class);
    }
}
