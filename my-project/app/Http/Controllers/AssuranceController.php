<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Assurance;

class AssuranceController extends Controller
{
    public function showOne(Request $request,$id){
         $assurance = Assurance::findOrFail($id);
         return view('assurance',["assurance"=>$assurance]);
    }
}
