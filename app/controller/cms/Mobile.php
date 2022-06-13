<?php

namespace app\controller\cms;

use app\model\MbNavs;
use app\model\MbDiy as MbDiyModel;
use ruhua\bases\BaseController;
use ruhua\exceptions\CmsException;
use think\facade\Db;

class Mobile extends BaseController
{
    public function getNavsall()
    {
        $res=MbNavs::select();
        return app('json')->go($res);
    }

    public function navsUp()
    {
        MbNavs::navsUp($this->request->param());
        return app('json')->go();
    }

    public function tmp_all()
    {
        $res=MbDiyModel::field('id,type,name')->select();
        return app('json')->go($res);
    }

    //获取首页模板IDS和当前模板ID
    public function getHomeTmpInfo()
    {
        $data['temp']=MbDiyModel::where('type','home')->field('id,type,name')->select();
        $data['local']=Db::name('diy')->select();
        return app('json')->go($data);
    }


    public function detail($id)
    {
        $res=MbDiyModel::where('id',$id)->find();
        if($res->json){
            $res['json']=json_decode($res['json'],true);
        }
        return app('json')->go($res);
    }

    public function add()
    {
        $param=$this->request->param();
        MbDiyModel::add($param);
        return app('json')->go();
    }

    public function up()
    {
        $param=$this->request->param();
        MbDiyModel::up($param);
        return app('json')->go();
    }

    public function upName($id,$name)
    {
        MbDiyModel::where('id',$id)->save(['name'=>$name]);
        return app('json')->go();
    }

    public function del($id)
    {
        $pc=MbDiyModel::where('id',$id)->find();
        if(!$pc){
            throw new CmsException();
        }
        $pc->delete();
        return app('json')->go();
    }

}