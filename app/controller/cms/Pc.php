<?php

namespace app\controller\cms;

use app\model\MbDiy as MbDiyModel;
use ruhua\bases\BaseController;
use app\model\PcDiy as PcDiyModel;
use ruhua\exceptions\CmsException;
use think\facade\Db;

class Pc extends BaseController
{
    public function tmp_all()
    {
        $res=PcDiyModel::field('id,type,name')->select();
        return app('json')->go($res);
    }

    //获取首页模板IDS和当前模板ID
    public function getHomeTmpInfo()
    {
        $data['pc']=PcDiyModel::where('type','home')->field('id,type,name')->select();
        $data['mb']=MbDiyModel::where('type','home')->field('id,type,name')->select();
        $data['local']=Db::name('diy')->select();
        return app('json')->go($data);
    }


    public function detail($id)
    {
        $res=PcDiyModel::where('id',$id)->find();
        if($res->json){
            $res['json']=json_decode($res['json'],true);
        }
        return app('json')->go($res);
    }

    public function add()
    {
        $param=$this->request->param();
        PcDiyModel::add($param);
        return app('json')->go();
    }

    public function up()
    {
        $param=$this->request->param();
        PcDiyModel::up($param);
        return app('json')->go();
    }

    public function upName($id,$name)
    {
        PcDiyModel::where('id',$id)->save(['name'=>$name]);
        return app('json')->go();
    }

    public function del($id)
    {
        $pc=PcDiyModel::where('id',$id)->find();
        if(!$pc){
            throw new CmsException();
        }
        $pc->delete();
        return app('json')->go();
    }

}