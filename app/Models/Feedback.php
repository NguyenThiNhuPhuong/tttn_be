<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Feedback extends Model
{
    use HasFactory;

    protected $table = 'feedback';
    public $timestamps = false;
    protected $guarded = [];

    function getAll()
    {
       // return Feedback::paginate(16);
       return  Feedback::get();
    }
    function getFeedback($id)
    {
        return Feedback::find($id);
    }
    function deletes($id)
   {
      return Feedback::where('id', $id)->delete();
   }
   
}
