<?php


namespace app\validate;


use ruhua\bases\BaseValidate;

class ProsValidate extends BaseValidate
{
    protected $rule = [
        'title' => 'require',
        'category_id' => 'require',
        'img_ids' => 'array',
        'content' => 'min:0',
        'price' => 'float',
        "desc"=> "max:255",
        'before_price' => 'float'





    ];


}