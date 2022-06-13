<?php


namespace ruhua\msg\News;


use think\facade\Cache;
use think\facade\Log;

class CacheNews
{
    //标记消息已读 所有 需传入数组编号
    public static function NewsOk($num = 0){
        //获取文件名以及路径
        $year = date('Y');
        $month = date('m');
        $dir = './cachenews/';
        $file_path=$dir.$year.$month.".txt";
        if(file_exists($file_path)){
            $file_arr = file($file_path);
            for($i=0;$i<count($file_arr);$i++){//逐行读取文件内容
                if($num == $i){
                    $data=json_decode($file_arr[$i],true);
                    $data['state']=1;
                    $file_arr[$i]=json_encode($data, true)."\n";
                    file_put_contents($file_path,$file_arr);
                    return 1;
                }
            }
            //Cache::set('NewsCache', $data, 7200);
            return 0;
        }
        return 0;
    }

    //标记消息已读 单个用户  需传入数组编号与uid
    public static function NewsOkUid($num = 0,$uid = ''){
        //获取文件名以及路径
        $data=[];
        $year = date('Y');
        $month = date('m');
        $dir = './cachenews/';
        $file_path=$dir.$year.$month.".txt";
        if(file_exists($file_path)){
            $file_arr = file($file_path);
            for($i=0,$j=0;$i<count($file_arr);$i++){//逐行读取文件内容
                $data[$j]=json_decode($file_arr[$i],true);
                if($data[$j]['uid']<>$uid) {
                    unset($data[$j]);
                    $j = $j - 1;
                }
                if($num==$j){
                    $data[$j]['state']=1;
                    $file_arr[$i]=json_encode($data[$j], true)."\n";
                    file_put_contents($file_path,$file_arr);
                }
                $j++;
            }
            Cache::set('NewsCache', $data, 7200);
            return $data;
        }
        return 0;

    }

    //获取本月消息
    public static function MonthDayNews(){
        //获取文件名以及路径
        $data=[];
        $year = date('Y');
        $month = date('m');
        $dir = './cachenews/';
        $file_path=$dir.$year.$month.".txt";
        if(file_exists($file_path)){
            $file_arr = file($file_path);
            for($i=0;$i<count($file_arr);$i++){//逐行读取文件内容
                $data[$i]=json_decode($file_arr[$i],true);
            }
            Cache::set('NewsCache', $data, 7200);
            return $data;
        }
        return 0;
    }
    //按id获取本月消息
    public static function MonthDayNewsUid($uid = ''){
        //获取文件名以及路径
        $data=[];
        $year = date('Y');
        $month = date('m');
        $dir = './cachenews/';
        $file_path=$dir.$year.$month.".txt";
        if(file_exists($file_path)){
            $file_arr = file($file_path);
            for($i=0,$j=0;$i<count($file_arr);$i++){//逐行读取文件内容
                $data[$j]=json_decode($file_arr[$i],true);
                if($data[$j]['uid']<>$uid) {
                    unset($data[$j]);
                    $j = $j - 1;
                }
                $j++;
            }
            Cache::set('NewsCache', $data, 7200);
            return $data;
        }
        return 0;
    }


    //获取上个月消息
    public static function MonthLastNews(){
        //获取文件名以及路径
        $data=[];
        $year = date('Y');
        $month = date('m');
        if($month==1){
            $year = $year-1;
            $month = 12;
        }
        else
            $month = $month-1;
        $dir = './cachenews/';
        $file_path=$dir.$year.$month.".txt";
        if(file_exists($file_path)){
            $file_arr = file($file_path);
            for($i=0;$i<count($file_arr);$i++){//逐行读取文件内容
                $data[$i]=json_decode($file_arr[$i],true);
            }
            return $data;
        }
        return 0;
    }
    //按id获取上月消息
    public static function MonthLastNewsUid($uid = ''){
        //获取文件名以及路径
        $data=[];
        $year = date('Y');
        $month = date('m');
        if($month==1){
            $year = $year-1;
            $month = 12;
        }
        else
            $month = $month-1;
        $dir = './cachenews/';
        $file_path=$dir.$year.$month.".txt";
        if(file_exists($file_path)){
            $file_arr = file($file_path);
            for($i=0,$j=0;$i<count($file_arr);$i++){//逐行读取文件内容
                $data[$j]=json_decode($file_arr[$i],true);
                if($data[$j]['uid']<>$uid){
                    unset($data[$j]);
                    $j=$j-1;}
                $j++;
            }
            return $data;
        }
        return 0;
    }


    //获取上上个月消息
    public static function MonthLastToNews(){
        //获取文件名以及路径
        $data=[];
        $year = date('Y');
        $month = date('m');
        if($month<3){
            if($month==2){
            $year = $year-1;
            $month = 12;}
            else{
                $year = $year-1;
                $month = 11;
            }
        }
        else
            $month = $month-2;
        $dir = './cachenews/';
        $file_path=$dir.$year.$month.".txt";
        if(file_exists($file_path)){
            $file_arr = file($file_path);
            for($i=0;$i<count($file_arr);$i++){//逐行读取文件内容
                $data[$i]=json_decode($file_arr[$i],true);
            }
            return $data;
        }
        return 0;
    }

    //按id获取上上个月消息
    public static function MonthLastToNewsUid($uid = ''){
        //获取文件名以及路径
        $data=[];
        $year = date('Y');
        $month = date('m');
        if($month<3){
            if($month==2){
                $year = $year-1;
                $month = 12;}
            else{
                $year = $year-1;
                $month = 11;
            }
        }
        else
            $month = $month-2;
        $dir = './cachenews/';
        $file_path=$dir.$year.$month.".txt";
        if(file_exists($file_path)){
            $file_arr = file($file_path);
            for($i=0,$j=0;$i<count($file_arr);$i++){//逐行读取文件内容
                $data[$j]=json_decode($file_arr[$i],true);
                if($data[$j]['uid']<>$uid){
                    unset($data[$j]);
                    $j=$j-1;
                }
                $j++;

            }
            return $data;
        }
        return 0;
    }
    //新增消息存入
    public static function AddNews($uid = '' ,$data= [],$sta=''){
        //获取年月并拼成存储路径与文件名
        $year = date('Y');
        $month = date('m');
        $time = date("Y-m-d H:i",time());
        $dir = './cachenews/';
        if(is_dir($dir)){
            Log::error('该目录以存在');
        }else{
            if(mkdir($dir,0777,true))Log::error('目录创建完毕'); ;
        }
        $file=$dir.$year.$month.".txt";
        if(!file_exists($file))
        {
            fopen($file,   "w+");//这里是创建test.txt文件
            fclose($file);
        };
        // 写入数据
        $news = [
            'uid'=>$uid,
            'data'=>$data,
            'state'=>0,
            'states'=>$sta,
            'time' =>$time
        ];
        $string = json_encode($news, true);
        $fl=fopen($file,"a+");//这里是创建test.txt文件
        $str = fwrite($fl,$string."\n");
        fclose($fl);
        if($str>10)
            return 1;
        else
            return 0;
    }



}