<?php


namespace app\validate;


use ruhua\bases\BaseValidate;
use think\Validate;

class CategoryValidate extends BaseValidate
{
    protected $rule = [
        'name'=> 'require|min:2',
        'pid'=> 'require|number',
        'diy_id'=> 'require|number',
        'mb_diy_id'=> 'require|number',
        'ctx_id'=> 'number',
        'mb_ctx_id'=> 'number',
        'type'=> 'require|min:2',
        'content'=>'min:0'
    ];
}