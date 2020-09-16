<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public function category()
    {
        return $this->belongsTo(Category::class,'category_id','id');
    }
    public function market()
    {
        return $this->belongsTo(Market::class,'market_id','id');
    }
    public function size()
    {
        return $this->hasMany(Size::class,'product_id','id');
    }
}
