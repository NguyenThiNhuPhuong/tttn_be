<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Orderdetail extends Model
{
    use HasFactory;
    protected $table = "order_detail";
    protected $guarded = [];
    public $timestamps=false;
  
    function getAllProductID($product_id)
    {
        return Orderdetail::where('product_id', $product_id)->get();
    }
    function getAllOrderID($order_id)
    {
        return Orderdetail::where('order_id', $order_id)->get();
    }
    function product(){
        return $this->hasOne("App\Models\Product", 'id', 'product_id');
    }
}
