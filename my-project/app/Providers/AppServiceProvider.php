<?php

namespace App\Providers;

use App\Actions\MyEditAction;
use Illuminate\Support\ServiceProvider;
use TCG\Voyager\Actions\EditAction;
use TCG\Voyager\Facades\Voyager;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Voyager::replaceAction(EditAction::class,MyEditAction::class);
    }
}
