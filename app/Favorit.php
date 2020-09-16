<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Favorit extends Model
{
    public function user()
    {
        return $this->belongsTo(Product::class,'product_id','id');
    }
}
