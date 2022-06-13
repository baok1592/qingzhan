<?php


namespace app\controller\cms;

use app\model\AuthGroup as GroupModel;
use app\validate\GroupValidate;
use app\validate\IDPostiveInt;
use qy\auth\Auth;
use ruhua\exceptions\BaseException;
use ruhua\bases\BaseController;

class DomeGroup extends BaseController
{
    //获取所有group分组
    public function getGroup_all()
    {
        $data=GroupModel::getGroupAll();
        return app('json')->go($data);
    }

    //添加管理组
    public function add_group()
    {
        (new GroupValidate)->gocheck();
        $data=GroupModel::createGroup(input('post.'));
        return app('json')->go($data);
    }

    //删除管理组
    public function del_group($id)
    {
        (new IDPostiveInt)->goCheck();
        $res = GroupModel::destroy($id);
        if(!$res){
            throw new BaseException(['msg'=>'删除失败']);
        }else{
            return app('json')->success();
        }
    }

    //更新管理组
    public function up_group()
    {
        (new GroupValidate)->gocheck();
        $data=GroupModel::updateGroup(input('post.'));
        return app('json')->go($data);
    }

    //获取某管理组详细
    public function get_group_content($id)
    {
        (new IDPostiveInt)->goCheck();
        $data['group']=GroupModel::find($id);
        $data['rules'] = (new Auth())->getGroupAuthList($id);
        return app('json')->go($data);
    }
}