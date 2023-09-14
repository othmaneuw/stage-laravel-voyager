<?php

namespace App\Actions;

use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Actions\EditAction;
use TCG\Voyager\Models\Role;

class MyEditAction extends EditAction
{

    public function shouldActionDisplayOnRow($row)
    {
        if(($this->dataType->slug === "remboursementprisesencharges" 
        || $this->dataType->slug === "remboursementassurances"
        || $this->dataType->slug === "loisirsremboursements"
        || $this->dataType->slug === "hotelremboursements"
        || $this->dataType->slug === "remboursementappartements"


        ) 
        && Auth::user()['role_id'] === Role::where('name',"Membre AOS")->get()->first()->id){
             if($row->is_updated === "true"){
                return false;
             }else{
                return true;
             }
        }else{
            return true;
        }
    }
        
}
