<?php

namespace App\Repositories\Interfaces\Product;

interface ProductRepositoryInterface
{
    public function get($request);
    public function insert($request);
}
