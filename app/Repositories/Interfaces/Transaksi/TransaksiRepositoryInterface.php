<?php

namespace App\Repositories\Interfaces\Transaksi;

interface TransaksiRepositoryInterface
{
    public function get($request);
    public function getById($request);
    public function checkout($request);
}
