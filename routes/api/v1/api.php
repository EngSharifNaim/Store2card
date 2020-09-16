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
|Coded By: Sharif Naim
|start date: 30.4.2020
*/

Route::prefix('user')->group(function (){
        Route::post('login','api\v1\LoginController@login');
        Route::post('register','api\v1\UserController@register');
        Route::get('delete/{id}','api\v1\UserController@destroy');
        Route::post('add_user','api\v1\UserController@add_user');
        Route::post('update_user','api\v1\UserController@update_user');
        Route::post('/user','api\v1\UserController@store');
        Route::post('/activate_user','api\v1\UserController@activate');
        Route::post('/verify_mobile','api\v1\UserController@verify_mobile');
        Route::post('/send_code','api\v1\UserController@send_code');
        Route::post('/forget_password','api\v1\UserController@forget_password');
        Route::post('/reset_password','api\v1\UserController@reset_password');
        Route::get('/welcome','api\v1\UserController@welcome');
        Route::post('/constants','api\v1\UserController@constants');
        Route::middleware('auth:api')->get('/users','api\v1\UserController@index');
        Route::middleware('auth:api')->post('/home','api\v1\UserController@home');
        Route::middleware('auth:api')->post('/change_password','api\v1\UserController@change_password');
        Route::middleware('auth:api')->post('/update_user','api\v1\UserController@update_user');
        Route::middleware('auth:api')->post('/my_profile','api\v1\UserController@my_profile');
        Route::middleware('auth:api')->post('/search','api\v1\MarketController@search');
        Route::middleware('auth:api')->post('/send_message','api\v1\MessageController@store');
        Route::middleware('auth:api')->post('/statistics','api\v1\UserController@statistics');
        Route::middleware('auth:api')->post('/logout','api\v1\UserController@logout');
        Route::middleware('auth:api')->post('/upgrade','api\v1\UserController@upgrate');
        Route::middleware('auth:api')->get('notifications','NotificationController@index');
        Route::middleware('auth:api')->get('upgrade','api\v1\UserController@upgrade');
        Route::middleware('auth:api')->get('points','api\v1\UserController@points');
        Route::middleware('auth:api')->post('add_promo','api\v1\UserController@add_promo');
        Route::middleware('auth:api')->post('cart','api\v1\UserController@cart');


});

Route::prefix('order')->group(function (){
   Route::post('status','api\v1\OrderController@change_status');
   Route::middleware('auth:api')->post('orders','api\v1\OrderController@index');
   Route::middleware('auth:api')->post('my_orders','api\v1\OrderController@show');
   Route::middleware('auth:api')->post('update_order','api\v1\OrderController@update');
   Route::middleware('auth:api')->post('send_order','api\v1\OrderController@store');
   Route::middleware('auth:api')->post('order_status','api\v1\OrderController@order_status');
});

Route::prefix('market')->group(function (){
   Route::middleware('auth:api')->post('markets','api\v1\MarketController@show');
   Route::middleware('auth:api')->post('reviews','api\v1\MarketController@reviews');
   Route::middleware('auth:api')->post('create_market','api\v1\MarketController@store');
   Route::middleware('auth:api')->post('update_market','api\v1\MarketController@update');
   Route::middleware('auth:api')->post('add_review','api\v1\MarketController@add_review');
   Route::get('delete_market/{id}','api\v1\MarketController@destroy');
});

Route::prefix('category')->group(function () {
    Route::get('delete/{id}','api\v1\CategoryController@destroy');

});
Route::prefix('product')->group(function (){
   Route::post('products','api\v1\ProductController@show');
   Route::middleware('auth:api')->post('favorits','api\v1\ProductController@favorits');
   Route::middleware('auth:api')->post('add_product','api\v1\ProductController@store');
   Route::middleware('auth:api')->post('update_product','api\v1\ProductController@update');
   Route::get('delete/{id}','api\v1\ProductController@destroy');
   Route::middleware('auth:api')->post('make_favorit','api\v1\ProductController@make_favorit');
   Route::middleware('auth:api')->post('add_category','api\v1\CategoryController@store');
   Route::middleware('auth:api')->post('update_category','api\v1\CategoryController@update');
   Route::middleware('auth:api')->post('delete_category','api\v1\CategoryController@destroy');
   Route::middleware('auth:api')->post('get_category','api\v1\CategoryController@index');
   Route::middleware('auth:api')->post('to_cart','api\v1\ProductController@addTocart');
   Route::middleware('auth:api')->post('delete_from_cart','api\v1\ProductController@DeleteFromCart');
   Route::middleware('auth:api')->get('get_cart','api\v1\ProductController@Getcart');
   Route::middleware('auth:api')->post('update_cart','api\v1\ProductController@UpdateCart');
});
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('xteam_test','HomeController@xteam_test');
Route::get('welcome','WelcomeController@index');

/*User Controller routes*/
Route::post('set_location','UserController@set_location');
Route::post('forget_password','UserController@forget_password');
Route::post('reset_password','UserController@reset_password');
Route::get('users','UserController@get_users');
Route::post('users','UserController@store');
Route::post('login','UserController@login');
Route::post('register','UserController@register');
Route::post('update_user','UserController@update_user');
Route::post('send_code','UserController@sendcode');
Route::post('verify_mobile','UserController@verify_mobile');
Route::post('create_admin','UserController@save_admin');
Route::post('create_master','UserController@save_master');
Route::get('user_profile/{market}/{id}','UserController@get_user_profile');
Route::get('my_profile/{id}','UserController@my_profile');

/*End User Controller routes*/

/*Category Controller routes*/
Route::post('add_category','CategoryController@store');
Route::post('update_category','CategoryController@update');
Route::post('delete_category','CategoryController@destroy');

/*End Category Controller routes*/
/*Product Controller routes*/
Route::post('add_product','ProductController@store');
Route::post('update_product','ProductController@update');
Route::post('delete_product','ProductController@destroy');
Route::get('get_products','ProductController@get_products');
Route::get('get_products/{id}','ProductController@get_products');
Route::get('get_product/{id}','ProductController@get_product');
/* End Product Controller routes*/

/* Orders Controller routes */
Route::get('customer_orders/{id}','OrderController@customer_orders');
Route::get('customer_orders/{market}/{id}','OrderController@customer_market_orders');
Route::get('owner_orders/{id}','OrderController@owner_orders');
Route::post('send_order','OrderController@send_order');
Route::get('pay_order/{id}','OrderController@pay_order');
Route::get('cancel_pay/{id}','OrderController@cancel_pay');
Route::get('process_order/{id}','OrderController@process_order');
/* End Orders Controller routes */

Route::post('send_payment','PaymentController@store');

/* Market Controller routes */
Route::get('delete_market/{id}','MarketController@destroy');
Route::post('create_market','MarketController@store');
Route::get('get_market/{id}','MarketController@show');
Route::get('get_markets','MarketController@all_markets');
Route::post('activate_market','MarketController@activate_market');
Route::post('update_market','MarketController@update');
Route::get('market_products/{id}','MarketController@get_market_products');
Route::get('market_customers/{id}','MarketController@get_market_customers');
Route::get('owner_markets/{id}','MarketController@owner_markets');
Route::get('customer_markets/{id}','MarketController@customer_markets');
/*End Market Controller routes */

/*Contract Controller routes*/
Route::post('send_contract','ContractController@store');
Route::get('get_contract_requests/{id}','ContractController@contract_requests');
Route::post('approve_contract','ContractController@approve_contract');
Route::get('cancel_contract/{id}','ContractController@cancel_contract');
