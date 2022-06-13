<?php


namespace app\controller\cms;

use app\model\Link as LinkModel;  
use app\validate\IDPostiveInt;
use app\validate\LinkValidate;
use ruhua\exceptions\BaseException;
use ruhua\bases\BaseController;
use ruhua\utils\Logs; 

class Link extends BaseController
{
    //获取所有
    public function getAll()
    {
        $data=LinkModel::order('sort desc')->select();
        return app('json')->go($data);
    }


    //添加
    public function add()
    {
        $validate=new LinkValidate();
        $validate->goCheck();
        $data=$this->request->param();
        $form=$validate->getDataByRule($data);
        LinkModel::create($form);
        return app('json')->go();
    }

    //删除
    public function del($id)
    {
        (new IDPostiveInt)->goCheck();
        $Pros = LinkModel::where('id',$id)->find();
        if(!$Pros){
            throw new BaseException(['msg'=>'不存在']);
        }
        $Pros->delete();
        return app('json')->go();
    }

    //更新
    public function up()
    {
        $validate=new LinkValidate(['id']);
        $validate->goCheck();
        $data=$this->request->param();
        $form=$validate->getDataByRule($data);
        LinkModel::up($form);
        return app('json')->go();
    }

    //更新排序
    public function sort()
    {
        (new LinkModel)->upLinkSort($this->request->param());
        return app('json')->go();
    }



}