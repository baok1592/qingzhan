<?php

namespace ruhua\utils;

use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use ruhua\exceptions\BaseException;
use ruhua\exceptions\TokenException;
use think\facade\Log;

/**
 * 单例 一次请求中所有使用jwt的地方都是一个用户
 *
 */
class JwtAuth
{
    private $token;
    private static $instance;

    private $iss = 'qz.ruhuashop.com'; //签发人
    private $key = 'qz#ruhuashop#com58dw6e9r3f1s@';

    private $uid;
    private $uniacid;
    private $usertype;

    /**
     * 单例模式 JwtAuth句柄
     */
    public static function getInstance()
    {
        if (is_null(self::$instance)) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    private function __construct()
    {
    }

    public function encode()
    {
        $time = time();
        $payload = array(
            "iat" => $time, //jwt签发时间
            "exp" => $time + 3600 * 20,//jwt的过期时间，必须大于签发时间
            "uid" => $this->uid,
            "usertype" => $this->usertype,
            "uniacid" => $this->uniacid
        );
        $this->token = JWT::encode($payload, $this->key, 'HS256');
        return $this;
    }

    public function decode($token)
    {
        try {
            $token = str_replace('Bearer ','',$token);
            $arr = (array)JWT::decode($token, new Key($this->key, 'HS256'));
            if (!isset($arr['exp']) || $arr['exp'] < time()) {
                throw new TokenException(['msg' => "token已过期"]);
            }
        }catch (\Exception $e){
            throw new TokenException(['msg' => "token无效"]);
        }

        unset($arr['iat']);
        unset($arr['exp']);
        return $arr;
    }

    public function getToken()
    {
        return (string)$this->token;
    }

    public function setData($data)
    {
        $this->uid = $data['uid'] ?? 0;
        $this->usertype = $data['usertype'] ?? "";
        $this->uniacid = $data['uniacid'] ?? 0;
        return $this;
    }


}
