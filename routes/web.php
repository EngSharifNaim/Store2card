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
Route::get('/dashboard','HomeController@dashboard');
Route::get('/','HomeController@index');

Route::middleware(['auth'])->group(function () {
    Route::get('products','ProductController@index');
    Route::get('products/category/{category}','ProductController@show');
    Route::get('products/edit/{id}','ProductController@edit');
    Route::post('products/update','ProductController@update');
    Route::get('offers','ProductController@offers');
    Route::get('product/create',function (){
        return view('dashboard.products.create');
    });
    Route::post('product/store','ProductController@store');


    Route::get('copons','CoponController@index');
    Route::get('copons/list/{id}','CoponController@show');
    Route::post('copons/store_cote','CoponController@store_cote');
    Route::get('copons/generate_cote','CoponController@generate_cote');
    Route::get('messages','MessageController@index');
    Route::get('orders','OrderController@index');
    Route::get('orders/{status}','OrderController@index_filter');
    Route::post('send_promo','UserController@send_promo');


});

Route::get('fetch','HomeController@fetch');

Route::get('users','UserController@index');
Route::get('user','UserController@index');
Route::get('test','UserController@index');

Route::get('add_user',function ()
{
    return view('dashboard.users.create');
});
Route::get('edit_user/{userId}','UserController@edit');
Route::get('user_profile/{id}','UserController@user_profile');


Route::get('admins','UserController@admins');
Route::get('add_admin','UserController@add_admin');
Route::get('add_master','UserController@add_master');
Route::get('masters','UserController@masters');
Route::get('owners','UserController@owners');
Route::get('markets','MarketController@index');
Route::get('categories','CategoryController@index');
Route::post('categories','CategoryController@store');
Route::get('payments','PaymentController@index');
Route::get('settings','HomeController@settings');
Route::get('sliders','HomeController@sliders');
Route::get('contracts','ContractController@index');
Route::get('apis','HomeController@apis');
Route::get('add_category','CategoryController@create');
Route::get('edit_category/{id}','CategoryController@edit');
Route::post('edit_category','CategoryController@update');

Route::post('change_slider','SliderController@update');


Route::get('add_market','MarketController@create');
Route::post('add_market','MarketController@store');

Route::get('edit_market/{market}','MarketController@edit');
Route::post('update_market','MarketController@update');
Route::get('market_products/{id}','MarketController@market_products');
Route::get('market_users/{id}','MarketController@market_users');

Auth::routes();

Route::get('/import',function (){
   return view('banck');
});
Route::post('import','HomeController@import');
