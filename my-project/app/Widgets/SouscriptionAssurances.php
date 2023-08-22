<?php

namespace App\Widgets;

use App\Models\Souscriptionassurance;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Models\Role;
use TCG\Voyager\Widgets\BaseDimmer;

class SouscriptionAssurances extends BaseDimmer
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
        if(Auth::user()['role_id'] == Role::where('name','admin')->get()->first()->id){
            $result = \App\Models\Souscriptionassurance::where('statut','submit')->count();
        }else{
            $result = \App\Models\Souscriptionassurance::where('user',Auth::user()->id)->where('statut','submit')->count();
        }
        $count = $result;
        $string = "Demandes de Souscription Assurance En attente";

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-file-text',
            'title'  => "{$count} {$string}",
            'text'   => __('voyager::dimmer.page_text', ['count' => $count, 'string' => Str::lower($string)]),
            'button' => [
                'text' => "Souscriptions Assurance",
                'link' => route('voyager.souscriptionassurances.index'),
            ],
            'image' => 'assurance-bg.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->can('browse', new Souscriptionassurance());
    }
}
