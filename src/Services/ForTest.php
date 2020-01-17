<?php

namespace App\Services;


class ForTest{

    public function testExplode(string $entry){

        return explode(",", $entry);

    }


    public function testPreg(string $entry){

        preg_match("#world$#",$entry, $match); // $match = référence, est créée par les preg_match

        return $match;


    }

    public function testRef($entry){

        $refEntry =  &$entry;

        return $refEntry;

    }


}