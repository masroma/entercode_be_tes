<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    use HasFactory;

    protected $fillable = ['invoice','user_id','total','status'];

  /**
   * Get all of the DetailTransaksi for the Transaksi
   *
   * @return \Illuminate\Database\Eloquent\Relations\HasMany
   */
  public function DetailTransaksi()
  {
      return $this->hasMany(TransaksiDetail::class, 'transaksi_id', 'id');
  }
}
