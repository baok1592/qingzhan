<?php


namespace app\validate;


use ruhua\bases\BaseValidate;

class CardsValidate extends BaseValidate
{
    protected $rule = [
        'title' => 'require',
        'category_id' => 'require',
        'img_ids' => 'array',
        'desc' => 'max:80',
        'content' => 'min:0',
        'jump_url' => 'url'
    ];


}