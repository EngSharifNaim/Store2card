<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contract extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id','id');
    }
    public function market()
    {
        return $this->belongsTo(Market::class, 'market_id','id');
    }
}
