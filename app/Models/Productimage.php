<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Productimage extends Model
{

    use HasFactory;
    protected $table = "product_image";
    public $timestamps = false;
    protected $guarded = [];


    function getImage($id)
    {
        return Productimage::find($id);
    }
    function getProductimage($product_id)
    {
        return  Productimage::where('product_id', $product_id)->get();
    }
    function deletes($id)
    {
        return Productimage::where('id', $id)->delete();
    }
    function deleteProductId($product_id)
    {
        return Productimage::where('product_id', $product_id)->delete();
    }
    public function product()
    {
        return $this->hasOne("App\Models\Product", 'id', 'product_id');
    }
}