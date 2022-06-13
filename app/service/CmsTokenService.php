<?php


namespace app\service;


use app\model\Admins as AdminsModel;
use ruhua\exceptions\BaseException;
use ruhua\exceptions\CmsException;
use ruhua\utils\JwtAuth;

class CmsTokenService extends TokenService
{
    //登陆，并返回token
    public function loginService($user,$pwd){
        $password = password($pwd);    //common文件的函数
        $where['username']=$user;
        $where['password']=$password;
        $user = AdminsModel::where($where)->find();
        if(!$user){
            throw new BaseException(['msg'=>'账号或密码错误！']);
        }
        if($user->state == 1){
            throw new BaseException(['msg'=>'已禁用']);
        }
        $cacheArr = $this->setCmsData($user);
        $res['token'] =  JwtAuth::getInstance()->setData($cacheArr)->encode()->getToken();
        $user->save(['login_time'=>time()]);
        return $res;
    }

    //组合uid，username，权限
    private function setCmsData($user){
        $cache['uid'] = $user['id'];
        $cache['usertype'] = "cms";
        $cache['uniacid'] = $user['uniacid'];
        return $cache;
    }

    public static function getCmsManageInfo($key=""){
        $aid=TokenService::getCurrentAid();
        $user=AdminsModel::find($aid)->toArray();
        if($key==""){
            return $user;
        }
        if (array_key_exists($key, $user)) {
            return $user[$key];
        }
        throw new CmsException();
    }
}