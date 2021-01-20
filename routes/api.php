<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

// Only need ip, status (banned or unbanned), and jail_name 
Route::post('ban_ip', 'Banned_IpController@banfromapi')->name('ban_ip_api');
Route::post('unban_ip', 'Banned_IpController@unbanfromapi')->name('unban_ip_api');