<?php


namespace app\validate;



use ruhua\bases\BaseValidate;

class ADValidate extends BaseValidate
{
    protected $rule = [
        'banner_id' => 'require|number',
        'title' => 'require|min:2',
        'img_id' => 'require|number|>:0',
        'jump_type' => 'alpha',
        'jump_id' => 'number',
        'one' => 'min:0',
        'two' => 'min:0'
    ];

}