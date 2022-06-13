<?php

namespace app\controller\cms;

use app\model\Group as GroupModel;
use app\model\Rule as RuleModel;
use app\validate\IDPostiveInt;
use app\validate\ProsValidate;
use ruhua\bases\BaseCommon;
use ruhua\bases\BaseController;
use ruhua\exceptions\BaseException;
use ruhua\exceptions\CmsException;
use ruhua\utils\Logs;

class Group extends BaseController
{
    //获取所有规则
    public function getRuleAll()
    {
        $data = RuleModel::field('id,pid,title')->select();
        $res=(new BaseCommon)->subTree($data);
        return app('json')->go($res);
    }

    //获取所有管理组
    public function getAll()
    {
        $data = GroupModel::order('id desc')->select();
        return app('json')->go($data);
    }


    //添加
    public function add($title,$rules)
    {
        if($title=="" || $rules==""){
            throw new CmsException(['msg'=>'参数错误']);
        }
        $rules=array_unique($rules);
        $rules=implode(',',$rules);
        GroupModel::create(['title' => $title, 'rules' => $rules]);
        return app('json')->go();
    }

    //删除
    public function del($id)
    {
        (new IDPostiveInt)->goCheck();
        $Pros = GroupModel::where('id', $id)->find();
        if (!$Pros) {
            throw new BaseException(['msg' => '不存在']);
        }
        $Pros->delete();
        Logs::Write('删除了管理组-id：' . $id);
        return app('json')->go();
    }

    //更新
    public function up()
    {
        $param=$this->request->param();
        $rules=array_unique($param['rules']);
        $param['rules']=implode(',',$rules);
        $one=GroupModel::where('id',$param['id'])->find();
        $one->allowField(['title','rules'])->save($param);
        return app('json')->go();
    }
}