<?php


namespace app\model;


use ruhua\bases\BaseModel;
use ruhua\exceptions\CmsException;
use think\facade\Db;

class MbNavs extends BaseModel
{
    public static function navsUp($param)
    {
        if (!is_array($param)) {
            throw new CmsException();
        }
        Db::startTrans();
        try {
            $model=new Category;
            foreach ($param as $v) {
                $one=self::where('id',$v['id'])->find();
                $v['jump_type']=$model->where('id',$v['jump_id'])->value('type');
                $v['jump_type']=$v['jump_type']??"home";
                $one->save($v);
            }
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
            throw new CmsException(['msg' => '更新错误']);
        }
    }
}