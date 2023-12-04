<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Product\ProductController;
use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\Transaksi\TransaksiController;
use App\Http\Controllers\Api\Cart\CartController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);
Route::middleware(['auth:api'])->group(function () {

});
Route::middleware(['auth:api', 'role:pembeli'])->group(function () {

    Route::get('keranjang', [CartController::class,'index']);
    Route::get('checkout', [TransaksiController::class,'checkout']);
    Route::post('keranjang', [CartController::class,'store']);
    Route::get('total', [CartController::class,'total']);
    Route::get('user', [AuthController::class,'getuser']);
    Route::get('transaksi', [TransaksiController::class,'index']);
    Route::get('transaksi/{id}', [TransaksiController::class,'edit']);
});

Route::middleware(['auth:api', 'role:penjual'])->group(function () {
    // Route untuk penjual
    Route::resource('product', ProductController::class);


});

Route::get('product-customer', [ProductController::class,'index']);
Route::get('product-customer/{id}', [ProductController::class,'edit']);





