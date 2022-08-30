<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Productimage extends Model
{

    use HasFactory;
    protected $table = "product_image";
    protected $guarded = [];


    function getProductimage($id)
    {
        return Productimage::find($id);
    }
    function deletes($id)
    {
        return Productimage::where('id', $id)->delete();
    }
    public function product()
    {
        return $this->hasOne("App\Models\Product", 'id', 'product_id');
    }
}