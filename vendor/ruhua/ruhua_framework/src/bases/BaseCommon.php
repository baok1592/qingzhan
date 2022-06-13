<?php

namespace  ruhua\bases;


use  ruhua\exceptions\BaseException;
use app\controller\auth\Token;
use think\facade\Request;

class BaseCommon
{
    function curl_get($url, &$httpCode = 0)
    {
        $web_url=Request::rootDomain();
        $token=(new Token())->getCloudToken();
        $header=array('url:'.$web_url,'otoken:'.$token);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch,CURLOPT_HTTPHEADER,$header);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        //不做证书校验,部署在linux环境下请改为true
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        $file_contents = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        return $file_contents;
    }

    function curl_post($url, array $params = array())
    {
        $data_string = json_encode($params);
        $token=(new Token())->getCloudToken();
        $web_url=Request::rootDomain();
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER,
            array(
                'Content-Type: application/json',
                'token:'.$token,
                'url:'.$web_url
            )
        );
        $data = curl_exec($ch);
        curl_close($ch);
        return ($data);
    }

    //判断系统是否完成安装
    public function is_install()
    {
        static $isInstall;
        if (empty($isInstall)) {
            $isInstall = file_exists(ROOT . 'data/install.lock');
        }
        return $isInstall;
    }

    public function curl_sa_post($stoken,$url, array $params = array())
    {


        $data_string = json_encode($params);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER,
            array(
                'Content-Type: application/json',
                'stoken:'.$stoken,
            )
        );
        $data = curl_exec($ch);
        curl_close($ch);
        return ($data);
    }


    //生成订单编号
    function makeOrderNum()
    {
        $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J','K');
        $orderSn =
            $yCode[intval(date('Y')) - 2018] . strtoupper(dechex(date('m'))) . date(
                'd') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf(
                '%02d', rand(0, 99));
        return $orderSn;
    }

    

    /**
     * 子孙树 用于菜单整理--返回平级
     * @param $param
     * @param int $pid
     */
    function subTree($param, $k='id',$pid = 0)
    {
        static $res = [];
        foreach($param as $key=>$vo){
            if( $pid == $vo['pid'] ){
                $res[] = $vo;
                $this->subTree($param,$k, $vo[$k]);
            }
        }
        return $res;
    }

    /**
     * 子孙树 用于菜单整理--返回树状级
     * @param $param
     * @param int $pid
     */
    function levelTree($array, $pid=0)
    {
        $data = [];
        foreach ($array as $k=>$v){
            if($v['pid'] == $pid){
                $child = $this->levelTree($array,$v['id']);
                if($v['pid']==0) {
                    $v['child'] = $child ?: [];
                }
                $data[] = $v;
            }
        }
        return $data;
    }

    /**
     * 管理员密码加密方式
     * @param $password  密码
     * @return string
     */
    function password($password)
    {
        $password_code=config('setting.psw_code');
        return md5(md5($password) . md5($password_code));
    }

    /**
     * 商家端密码加密方式
     * @param $password  密码
     * @return string
     */
    function store_password($password)
    {
        $password_code=config('setshops.shops_psw_code');
        return md5(md5($password) . md5($password_code));
    }


    function unlock($txt,$key='str'){
        //快递物流
        $txt = base64_decode(urldecode($txt));
        $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-=+";
        $ch = $txt[0];
        $nh = strpos($chars,$ch);
        $mdKey = md5($key.$ch);
        $mdKey = substr($mdKey,$nh%8, $nh%8+7);
        $txt = substr($txt,1);
        $tmp = '';
        $i=0;$j=0; $k = 0;
        for ($i=0; $i<strlen($txt); $i++) {
            $k = $k == strlen($mdKey) ? 0 : $k;
            $j = strpos($chars,$txt[$i])-$nh - ord($mdKey[$k++]);
            while ($j<0) $j+=64;
            $tmp .= $chars[$j];
        }
        return trim(base64_decode($tmp),$key);
    }

   
    /**
     * 保存图片到本地
     * $data是文件名数组
     * $path是远程路径
     * $path1是本地保存路径
     */
    public function dw($data,$path,$path1){
        $bit=[];
        header("Content-type: application/force-download");
        foreach ($data as $key=>$m) {
            if(is_array($m)){
                $bit[]=$this->dw($m,$path."/".$key,$path1.$key."/");
            }
            else {
                if (! file_exists($path1)) {
                    mkdir ( "$path1", 0777, true );
                }
                $content = file_get_contents($path."/".$m);
                $re = substr($m, strrpos($m, "/"));
                $ty=strchr($m,'.');
                if($ty==".php1"){
                    $re=substr($re,0,strlen($re)-1);
                    file_put_contents("./".$path1.$re, $content);
                }
                else{
                    file_put_contents("./".$path1.$re, $content);
                }
                $bit[]="./".$path1. $re;
            }
        }
        return $bit;

    }


    /**
     * 保存图片到本地
     * $data是文件名数组
     * $path是远程路径
     * $path1是本地保存路径
     */
    public function download($data,$path,$path1){
        $bit=[];
        header("Content-type: application/force-download");
        foreach ($data as $m) {
            $content = file_get_contents($path."/".$m);
            $re = substr($m, strrpos($m, "/"));
            $ty=strchr($m,'.');
            if($ty==".php1"){
                $re=substr($re,0,strlen($re)-1);
                file_put_contents("./".$path1.$re, $content);
            }
            else{
                file_put_contents("./".$path1.$re, $content);
            }
            $bit[]="./".$path1. $re;
        }
        return $bit;

    }
}