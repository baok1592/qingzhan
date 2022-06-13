<?php


namespace app\controller\cms;

use app\model\Banner as BannerModel;
use app\model\BannerItem as BannerItemModel;
use app\validate\ADValidate;
use app\validate\IDPostiveInt;
use ruhua\bases\BaseController;

class Ad extends BaseController
{
    //所有广告位
    public function adSeat()
    {
        $res = BannerModel::select();
        return app('json')->go($res);
    }

    //获取所有pc广告
    public function getPcAll()
    {
        $ids = BannerModel::where('type', 0)->column('id');
        $data = BannerItemModel::with('img')->where('banner_id', 'in', $ids)->order('sort desc')->select();
        return app('json')->go($data);
    }

    //获取所有手机广告
    public function getMbAll()
    {
        $ids = BannerModel::where('type', 1)->column('id');
        $data = BannerItemModel::with('img')->where('banner_id', 'in', $ids)->order('id desc')->select();
        return app('json')->go($data);
    }

    //获取指定ID位的广告
    public function getMbSidAll($id)
    {
        $data = BannerItemModel::with('img')->where('banner_id', $id)->order('id desc')->select();
        return app('json')->go($data);
    }

    //添加广告
    public function add()
    {
        $data = $this->request->param();
        $validate = new ADValidate();
        $validate->goCheck($data);
        $form=$validate->getDataByRule($data);
        BannerItemModel::add($form);
        return app('json')->go();
    }

    //删除广告
    public function del($id)
    {
        (new IDPostiveInt)->goCheck();
        BannerItemModel::del($id);
        return app('json')->go();
    }

    //更新广告
    public function up()
    {
        $validate = new ADValidate(['id']);
        $validate->goCheck();
        $data = $this->request->param();
        $form = $validate->getDataByRule($data);
        BannerItemModel::up($form);
        return app('json')->go();
    }


}