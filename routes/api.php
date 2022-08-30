<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\FeedbackController;
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



//USER
Route::post('user/register', [UserController::class, 'register']);
Route::post('user/login', [UserController::class, 'login']);
Route::post('user/logout', [UserController::class, 'logout']);
Route::get('user/profile', [UserController::class, 'profile']);

//PRODUCT
Route::get('product/list', [ProductController::class, 'listProduct']);
Route::get('product/{id}', [ProductController::class, 'product']);

//FEEDBACK
Route::post('feedback/add', [FeedbackController::class, 'add']);


Route::middleware(['auth.admin'])->group(function () {
    //CATEGORY
    Route::post('category/add', [CategoryController::class, 'add']);
    Route::get('category/list', [CategoryController::class, 'listCategory']);
    Route::get('category/{id}', [CategoryController::class, 'category']);
    Route::post('category/edit/{id}', [CategoryController::class, 'edit']);
    Route::get('category/delete/{id}', [CategoryController::class, 'delete']);

    //PRODUCT
    Route::post('product/add', [ProductController::class, 'add']);
    Route::post('product/edit/{id}', [ProductController::class, 'edit']);
    Route::get('product/delete/{id}', [ProductController::class, 'delete']);
});