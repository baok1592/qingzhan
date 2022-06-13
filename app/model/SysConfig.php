<?php


namespace app\model;

use ruhua\bases\BaseModel;
use ruhua\exceptions\CmsException;

class SysConfig extends BaseModel
{
    protected $hidden = ['uniacid'];


    public function updateConfig($data)
    {
        $res = (new SysConfig)->allowField($data)->saveAll($data);
        if(!$res){
            throw new CmsException(['msg'=>'修改失败']);
        }
    }


}