<?php

namespace app\model;


use ruhua\bases\BaseModel;
use think\model\concern\SoftDelete;

class Group extends BaseModel
{
    protected $name = 'auth_group';
    use SoftDelete;
    protected $deleteTime = 'delete_time';



}