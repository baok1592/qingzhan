<?php


namespace app\model;


use ruhua\bases\BaseModel;
use ruhua\exceptions\CmsException;
use think\facade\Db;

class Link extends BaseModel
{
    public function upLinkSort($param)
    {
        Db::startTrans();
        try {
            foreach ($param as $k => $v) {
                $this->where('id', $v['id'])->update(['sort' => $v['sort']]);
            }
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
            throw new CmsException(['msg' => '更新排序错误']);
        }
    }

    public static function up($form)
    {
        $id = $form['id'];
        unset($form['id']);
        $model = self::find($id);
        if (!$model) {
            throw new CmsException(['msg' => '不存在']);
        }
        $model->save($form);
    }
}