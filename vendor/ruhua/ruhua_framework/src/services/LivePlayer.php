<?php

namespace  ruhua\services;
use app\services\AccessToken;
use  ruhua\bases\BaseCommon;
use think\Exception;
use think\facade\Cache;
use think\facade\Log;

class LivePlayer
{
    /**
     * 获取直播列表的微信接口
     */
    protected $live_list_url = 'http://api.weixin.qq.com/wxa/business/getliveinfo?access_token=%s';

    protected function AccessToken() {
        $a = (new AccessToken)->getXcx();
        $access_token = $a['access_token'];
        $this->live_list_url = sprintf($this->live_list_url, $access_token);//把百分号（%）符号替换成一个作为参数进行传递的变量：
    }
    /**
     * 获取直播列表信息
     */
    public function get_list(int $page)    {
        if($page>10){
            return;
        }
        $param['start']=(0+$page)*10;
        $param['limit']=(1+$page)*10;
        //tag写错的，remember的name是对一样能拿到缓存；tag是用意在于清除，把标记的一次清除
        //Cache::tag("_ruhua_")->clear();
        $cache_list=Cache::tag("_ruhua_")->remember("live_player_".$page,false);
        if($cache_list){
            return $cache_list;
        }
        try {
            $this->AccessToken();
            $res = (new BaseCommon)->curl_post($this->live_list_url,$param);
            $res=json_decode($res,true);
            if (isset($res['errcode']) && $res['errcode'] == 0 && isset($res['room_info']) && $res['room_info']) {
                Cache::tag("_ruhua_")->set("live_player_".$page,$res['room_info'],config("setting.cache_expire_in"));
                return $res['room_info'];
            }
            Cache::tag("_ruhua_")->set("live_player_".$page,true,600);
            return [];
        }catch (Exception $e) {
            Log::error("catch");
            return [];
        }
    }
}