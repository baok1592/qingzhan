<?php


namespace app\controller\cms;

use app\model\Cards as CardsModel;
use app\model\Image;
use app\validate\CardsValidate;
use app\validate\IDPostiveInt;
use ruhua\exceptions\BaseException;
use ruhua\bases\BaseController;
use ruhua\exceptions\CmsException;
use ruhua\utils\UpImg;
use app\model\SysConfig;

class Cards extends BaseController
{
    //获取所有文章
    public function getAll()
    {
        $data=CardsModel::getAll();
        return app('json')->go($data);
    }
    //某栏目下的文章
    public function getCidCards($cid)
    {
        $data=CardsModel::getCategoryCards($cid);
        return app('json')->go($data);
    }
    //修改状态
    public function editState($type,$id)
    {
        $one=CardsModel::where('id',$id)->find();
        if(!$one){
            throw new CmsException(['msg'=>'文章不存在']);
        }
        if($type=='is_hot'){
            $state=$one->is_hot==1?0:1;
            $one->save(['is_hot'=>$state]);
        }
        if($type=='is_top'){
            $state=$one->is_top==1?0:1;
            $one->save(['is_top'=>$state]);
        }
        if($type=='is_hidden'){
            $state=$one->is_hidden==1?0:1;
            $one->save(['is_hidden'=>$state]);
        }
        return app('json')->go();
    }

    //添加文章
    public function add()
    {
        $validate=new CardsValidate();
        $validate->goCheck();
        $data=$this->request->param();
        $form=$validate->getDataByRule($data);
        CardsModel::createCards($form);
        return app('json')->go();
    }

    //删除文章
    public function del($id)
    {
        (new IDPostiveInt)->goCheck();
        $Cards = CardsModel::where('id',$id)->find();
        if(!$Cards){
            throw new BaseException(['msg'=>'文章不存在']);
        }
        $Cards->delete();
        return app('json')->go();
    }

    //更新文章
    public function up()
    {
        $validate=new CardsValidate(['id']);
        $validate->goCheck();
        $data=$this->request->param();
        $form=$validate->getDataByRule($data);
        CardsModel::updateCards($form);
        return app('json')->go();
    }

    //获取某文章详细
    public function detail($id)
    {
        (new IDPostiveInt)->goCheck();
        $data=CardsModel::getCardsContent($id);
        return app('json')->go($data);
    }

    //wangedit编辑器图片上传
    public function addWangImg()
    {
        $file = request()->file('file');
        $cid='ctx/'.date("Ymd");
        $name = UpImg::getInstance($file)->add($cid);
        $web_path=SysConfig::where('key','web_url')->value('value');
        $path=$web_path.Image::path.$cid.'/';
        $res = [
            "errno" => 0,
            "data" => [
                "url"=> $path.$name
            ]
        ];
        return json($res);
    }

}