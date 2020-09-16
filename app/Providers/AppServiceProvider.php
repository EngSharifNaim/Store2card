<?php

namespace App\Providers;

use App\Category;
use App\Market;
use App\Product;
use Illuminate\Support\ServiceProvider;
use App\User;
use Illuminate\Support\Facades\View;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {

        View::composer('*', function($view)
        {
            $view->with('users_count', User::where('type','user')->count());
            $view->with('owners_count', User::where('type','owner')->count());
            $view->with('markets_count', Market::where('deleted_at',Null)->count());
            $view->with('products_count', Product::where('deleted_at',Null)->count());
            $view->with('offers_count', Product::where('deleted_at',Null)->where('offer',1)->count());
            $view->with('categories', Category::where('deleted_at',Null)->get());
        });

    }
}
