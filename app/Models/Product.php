<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table = "product";
    protected $guarded = [];

    function getAll()
    {
        return Product::get();
        //  return Product::paginate(10);
    }
    function getActive()
    {
        return Product::where('active', 1)->get();
    }

    function getStop()
    {
        return Product::where('active', 0)->get();
    }

    function getProduct($id)
    {
        return Product::find($id);
    }

    function deletes($id)
    {
        return Product::where('id', $id)->delete();
    }
    function getAllCategoryID($category_id)
    {
        return Product::where('category_id', $category_id)->where('active', 1)->get();
    }
    function getSearch($search)
    {
        return Product::where('name','LIKE','%'.$search.'%')->get();
       // return Product::where('name','LIKE','%'.$search.'%')->paginate(12);
        
    }
    function getAllNumBuy()
    {
        return Product::where('active', 1)->orderBy('num_buy', 'DESC')->get();
    }
    function category()
    {
        return $this->hasOne("App\Models\Category", 'id', 'category_id');
    }
    public function productImage()
    {
        return $this->hasMany('App\Models\Productimage', 'product_id', 'id');
    }
    function updateNum($id, $num_buy, $num)
    {
        Product::where('id', $id)
            ->update([
                'num_buy' => $num_buy,
                'num' => $num
            ]);
    }
}
