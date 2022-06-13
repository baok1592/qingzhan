<?php


namespace app\validate;


use ruhua\bases\BaseValidate;

class ArticleValidate extends BaseValidate
{
    protected $rule = [
        'title' => 'require',
        'short_title' => 'max:40',
        'category_id' => 'require',
        'img_id' => 'number',
        'type' => 'alpha',
        'desc' => 'max:80',
        'content' => 'min:0',
        'jump_url' => 'url',
        'date' => 'number',
        'source' => 'max:40'
    ];


}