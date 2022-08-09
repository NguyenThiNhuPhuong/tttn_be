<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\OrderController;
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

//CATEGORY
Route::post('category/add', [CategoryController::class, 'add']);
Route::get('category/list', [CategoryController::class, 'listCategory']);
Route::get('category/{id}', [CategoryController::class, 'category']);
Route::post('category/edit/{id}', [CategoryController::class, 'edit']);
Route::get('category/delete/{id}', [CategoryController::class, 'delete']);
