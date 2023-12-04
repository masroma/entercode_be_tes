<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;
    protected $fillable = [
        'product_id','pembeli_id','qty'
    ];

    /**
     * Get the Product that owns the Cart
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function DataProducts()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

}
