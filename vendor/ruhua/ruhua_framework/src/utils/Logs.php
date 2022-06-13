<?php


namespace ruhua\utils;

use app\service\TokenService;
use think\facade\Log;

class Logs
{
    //写入日志
    public static function Write($msg,$type="info"){
        $user=null;
        try {
            $usertype=TokenService::getCurrentTokenVar("usertype");
            if($usertype=='cms') {
                $user = "aid:" . TokenService::getCurrentTokenVar("uid");
            }else{
                $user = "uid:" . TokenService::getCurrentTokenVar("uid");
            }
        }catch (\Exception $e){
        }
        $str="";
        if($user){
            $str.=$user.",";
        }
        $str.=$msg;   //"用户${user}".$msg;
        Log::channel('qzLog')->write($str,$type);
    }  
    //清空日志
    public static function clear():void{
        $Channel=Log::getChannelConfig('qzLog');
        $res=unlink($Channel['path'].'/single.log');
    }

}