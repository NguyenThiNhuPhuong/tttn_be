<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Throwable;

use App\Models\Category;
use App\Models\User;
use App\Models\Product;

class CategoryController extends Controller
{
    protected $category;
    protected $product;
    protected $user;

    function __construct()
    {
        $this->category = new Category;
        $this->product = new Product;
        $this->user = new User;
    }

    function add(Request $request)
    { 
        try{
             $validated = $request->validate([
                 'name' => 'required|unique:category',
             ]);
             $this->category->name = $request->name;
             $this->category->active = $request->active;
             /* $this->category->created_by=$this->user->userLogin()->id;
             $this->category->updated_by=$this->user->userLogin()->id;  */
             $this->category->created_by=$request->created_by;
             $this->category->updated_by=$request->updated_by; 
         
             $this->category->save(); 
             return response()->json([
                 'result' => true,
                 'message' => 'Thêm danh mục thành công!',
                 'data'=> $this->category,
                 
            ]); 
        }catch (Throwable $err){
            return response()->json([
                'result' => false,
                'message' => 'Thêm danh mục lỗi!',
                'error'=>  $err->getMessage(),
            ]);
           
        }
       
    }

    function listCategory(){
       
        return response()->json([
            'result' => true,
            'data'=> $this->category->getAll(),
    ]);
       
    }

    function category($id){
       
        return response()->json([
            'result' => true,
            'data'=> $this->category->getCategory($id),
    ]);
    }

    function edit(Request $request)
    {   try{
             $this->category->find($request->id)->update([
                'name' => $request->name,
                'active' => $request->active,
                /* 'updated_by'=>$this->user->userLogin()->id, */
                'updated_by'=> $request->updated_by, 
            ]);
            return response()->json([
                'result' => true,
                'message' => 'Cập nhật danh mục thành công!',
                'data'=>  $this->category->getCategory($request->id)
                
            ]);
        }catch (Throwable $err){
            return response()->json([
                'result' => false,
                'message' => 'Cập nhật danh mục không thành công!',
                'error'=>  $err->getMessage(),
            ]);
           
        }
    }

    function delete(Request $request)
    {
        $temp = $this->product->getAllCategoryID($request->id);
        if (count($temp) == 0) {
            $result = $this->category->deletes($request->id);
            if ($result) {
                return response()->json([
                    'result'=> true,
                    'message' => 'Xóa danh mục thành công!'
                ]);
            } else {
                return response()->json([
                    'result'=> false,
                    'message' => 'Xóa danh mục bị lỗi, vui lòng thử lại!'
                ]);
            }
        } else {
            return response()->json([
                'result'=> false,
                'message' => 'Danh mục đang chứa sản phẩm, không thể xóa!'
            ]);
        }
    }
}
