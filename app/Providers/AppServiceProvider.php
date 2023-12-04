<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $models = array(
            'Product',
            'Auth',
            'Transaksi',
            'Cart'
        );

        foreach ($models as $model) {
            $this->app->bind("App\Repositories\Interfaces\\{$model}\\{$model}RepositoryInterface", "App\Repositories\Eloquent\\{$model}\\{$model}Repository");
        }
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
