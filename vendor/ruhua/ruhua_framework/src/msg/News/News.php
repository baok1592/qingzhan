<?php


namespace ruhua\msg\News;


use ruhua\msg\News\CacheNews;
use ruhua\bases\BaseController;
use app\model\News as NewsModel;

class News extends BaseController
{
    //实列：
    /*数据库里群发消息的操作
     * */
    //添加群发消息
    public function addNews(){
        $da= input('get.');
        $data = [
           'uid'=>$da['uid'],
           'msg'=> $da['msg'],
        ];
        $res = NewsModel::create($data);
        return app('json')->go($res);
    }
    //消息已读
    public function updeteStateOk($id=''){
        //验证器
        $rule=[
            'id' => 'require|number',
        ];
        $data = [
            'id' =>$id,
        ];
        $this->validate($data,$rule);
        $res = NewsModel::update(['state'=>1],['id'=>$id]);
        return app('json')->go($res);
    }
    //查询消息**根据uid
    public function selectNewsUid($uid=''){
        //验证器
        $rule=[
            'uid' => 'require|number',
        ];
        $data = [
            'uid' =>$uid,
        ];
        $this->validate($data,$rule);
        $res = NewsModel::where('uid',$uid)->select();
        return app('json')->go($res);
    }
    /*
     * 文件里的消息操作
     * */
    //添加消息  uid->用户id；data->数据（数组啥的都行）；sta->备注；返回1成功；0失败
    public static function addNewsTxt(){
        return CacheNews::AddNews();
    }
    //获取本月全部消息
    public function monthDayNewsAll(){
        $res = CacheNews::MonthDayNews();
        return app('json')->go($res);
    }
    //获取上月全部消息
    public function monthLastNewsAll(){
        $res = CacheNews::MonthLastNews();
        return app('json')->go($res);
    }
    //获取上上月全部消息
    public function monthLastToNewsAll(){
        $res = CacheNews::MonthLastToNews();
        return app('json')->go($res);
    }

    /*按id获取
     * */
    //获取本月全部消息
    public function monthDayNewsUid($uid = ''){
        $res = CacheNews::MonthDayNewsUid($uid);
        return app('json')->go($res);
    }
    //获取上月全部消息
    public function monthLastNewsUid($uid = ''){
        $res = CacheNews::MonthLastNewsUid($uid);
        return app('json')->go($res);
    }
    //获取上上月全部消息
    public function monthLastToNewsUid($uid = ''){
        $res = CacheNews::MonthLastToNewsUid($uid);
        return app('json')->go($res);
    }

    //txt文件消息已读操作*****传入数组编号 第几个
    public function monthDayTxtOk($num = 0){
        $res = CacheNews::NewsOk($num);
        return app('json')->go($res);
    }

    //txt文件消息已读操作*****传入数组编号 第几个与uid
    public function monthDayTxtOkUid($num = 0,$uid = ' '){
        $res = CacheNews::NewsOkUid($num,$uid);
        return app('json')->go($res);
    }



}