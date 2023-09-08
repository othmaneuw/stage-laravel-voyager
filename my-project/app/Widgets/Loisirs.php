<?php

namespace App\Widgets;

use App\Models\ReservationActivite;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Models\Role;
use TCG\Voyager\Widgets\BaseDimmer;

class Loisirs extends BaseDimmer
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
        if(Auth::user()['role_id'] == Role::where('name','admin')->get()->first()->id || Auth::user()['role_id'] == Role::where('name', 'Admin AOS')->get()->first()->id || Auth::user()['role_id'] == Role::where('name', 'Gestionnaire AOS')->get()->first()->id || Auth::user()['role_id'] == Role::where('name', 'Gestionnaire Activite')->get()->first()->id){
            $result = \App\Models\ReservationActivite::where('statut','submit')->count();
        }else{
            $result = \App\Models\ReservationActivite::where('user',Auth::user()->id)->where('statut','submit')->count();
        }
        $count = $result;
        $string = "Réservations d'activités en attente";

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-news',
            'title'  => "{$count} {$string}",
            'text'   => __('voyager::dimmer.post_text', ['count' => $count, 'string' => Str::lower($string)]),
            'button' => [
                'text' => "Loisirs",
                'link' => route('voyager.reservation-activites.index'),
            ],
            'image' => '/loisirs-bg.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->can('browse', new ReservationActivite());
    }
}
