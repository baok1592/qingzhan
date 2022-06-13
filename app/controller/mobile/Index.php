<?php

namespace app\controller\mobile;

use app\model\Category as CategoryModel;
use app\model\MbNavs as MbNavsModel;
use app\model\MbDiy as MbDiyModel;
use app\model\PcDiy as PcDiyModel;
use app\model\SysConfig as SysConfigModel;

class Index extends MobileController
{
    //首页数据
    public function index()
    {
        $tmpJson=MbDiyModel::getHomeJson();
        $data=MbDiyModel::setMbHomeData($tmpJson);
        return app('json')->go($data);
    }

    public function getsys()
    {
        $res = SysConfigModel::where('type', 2)->whereOr('key','site_name')->field('key,value')->select()->toArray();
        $site=[];
        foreach ($res as $k=>$v){
            $site[$v['key']]=$v['value'];
        }
        return app('json')->go($site);
    }

    //获取底部导航
    public function getFootNavs()
    {
        $data=MbNavsModel::where('state',0)->hidden(['state'])->select();
        return app('json')->go($data);
    }

    //获取详情页数据
    public function detail($id)
    {
        if(input('get.type')){
            $data = PcDiyModel::getCtxByType(input('get.type'),$id);
        }
        if(input('get.cid')) {
            $data = CategoryModel::getCtxDetail(input('get.cid'), $id);
        }
        return app('json')->go($data);
    }

}