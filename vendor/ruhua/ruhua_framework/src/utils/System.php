<?php

namespace  ruhua\utils;


use app\model\SysConfig;

class System
{
    public function getValue($key){
        $value=SysConfig::where('key',$key)->value('value');
        return $value;
    }
}