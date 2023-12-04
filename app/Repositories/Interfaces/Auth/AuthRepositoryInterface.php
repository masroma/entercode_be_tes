<?php

namespace App\Repositories\Interfaces\Auth;

interface AuthRepositoryInterface
{
    public function register($request);
    public function login($request);
    public function getUser($request);
}
