<?php


namespace app\validate;


use ruhua\bases\BaseValidate;

class AdminsValidate extends BaseValidate
{
    protected $rule=[
        'username'=>'require|max:30',
        'password'=>'require|min:6',
        'gid'=>'require|isPositiveInteger',
    ];
}