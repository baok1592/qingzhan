<?php


namespace app\validate;


use ruhua\bases\BaseValidate;

class LinkValidate extends BaseValidate
{
    protected $rule = [
        'name' => 'require',
        'url' => 'require',
        'img_id' => 'number'
    ];


}