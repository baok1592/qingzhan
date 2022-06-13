<?php

namespace app\controller\pc;

use app\model\Category as CategoryModel;
use app\model\Image;
use app\model\PcDiy as PcDiyModel;
use ruhua\exceptions\PcException;
use think\facade\View;

class Index extends PcDiyController
{
    public function index()
    {
        $this->setHomeData();
        return View::fetch("pc/index");
    }

    public function detail()
    {
        $cid=input('cid');
        $id=input('id');
        $type=input('type');
        if($cid && $id) {
            $ctx = PcDiyModel::detailByType($cid, $id);
        }elseif($type && $id) {
            $ctx = PcDiyModel::getCtxByType($type,$id);
        }else{
            throw new PcException(['msg'=>'栏目不存在']);
        }
        $category=CategoryModel::getInfo($cid);
        if($category['type']=='cards' || $category['type']=='pros'){
            $urls=Image::where('id','in',$ctx['img_ids'])->field('url')->select()->toArray();
            $imgs=[];
            foreach ($urls as $v){
                $imgs[]=$v['url'];
            }
            $ctx['imgs']=$imgs;
        }
        View::assign("ctx", $ctx);
        View::assign("category", $category); //当前栏目的信息
        return View::fetch("pc/detail");
    }

    /**
     * 跳转到不同类型的栏目
     */
    public function categoryJump($id)
    {
        $type=CategoryModel::CategoryGetParam($id,'type');
        $url=$this->web_url.$type.'/'.$id;
        echo "<script type='text/javascript'>";
        echo "window.location.href='".$url."'";
        echo "</script>";
    }



}