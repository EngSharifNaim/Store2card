<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id')
            ->select('id','name');
    }

    public function market()
    {
        return $this->belongsTo(Market::class, 'market_id','id')
            ->select('id','name','delivery_cost');
    }

    public function details()
    {
        return $this->hasMany(OrderDetail::class, 'order_id','id');
    }
}
