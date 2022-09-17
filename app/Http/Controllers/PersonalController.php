<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Throwable;

use App\Models\Category;
use App\Models\User;
use App\Models\Product;
use App\Models\Productimage;
use App\Models\Orderdetail;
use App\Models\Orderstatus;
use App\Models\Order;

use Illuminate\Http\Request;

class PersonalController extends Controller
{
    protected $product;
    protected $productimage;
    protected $orderdetail;
    protected $order;
    protected $orderstatus;
    protected $category;
    protected $user;

    function __construct()
    {
        $this->category = new Category();
        $this->product = new Product();
        $this->productimage = new Productimage();
        $this->user = new User;
        $this->orderdetail = new Orderdetail;
        $this->order = new Order;
        $this->orderstatus = new Orderstatus;
        
    }

    function listOrder(Request $request){
        $listOrder=$this->order->getOrderUser( Auth::user()->id)->toArray();
        $newListOrder=array_map(function($item){
            $orderstatus_id_text= $this->orderstatus->getOrderStatus($item['orderstatus_id'])->name;
            $item['orderstatus_id_text']=$orderstatus_id_text;
            return $item;    
        },$listOrder);
        return response()->json([
            'result' => true,
            'listOrder' => $newListOrder ,
        ]);
    }

    function orderDetail(Request $request){

        $order=$this->order->getOrderId($request->id)->toArray();
        $orderstatus_id=$this->order->getOrderId($request->id)->orderstatus_id;
        $orderstatus_id_text= $this->orderstatus->getOrderStatus($orderstatus_id)->name;
        $order['orderstatus_id_text']=$orderstatus_id_text;

        $orderDetail=$this->orderdetail->getAllOrderID($request->id)->toArray();
        $newOrderDetail=array_map(function($item){
            $product_name= $this->product->getProduct($item['product_id'])->name;
            $product_image= $this->product->getProduct($item['product_id'])->image;
            $item['product_name']= $product_name;
            $item['product_image']=$product_image;
            return $item;    
        },$orderDetail);
        
        return response()->json([
            'result' => true,
            'order' => $order,
            'orderDetail' => $newOrderDetail,
          
        ]);

    }
    
}
