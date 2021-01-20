<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/updated-activity', 'TelegramBotController@updatedActivity');

Auth::routes();

Route::get('/', function(){
    return redirect(route('login'));
})->name('home');
   
Route::group(['middleware' => ['auth']], function() {
	// Using resource helper by Laravel.
    Route::resource('roles','RoleController',['except' => ['create','show','edit']]);
    Route::resource('users','UserController',['except' => ['create','show','edit']]);
    Route::resource('hosts','HostController',['except' => ['create','show','edit']]);
    Route::resource('filters','FilterController',['except' => ['create','show','edit']]);

    // Jails URL has something different. So, i use manual url routing.
    Route::get('jails','JailController@index')->name('jails.index');
    Route::get('jails/{host}','JailController@manage')->name('jails.manage');
    Route::post('jails','JailController@store')->name('jails.store');
    Route::patch('jails/{jail}/disable','JailController@disable')->name('jails.disable');
    Route::patch('jails/{jail}/enable','JailController@enable')->name('jails.enable');
    Route::get('jails/{host}/{jail}','JailController@detail')->name('jails.detail');
    Route::patch('jails/{jail}','JailController@update')->name('jails.update');

    // Trusted Ips also using manual url routing.
    Route::post('trusted_ip/{host}/{id}','Trusted_IpController@store')->name('trusted_ips.store');
    Route::delete('trusted_ip/{host}/{jail}/{id}','Trusted_IpController@destroy')->name('trusted_ips.destroy');

    // Banned Ips also using manual url routing.
    Route::post('banned_ip/{host}/{id}','Banned_IpController@store')->name('banned_ips.store');
    Route::delete('banned_ip/{host}/{jail}/{id}','Banned_IpController@destroy')->name('banned_ips.destroy');

    // Log route only have one function, index only.
    Route::get('logs','LogController@index')->name('logs.index');

    // Dashboard route only.
    Route::get('dashboard','DashboardController@index')->name('dashboard');
});