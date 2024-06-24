<?php

namespace App\Models\Hostel;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hostel extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'number_of_rooms',
        'photo',
    ];

    /**
     * Get the students that belong to the hostel.
     */
    public function students()
    {
        return $this->hasMany(Student::class);
    }
}
