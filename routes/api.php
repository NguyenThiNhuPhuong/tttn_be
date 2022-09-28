<?php

use App\Http\Controllers\CartController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\FeedbackController;
use App\Http\Controllers\SliderController;
use App\Http\Controllers\PersonalController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|Không lưu session
Bảo mạt api sử dụng json web JWT
*/

/* Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
}); */






//ADMIN

Route::middleware(['auth.admin'])->group(function () {
    //USER
    Route::post('user/registeradmin', [UserController::class, 'registerAdmin']);
    Route::get('user/list', [UserController::class, 'listUser']);


    //CATEGORY
    Route::post('category/add', [CategoryController::class, 'add']);
    Route::post('category/edit/{id}', [CategoryController::class, 'edit']);
    Route::post('category/delete/{id}', [CategoryController::class, 'delete']);
    Route::get('category/list', [CategoryController::class, 'listCategory']);

    //PRODUCT
    Route::post('product/add', [ProductController::class, 'add']);
    Route::post('product/edit/{id}', [ProductController::class, 'edit']);
    Route::post('product/delete/{id}', [ProductController::class, 'delete']);

    //ORDER
    Route::get('order/list', [OrderController::class, 'listOrder']);
    Route::post('order/edit/{id}', [OrderController::class, 'edit']);

    //SLIDER
    Route::post('slider/add', [SliderController::class, 'add']);
    Route::post('slider/edit/{id}', [SliderController::class, 'edit']);
    Route::post('slider/delete/{id}', [SliderController::class, 'delete']);

    //FEEDBACK
    Route::get('feedback/list', [FeedbackController::class, 'listFeedback']);
    Route::get('feedback/{id}', [FeedbackController::class, 'feedback']);
    Route::post('feedback/delete/{id}', [FeedbackController::class, 'delete']);
});

/******************************************************************************************************* */

//USER
Route::post('user/register', [UserController::class, 'register']);
Route::post('user/login', [UserController::class, 'login']);
Route::post('user/logout', [UserController::class, 'logout']);
Route::get('user/profile', [UserController::class, 'profile']);
Route::post('user/edit/{id}', [UserController::class, 'edit']);
Route::get('user/profile/{id}', [UserController::class, 'profileId']);

//PERSONAL
Route::get('personal/order/list', [PersonalController::class, 'listOrder']);
Route::get('personal/order/orderdetail/{id}', [PersonalController::class, 'orderDetail']);

//PRODUCT
Route::get('product/list/{id}', [ProductController::class, 'listProduct']);
Route::get('product/{id}', [ProductController::class, 'product']);
Route::get('product/listsearch/{search}', [ProductController::class, 'getSearchs']);
Route::get('product/listproduct/{id}', [ProductController::class, 'listProductAll']);

//SLIDER
Route::get('slider/list', [SliderController::class, 'listSlider']);
Route::get('slider/{id}', [SliderController::class, 'slider']);

//CATEGORY
Route::get('category/listactive', [CategoryController::class, 'listCategoryActive']);
Route::get('category/{id}', [CategoryController::class, 'category']);

//FEEDBACK
Route::post('feedback/add', [FeedbackController::class, 'add']);


//ORDER
Route::post('order/add', [OrderController::class, 'add']);
Route::get('order/orderDetail/{id}', [OrderController::class, 'orderDetail']);
Route::get('order/listOrderStatus', [OrderController::class, 'listOrderStatus']);

//ADDRESS
Route::get('address/listprovince', [AddressController::class, 'listProvince']);
Route::get('address/listdistrict', [AddressController::class, 'listDistrict']);
Route::get('address/listward', [AddressController::class, 'listWard']);




