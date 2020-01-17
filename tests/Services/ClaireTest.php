<?php

namespace App\Tests\Services;

use App\Services\ForTest;
use PHPUnit\Framework\TestCase;

class ClaireTest extends TestCase{

    function testStringExplode(){

        $forTest = new ForTest();
        $stub = "sam,ali,claire,mika"; // fausse données 'stub ou fixtures'
        
        $result = $forTest->testExplode($stub);

        assertSame(["sam", "ali", "claire", "mika"], $result);
    }
}
