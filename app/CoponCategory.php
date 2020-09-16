<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CoponCategory extends Model
{
    public function copon()
    {
        return $this->hasMany(Copon::class, 'id','category_id');
    }
}
