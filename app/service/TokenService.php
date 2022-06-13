<?php


namespace app\service;


use ruhua\exceptions\BaseException;
use ruhua\exceptions\TokenException;
use ruhua\utils\JwtAuth;
use think\facade\Request;

class TokenService
{

    //通过token获取cms中admin的id
    public static function getCurrentAid()
    {
        $uid = self::getCurrentTokenVar('uid');
        $usertype = self::getCurrentTokenVar('usertype');
        if ($uid > 0 && $usertype == 'cms') {
            return $uid;
        } else {
            throw new BaseException(['msg' => '无该用户信息']);
        }
    }



    //通过token获取user的uid
    public static function getCurrentUid()
    {
        $uid = self::getCurrentTokenVar('uid');
        $usertype = self::getCurrentTokenVar('usertype');
        if ($uid > 0 && $usertype == 'user') {
            return $uid;
        } else {
            throw new BaseException(['msg' => '无该用户信息']);
        }
    }

    //通过token获取该条缓存数据中指定的字段
    public static function getCurrentTokenVar($key)
    {
        $token = Request::header('authorization');
        if (!$token) {
            throw new BaseException(['msg' => '无token', 'code' => 401]);
        }
        $jwtData = JwtAuth::getInstance()->decode($token);
        if (!$jwtData) {
            throw new BaseException(['msg' => 'token无效', 'code' => 401]);
        }
        if (array_key_exists($key, $jwtData)) {
            return $jwtData[$key];
        } else {
            throw new TokenException(['msg' => '尝试获取的变量并不存在']);
        }
    }


}