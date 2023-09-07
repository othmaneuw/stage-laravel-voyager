<?php

namespace App\Services;

class Periodicite {
    public static function getPeriodicite(float $montant): string {
        if($montant <= 1000){
            $result = "three";
        }else if($montant > 1000 && $montant <=3000){
            $result="six";
        }else if($montant > 3000 && $montant <=6000 ){
            $result="nine";
        }else{
            $result="twelve";
        }

        return $result;
    }
}