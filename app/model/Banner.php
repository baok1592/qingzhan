<?php


namespace app\model;


use ruhua\exceptions\BaseException;
use app\model\BannerItem as BannerItemModel;
use ruhua\bases\BaseModel;

class Banner extends BaseModel
{
    protected $hidden = ['delete_time','update_time'];

    public static function bannerItemsAll()
    {
        $res = BannerItemModel::with(['banner'])->order('sort desc')->select();
        if(!$res){
            throw new BaseException(['msg'=>'获取失败']);
        }
        return $res;
    }


}