<?php


namespace app\model;


use app\controller\cms\Oss;
use app\controller\cms\Watermark;
use ruhua\bases\BaseModel;
use ruhua\exceptions\CmsException;
use think\facade\Db;

class Image extends BaseModel
{
    public const path = '/uploads/imgs/';

    //图片路径保存到数据库
    public static function saveImg($name, $cid)
    {
        $data['cid'] = $cid;
        $data['url'] = $cid . '/' . $name;
        $res = self::create($data);
        if (!$res) {
            throw new CmsException(['msg' => '上传失败']);
        }
    }

    public static function getImgALL()
    {
        $res = self::where('state', 1)->order('id desc')->select();
        return $res;
    }

    public static function getIds($ids)
    {
        $urls=self::where('id','in',$ids)->select()->toArray();
        $res=[];
        $idsarr=explode(",",$ids);
        foreach($idsarr as $id){
            foreach ($urls as $v) {
                if ($id == $v['id']) {
                    $res[] = $v['url'];
                }
            }
        }
        return $res;
    }
    public static function del($ids)
    {
        $arr = explode(",", $ids);
        Db::startTrans();
        try{
            self::where('id','in',$arr)->save(['state'=>0]);
            Db::commit();
        }catch (\Exception $e){
            Db::rollback();
            throw new CmsException(['msg'=>'删除失败']);
        }
    }


    public static function getUrlAttr($url)
    {
        return self::path . $url;
    }

}