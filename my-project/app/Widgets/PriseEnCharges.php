<?php

namespace App\Widgets;

use App\Models\Prisesencharge;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Models\Role;
use TCG\Voyager\Widgets\BaseDimmer;

class PriseEnCharges extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        if (Auth::user()['role_id'] == Role::where('name', 'admin')->get()->first()->id || Auth::user()['role_id'] == Role::where('name', 'Admin AOS')->get()->first()->id || Auth::user()['role_id'] == Role::where('name', 'Gestionnaire AOS')->get()->first()->id) {
            $result = \App\Models\Prisesencharge::where('statut', 'submit')->count();
        } else {
            $result = \App\Models\Prisesencharge::where('user', Auth::user()->id)->where('statut', 'submit')->count();
        }
        $count = $result;
        $string = "Prises En Charges Médicales en attente";

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-treasure',
            'title'  => "{$count} {$string}",
            'text'   => __('voyager::dimmer.post_text', ['count' => $count, 'string' => Str::lower($string)]),
            'button' => [
                'text' => 'Prises En Charge Médicales',
                'link' => route('voyager.prisesencharges.index'),
            ],
            'image' => '/med2.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->can('browse', new Prisesencharge());
    }
}
