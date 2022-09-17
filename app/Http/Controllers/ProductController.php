<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Throwable;

use App\Models\Category;
use App\Models\User;
use App\Models\Product;
use App\Models\Productimage;
use App\Models\Orderdetail;

use Psy\Readline\Hoa\Console;

class ProductController extends Controller
{
    protected $product;
    protected $productimage;
    protected $orderdetail;
    protected $category;
    protected $user;

    function __construct()
    {
        $this->category = new Category();
        $this->product = new Product();
        $this->productimage = new Productimage();
        $this->user = new User;
        $this->orderdetail = new Orderdetail;
        
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
                'listimage' => 'required',
            ]);
            $this->product->name = $request->name;
            $this->product->category_id = $request->category_id;
            $this->product->content = $request->content;
            $this->product->price = $request->price;
            $this->product->price_sale = $request->price_sale;
            $this->product->num = $request->num;
            $this->product->active = $request->active;
            $this->product->image = $request->image;
            $this->product->created_by = Auth::user()->id;
            $this->product->updated_by = Auth::user()->id;
            $this->product->save();
            $product_id =$this->product->id;

            //add product_image 

            foreach ($request->listimage as $val) {
                $this->productimage->create([

                    'product_id' => $product_id,
                    'image' =>  $val
                   ]);
            }
            return response()->json([
                'result' => true,
                'message' => 'Thêm sản phẩm thành công!',
               
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
                'listimage' => 'required',
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
                'updated_by' => Auth::user()->id,
            ]);
            //update product_image 

            foreach ($request->listimage as $val) {
                $this->productimage->find($val['id'])->update([
                    'image' =>  $val['image'],
                   ]);
            }
            return response()->json([
                'result' => true,
                'message' => 'Cập nhật sản phẩm thành công!',
            ]);
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Cập nhật sản phẩm không thành công!',
                'error' =>  $err->getMessage(),
            ]);
        }
    }

    function listProduct(Request $request)
    {
        if ($request->id != 'list') {
            return response()->json([
                'result' => true,
                'products' => $this->category->getCategory($request->id)->product,
            ]);
        } else {
            $products = $this->product->getAll()->toArray();
            $newProducts = array_map(function ($val) {
                $created_by_text = $this->user->getUser($val['created_by'])['name'];
                $updated_by_text = $this->user->getUser($val['updated_by'])['name'];
                $category_id_text = $this->category->getCategory($val['category_id'])['name'];
                $val['created_by_text'] = $created_by_text;
                $val['updated_by_text'] = $updated_by_text;
                $val['category_id_text'] = $category_id_text;
                return $val;
            }, $products );
            return response()->json([
                'result' => true,
                'products' => $newProducts,
            ]);
        }
    }
    function getSearchs(Request $request)
    {
        return response()->json([
            'result' => true,
            'products' => $this->product->getSearch($request->search),
        ]);
    }
    
    function listProductAll(Request $request)
    {
        if($request->search!=""){
            return response()->json([
                'result' => true,
                'products' => $this->product->getSearch($request->search),
            ]);
        }else{
        if ($request->id != 'list') {
            return response()->json([
                'result' => true,
                'products' => $this->category->getCategory($request->id)->product,
            ]);
        } else {
            $products = $this->product->getAll()->toArray();
            $newProducts = array_map(function ($val) {
                $created_by_text = $this->user->getUser($val['created_by'])['name'];
                $updated_by_text = $this->user->getUser($val['updated_by'])['name'];
                $category_id_text = $this->category->getCategory($val['category_id'])['name'];
                $val['created_by_text'] = $created_by_text;
                $val['updated_by_text'] = $updated_by_text;
                $val['category_id_text'] = $category_id_text;
                return $val;
            }, $products );
            return response()->json([
                'result' => true,
                'products' => $newProducts,
            ]);
        }
        return response()->json([
            'result' => true,
            'products' => $this->product->getSearch($request->search),
        ]);
    }
    }

    function product(Request $request)
    {
        return response()->json([
            'result' => true,
            'product' => $this->product->getProduct($request->id),
            /* 'product_images' => $this->product->getProduct($request->id)->productImage */
            'product_images' => $this->productimage->getProductimage($request->id)
        ]);
    }

    function delete($id)
    {
        $temp = $this->orderdetail->getAllProductID($id);
        if (count($temp) == 0) {
            $this->productimage->deleteProductId($id);
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
         
         
        } else {
            return response()->json([
                'result' => false,
                'message' => 'Sản phẩm đang có đơn hàng, không thể xóa!'
            ]);
        }
    }
}
