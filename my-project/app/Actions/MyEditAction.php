<?php

namespace App\Actions;

use TCG\Voyager\Actions\EditAction;

class MyEditAction extends EditAction
{

    public function shouldActionDisplayOnDataType()
    {
        // echo "<pre>";
        // var_dump($this->dataType->slug);
        // die();
        return parent::shouldActionDisplayOnDataType();
    }
}
