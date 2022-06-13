<?php

namespace app\model;

use ruhua\bases\BaseModel;

class Test extends BaseModel
{
    public function __construct()
    {
        echo "construct:";
    }

    public static function a()
    {
        echo "aaa";
    }
}