<?php


namespace app\model;


use app\model\Category as CategoryModel;
use app\service\TokenService;
use ruhua\bases\BaseModel;
use ruhua\exceptions\CmsException;
use ruhua\exceptions\PcException;
use think\model\concern\SoftDelete;

class Pros extends BaseModel
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $hidden=['type'];

    public function category(){
        return $this->belongsTo('Category','category_id','category_id');
    }



    public function img()
    {
        return $this->belongsTo('Image','img_id','id')->bind(['url']);
    }

    //文章或图集
    public static function getAll()
    {
        $data=self::with('img')->hidden(['img','content','delete_time','uniacid'])->order('id desc')->select();
        return $data;
    }

    //某栏目下的商品
    public static function getCategoryPros($cid)
    {
        $where['id']=$cid;
        $where['type']='pros';
        $cate=CategoryModel::where($where)->find();
        if(!$cate){
            throw new CmsException(['msg'=>'栏目id错误']);
        }
        $data=self::with('img')->where('category_id',$cid)->withoutField('img,content')->select();
        return $data;
    }

    //所有推荐
    public static function getProsbyTop($cid=0)
    {
        $where['is_top']=1;
        if($cid>0){
            $where['category_id']=$cid;
        }
        $data=self::with('img')->where($where)->withoutField('img,content')->select();
        return $data;
    }

    public static function createPros($form)
    {

        $aid=TokenService::getCurrentAid();
        $form['aid']=$aid;
        if(count($form['img_ids'])<1){
            throw new CmsException(['msg'=>'图片错误']);
        }
        $form['img_id']=$form['img_ids'][0];
        $form['img_ids']=implode(',',$form['img_ids']);
        $res = self::create($form);
        if(!$res){
            throw new CmsException(['msg'=>'添加失败']);
        }
    }

    public static function updatePros($form)
    {
        $id=$form['id'];
        unset($form['id']);
        $Pros =self::find($id);
        if(!$Pros){
            throw new CmsException(['msg'=>'文章不存在']);
        }
        if(count($form['img_ids'])<1){
            throw new CmsException(['msg'=>'图片错误']);
        }
        $form['img_id']=$form['img_ids'][0];
        $form['img_ids']=implode(',',$form['img_ids']);
        $Pros->save($form);
    }

    public static function getProsContent($id)
    {
        $data=self::with('img')->hidden(['img','aid'])->where('id',$id)->find();
        if(!$data){
            throw new CmsException(['msg'=>'文章不存在']);
        }
        $data['urls']=Image::getIds($data->img_ids);
        $data['img_ids']=explode(",",$data['img_ids']);
        return $data;
    }


    public static function getCidAll($id)
    {
        //where in 可以是数组，也可以是字符串
        $data=self::with('img')->hidden(['img'])->where('category_id',$id)->select()->toArray();
        if(!$data){
            throw new PcException(['msg'=>'产品不存在']);
        }
        return $data;
    }

    //某栏目下所有推荐/热门/最新
    public static function getCidIs($id,$type="hot")
    {
        $where[]=['category_id','=',$id];
        if($type=='hot') {
            $where[] = ['is_hot', '=', 1];
        }
        if($type=='new') {
            $where[] = ['is_new', '=', 1];
        }
        if($type=='top') {
            $where[] = ['is_top', '=', 1];
        }
        //where in 可以是数组，也可以是字符串
        $data=self::with('img')->hidden(['img'])->where($where)->select()->toArray();
        return $data?:[];
    }

}