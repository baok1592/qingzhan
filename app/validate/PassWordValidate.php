<?php


namespace app\validate;


use ruhua\bases\BaseValidate;

class PassWordValidate extends BaseValidate
{
    protected $rule = [
        'password' => 'require|alphaDash|min:6',
        'old_password' => 'require|alphaDash|min:6'
    ];
}