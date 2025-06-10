<?php

use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');

Route::get('/user/check', [UserController::class, 'checkData'] )->middleware('auth:api');
Route::post('/user/create', [UserController::class, 'store']);