<?php


namespace app\controller\cms;


use app\model\Article as ArticleModel;
use app\model\Cover;
use app\validate\CategoryValidate;
use app\validate\IDPostiveInt;
use ruhua\bases\BaseController;
use app\model\Category as CategoryModel;
use app\model\Image as ImageModel;
use ruhua\exceptions\CmsException;
use ruhua\exceptions\PcException;
use think\Exception;
use think\facade\Db;

class Category extends BaseController
{


    //获取所有栏目
    public function getAll($type="")
    {
        $where=[];
        if($type!=""){
            $where['type']=$type;
        }
        $arr = CategoryModel::where($where)->field('id,name,type,img_id,diy_id,ctx_id,sort,
        is_top,is_hidden,pid')
            ->order('sort asc')->select()->toArray();
        $imgModel=new ImageModel();
        $qz='/uploads/imgs/';
        foreach ($arr as $k=>$item){
            if($item['img_id']>0){
                $arr[$k]['img']=$qz.$imgModel->where('id',$item['img_id'])->value('url');
            }else{
                $arr[$k]['img']="";
            }
        }
        return app('json')->go($arr);
    }

    //修改首页模板ID
    public function upHomeTmp($pid,$mid)
    {
        try {
            Db::name('diy')->where('key', 'pc_home_temp_id')->save(['value' => $pid]);
            Db::name('diy')->where('key', 'mb_home_temp_id')->save(['value' => $mid]);
        }catch (\Exception $e){
            throw new PcException(['msg'=>"修改失败"]);
        }
        return app('json')->go();
    }

    //修改状态
    public function editState($type,$id)
    {
        $one=CategoryModel::where('id',$id)->find();
        if(!$one){
            throw new CmsException(['msg'=>'栏目不存在']);
        }
        if($type=='is_hidden'){
            $state=$one->is_hidden==1?0:1;
            $one->save(['is_hidden'=>$state]);
        }
        if($type=='is_top'){
            $state=$one->is_top==1?0:1;
            $one->save(['is_top'=>$state]);
        }
        return app('json')->go();
    }

    public function add()
    {
        (new CategoryValidate)->goCheck();
        CategoryModel::createCategory($this->request->param());
        return app('json')->go();
    }

    public function up()
    {
        (new CategoryValidate)->goCheck();
        CategoryModel::updateCategory($this->request->param());
        return app('json')->go();
    }

    public function del($id) {
        (new IDPostiveInt())->goCheck();
        CategoryModel::deleteCategory($id);
        return app('json')->go();
    }

    public function up_sort()
    {
        CategoryModel::upCategorySort($this->request->param());
        return app('json')->go();
    }

    public function detail($id)
    {
        $data=CategoryModel::with('img')->find($id)->toArray();
        $data['content']="";
        if($data['type']=='cover'){
            $data['content']=Cover::where('cid',$data['id'])->value('content');
        }
        return app('json')->go($data);
    }

}
