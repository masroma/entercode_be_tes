<?php

namespace App\Repositories\Interfaces\Cart;

interface CartRepositoryInterface
{
    public function insert($request);
    public function get($request);
    public function total($request);
}
