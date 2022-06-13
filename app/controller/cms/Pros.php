<?php


namespace app\controller\cms;

use app\model\Pros as ProsModel;
use app\service\ProsService;
use app\validate\ProsValidate;
use app\validate\IDPostiveInt;
use qy\Log\LogManage;
use ruhua\exceptions\BaseException;
use ruhua\bases\BaseController;
use ruhua\exceptions\CmsException;
use ruhua\utils\Logs;

class Pros extends BaseController
{
    //获取所有商品
    public function getAll()
    {
        $data=ProsModel::getAll();
        return app('json')->go($data);
    }

    //某栏目下的商品
    public function getCidPros($cid)
    {
        $data=ProsModel::getCategoryPros($cid);
        return app('json')->go($data);
    }

    //添加商品
    public function add()
    {
        $validate=new ProsValidate();
        $validate->goCheck();
        $data=$this->request->param();
        $form=$validate->getDataByRule($data);
        ProsModel::createPros($form);
        return app('json')->go();
    }

    //删除商品
    public function del($id)
    {
        (new IDPostiveInt)->goCheck();
        $Pros = ProsModel::where('id',$id)->find();
        if(!$Pros){
            throw new BaseException(['msg'=>'商品不存在']);
        }
        $Pros->delete();
        Logs::Write('删除了商品-id：'.$id);
        return app('json')->go();
    }

    //更新商品
    public function up()
    {
        $validate=new ProsValidate(['id']);
        $validate->goCheck();
        $data=$this->request->param();
        $form=$validate->getDataByRule($data);
        ProsModel::updatePros($form);
        return app('json')->go();
    }
    //修改状态
    public function editState($type,$id)
    {
        $one=ProsModel::where('id',$id)->find();
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

    //获取某商品详细
    public function detail($id)
    {
        (new IDPostiveInt)->goCheck();
        $data=ProsModel::getProsContent($id);
        return app('json')->go($data);
    }


}