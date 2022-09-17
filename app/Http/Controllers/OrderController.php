<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use App\Models\Category;
use App\Models\User;
use App\Models\Product;
use App\Models\Order;
use App\Models\Orderstatus;
use App\Models\Orderdetail;
use App\Models\Discount;
use Illuminate\Http\Request;
use Throwable;

class OrderController extends Controller
{
        protected $order;
        protected $orderstatus;
        protected $product;
        protected $user;
        protected $orderdetail;
        protected $discount;
        protected $category;
    
    function __construct()
    {
        $this->order = new Order;
        $this->orderstatus = new Orderstatus;
        $this->orderdetail = new Orderdetail;
        $this->discount = new Discount;
        $this->category = new Category;
        $this->product = new Product;
        $this->user = new User;
    }

    function add(Request $request)
    {
        try {
        $validated = $request->validate([
            'fullname' => 'required',
            'email' => 'email',
            'phone' => 'required',
            'address' => 'required',
            'cart'=>'required',
            'price_al'=>'required',
            'price_product'=>'required',
        ]);
        $ordercode = "ĐH" . date('hsi') . str_pad(mt_rand(1, 9999), 4, '0', STR_PAD_LEFT);
        $this->order->user_id = Auth::user()->id;
        $this->order->ordercode = $ordercode;
        $this->order->fullname = $request->fullname;
        $this->order->phone = $request->phone;
        $this->order->email = $request->email;
        $this->order->price_product = $request->price_product;
        $this->order->price_all = $request->price_al;
        $this->order->address  = $request->address;
        $this->order->note  = $request->note;

        $this->order->save();

        //addOrderDetail
    
        $order = $this->order->getOrderCode($ordercode);
        $order_id = $order->id;
        foreach ($request->cart as $item) {
            $this->orderdetail->create([
                'order_id' => $order_id,
                'product_id' => $item['id'],
                'num' =>  $item['cartNum'],
                'price' => $item['price'],
                'price_sale' => $item['price_sale']]);
            $n = $this->product->getProduct($item['id'])->num - $item['cartNum'];
            $num_buy = $this->product->getProduct($item['id'])->num_buy + $item['cartNum'];
            $this->product->updateNum($item['id'], $num_buy, $n);
        }
       
        
        return response()->json([
                'result' => true,
                'message' => 'Đặt hàng thành công!',
            ]);
        }catch (Throwable $err) {
                return response()->json([
                    'result' => false,
                    'message' => 'Đặt hàng lỗi, Vui lòng thử lại!',
                    'error' =>  $err->getMessage(),
                ]);
            }
    }

    function edit(Request $request)
    {
        try {
            $this->order->find($request->id)->update([
                'orderstatus_id' => $request->orderstatus_id,
            ]);
            return response()->json([
                'result' => true,
                'message' => 'Cập nhật đơn hàng thành công!',

            ]);
        } catch (Throwable $err) {
            return response()->json([
                'result' => false,
                'message' => 'Cập nhật đơn hàng không thành công!',
                'error' =>  $err->getMessage(),
            ]);
        }
    }


    function listOrder(Request $request){
        $listOrder=$this->order->getAll()->toArray();
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
    
    function listOrderStatus(Request $request){
        return response()->json([
            'result' => true,
            'listOrderStatus' => $this->orderstatus->getAll(),
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
