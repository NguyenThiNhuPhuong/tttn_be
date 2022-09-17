<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slider extends Model
{
    use HasFactory;
    protected $table = "slider";
    protected $guarded = [];

    function getAll()
    {
        return Slider::get();
    }
    function getActive()
    {
        return Slider::where('active', 1)->get();
    }
    function getStop()
    {
        return Slider::where('active', 0)->get();
    }
    function getSlider($id)
    {
        return Slider::find($id);
    }
    function deletes($id)
    {
        return Slider::where('id', $id)->delete();
    }
}
