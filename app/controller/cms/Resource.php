<?php

namespace app\controller\cms;

use app\model\Image as ImageModel;
use ruhua\bases\BaseController;
use ruhua\exceptions\CmsException;
use ruhua\utils\UpImg;
use app\model\Resource as ResourceModel;

class Resource extends BaseController
{

    public function addImg($cid)
    {
        $file = request()->file('file');
        $name=UpImg::getInstance($file)->add($cid);
        ImageModel::saveImg($name,$cid);
        return app('json')->go();
    }

    //图片上传返回url
    public function upImgbackUrl()
    {
        $file = request()->file('file');
        $name=UpImg::getInstance($file)->add(0);
        return app('json')->go(['url'=>'uploads/imgs/0/' .$name]);
    }

    //获取图片、视频、文件
    public function getResourcType($type)
    {
        $res=[];
        if($type=='img'){
            $res=ImageModel::getImgALL();
        }
        if($type=='video'){
            //ImageModel::getImgALL();
        }
        return app('json')->go($res);
    }
    //新增分类
    public function categoryAdd($name,$type)
    {
        if(strlen($name)>20){
            throw new CmsException(['msg'=>'最大长度20']);
        }
        $data['name']=$name;
        $data['type']=$type;
        ResourceModel::create($data);
        return app('json')->go();
    }

    //获取某类型的所有分类
    public function getCategoryType($type)
    {
        $res=ResourceModel::where('type',$type)->select();
        return app('json')->go($res);
    }

    //获取图库某分类下图片
    public function getImgCategoryData($id)
    {
        $res=ImageModel::where('cid',$id)->select();
        return app('json')->go($res);
    }

    //删除指定资源
    public function dels($ids,$type)
    {
        if(!in_array($type,['img','video','file'])){
            throw new CmsException(['msg'=>'类型错误']);
        }
        if($type=='img'){
            ImageModel::del($ids);
        }
        if($type=='video'){
            //ImageModel::getImgALL();
        }
        return app('json')->go();
    }
}