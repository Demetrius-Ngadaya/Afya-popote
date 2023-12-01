<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Doctor extends Model
{
    use HasFactory;

    //these are fillable input
    protected $fillable = [
        'doc_id',
        'category',
        'patients',
        'experience',
        'bio_data',
        'status',
    ];
// Doctor model
public function appointments()
{
    return $this->hasMany(Appointments::class, 'doc_id', 'doc_id');
}

    //state this is belong to user table
    public function user(){
        return $this->belongsTo(User::class);
    }

}
