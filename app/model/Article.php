<?php


namespace app\model;


use app\model\Category as CategoryModel;
use app\service\CmsTokenService;
use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;
use ruhua\exceptions\CmsException;
use ruhua\exceptions\PcException;
use think\model\concern\SoftDelete;

class Article extends BaseModel
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

    //某栏目下的文章
    public static function getCategoryArticle($cid)
    {
        $where['id']=$cid;
        $where['type']='lists';
        $cate=CategoryModel::where($where)->find();
        if(!$cate){
            throw new CmsException(['msg'=>'栏目id错误']);
        }
        $data=self::with('img')->where('category_id',$cid)->
        withoutField('img,content')->select();
        return $data;
    }

    //所有推荐文章
    public static function getArticlebyTop($cid=0)
    {
        $where['is_top']=1;
        if($cid>0){
            $where['category_id']=$cid;
        }
        $data=self::with('img')->where($where)->withoutField('img,content')->select();
        return $data;
    }

    //所有文章
    public static function getAll($backCount=false)
    {

        $data=self::with('img')->withoutField('content,externallinks,desc')
            ->order('id desc')->select();
        if($backCount){
            return count($data);
        }
        return $data;
    }



    public static function createArticle($form)
    {
        $author=CmsTokenService::getCmsManageInfo("username");
        $form['author']=$author;

        $res = self::create($form);
        if(!$res){
            throw new CmsException(['msg'=>'添加失败']);
        }
    }

    public static function updateArticle($form)
    {
        $id=$form['id'];
        unset($form['id']);
        $model =self::find($id);
        if(!$model){
            throw new CmsException(['msg'=>'文章不存在']);
        }
        $model->save($form);
    }

    public static function getArticleContent($id)
    {
        //where in 可以是数组，也可以是字符串
        $data=self::with('img')->hidden(['img'])->where('id',$id)->find();
        if(!$data){
            throw new BaseException(['msg'=>'文章不存在']);
        }
        return $data;
    }

    //某栏目下所有文章
    public static function getCidAll($id)
    {
        //where in 可以是数组，也可以是字符串
        $data=self::with('img')->hidden(['img'])->where('category_id',$id)->select()->toArray();
        if(!$data){
            throw new PcException(['msg'=>'列表不存在']);
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