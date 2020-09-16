<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Market extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class,'owner_id','id');
    }

    public function product()
    {
        return $this->hasMany(Product::class,'market_id','id');
    }
    public function category()
    {
        return $this->hasMany(Category::class,'market_id','id');
    }
    public function reviews()
    {
        return $this->hasMany(MarketReview::class,'market_id','id');
    }
}
