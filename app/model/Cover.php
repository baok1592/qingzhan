<?php

namespace app\model;

use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;

class Cover extends BaseModel
{
    public static function getCtxByCid($id)
    {
        $res=self::where('cid',$id)->value('content');
        if(!$res){
            throw new BaseException(['msg'=>'封面内容错误']);
        }
        return $res;
    }
}