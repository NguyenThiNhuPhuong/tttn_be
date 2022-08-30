<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Throwable;

use App\Models\Category;
use App\Models\User;
use App\Models\Product;
use Psy\Readline\Hoa\Console;

class ProductController extends Controller
{
    protected $product;
    protected $category;
    protected $user;

    function __construct()
    {
        $this->category = new Category();
        $this->product = new Product();
        $this->user = new User;
    }

    function add(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required',
                'content' => 'required',
                'price' => 'required',
                'content' => 'required',
                'num' => 'required',
                'image' => 'required',
            ]);
            $this->product->name = $request->name;
            $this->product->category_id = $request->category_id;
            $this->product->content = $request->content;
            $this->product->price = $request->price;
            $this->product->price_sale = $request->price_sale;
            $this->product->num = $request->num;
            $this->product->active = $request->active;
            $this->product->image = $request->image;
            /*  $this->product->created_by=$request->created_by;
            $this->product->updated_by=$request->updated_by; */
            $this->product->created_by = Auth::user()->id;
            $this->product->updated_by = Auth::user()->id;
            $this->product->save();

            return response()->json([
                'result' => true,
                'message' => 'Thêm sản phẩm thành công!',
                'product' => $this->product,
            ]);
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Thêm sản phẩm không thành công!',
                'error' =>  $err->getMessage(),
            ]);
        }
    }

    function edit(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required',
                'content' => 'required',
                'price' => 'required',
                'content' => 'required',
                'num' => 'required',
                'image' => 'required',
            ]);
            $this->product->find($request->id)->update([
                'name' => $request->name,
                'category_id' => $request->category_id,
                'content' => $request->content,
                'price' => $request->price,
                'price_sale' => $request->price_sale,
                'num' => $request->num,
                'active' => $request->active,
                'image' => $request->image,
                /* 'updated_by'=>$request->updated_by, */
                'updated_by' => Auth::user()->id,
            ]);
            return response()->json([
                'result' => true,
                'message' => 'Cập nhật sản phẩm thành công!',
                'data' => $this->product->find($request->id),
            ]);
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Cập nhật sản phẩm không thành công!',
                'error' =>  $err->getMessage(),
            ]);
        }
    }

    function listProduct()
    {
        return response()->json([
            'result' => true,
            'products' => $this->product->getAll()
        ]);
    }

    function product(Request $request)
    {
        return response()->json([
            'result' => true,
            'product' => $this->product->getProduct($request->id),
            'product_images' => $this->product->getProduct($request->id)->productImage
        ]);
    }

    function delete(Request $request)
    {
        $id = $request->id;
        $result = $this->product->deletes($id);
        if ($result) {
            return response()->json([
                'result' => true,
                'message' => "Xóa sản phẩm thành công!"
            ]);
        } else {
            return response()->json([
                'result' => false,
                'message' => "Xóa sản phẩm bị lỗi, vui lòng thử lại!"
            ]);
        }
    }
}