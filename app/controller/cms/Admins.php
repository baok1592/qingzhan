<?php


namespace app\controller\cms;


use app\model\GroupAccess;
use ruhua\exceptions\BaseException;
use ruhua\bases\BaseController;
use app\model\Admins as AdminsModel;
use app\service\CmsTokenService;
use app\service\TokenService;
use app\validate\AdminsValidate;
use app\validate\IDPostiveInt;
use app\validate\LoginValidate;
use app\validate\PassWordValidate;

class Admins extends BaseController
{
    //获取所有管理员
    public function adminAll()
    {
        $res = AdminsModel::with('access')->hidden(['access'])->where('state', 0)->withoutField('password')->select();
        return app('json')->go($res);
    }

    public function myInfo()
    {
        $aid = TokenService::getCurrentAid();
        $info = AdminsModel::where('id', $aid)->hidden(['password'])->find()->toArray();
        $authArr = GroupAccess::getMyRules();
        $res=array_merge($info,$authArr);
        return app('json')->go($res);
    }

    //注册管理员
    public function add()
    {
        $validate = new AdminsValidate;
        $validate->goCheck();
        $param = $validate->getDataByRule($this->request->param());
        AdminsModel::createAdmin($param);
        return app('json')->go();
    }

    //删除管理员
    public function del($id)
    {
        (new IDPostiveInt)->goCheck();
        AdminsModel::deleteAdmin($id);
        return app('json')->go();
    }

    //登陆
    public function login($username = '', $password = '')
    {
        (new LoginValidate)->goCheck();
        $res = (new CmsTokenService)->loginService($username, $password);
        return app('json')->go($res);
    }


    //检查是否登陆
    public function check_login()
    {
        $uid = TokenService::getCurrentAid();
        if (!$uid) {
            return app('json')->fail('未登录');
        }
        return app('json')->go();
    }

    //修改密码
    public function updatePassWord()
    {
        (new PassWordValidate)->goCheck();
        $post = $this->request->post();
        $aid = TokenService::getCurrentAid();
        $admin = AdminsModel::where('id', $aid)->find();
        if (!$aid) {
            throw new BaseException(['msg' => '用户信息错误']);
        }
        if ($admin['password'] != password($post['old_password'])) {
            throw new BaseException(['msg' => '原密码错误']);
        }

        $admin['password'] = password($post['password']);
        $res = $admin->save();
        if (!$res) {
            throw new BaseException(['msg' => '修改密码失败']);
        }
        return app('json')->go();
    }


    //更新管理员GID
    public function updateGid($id,$gid)
    {
        AdminsModel::updateGid($id, $gid);
        return app('json')->go();
    }


}