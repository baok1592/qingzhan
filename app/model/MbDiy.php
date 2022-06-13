<?php


namespace app\model;


use ruhua\bases\BaseModel;
use ruhua\exceptions\CmsException;
use ruhua\exceptions\PcException;
use think\facade\Db;
use think\model\concern\SoftDelete;

class MbDiy extends BaseModel
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';

    public static function add($param)
    {
        $res=self::create(['name'=>$param['name'],'type'=>$param['type']]);
        if(!$res){
            throw new CmsException(['msg'=>'创建失败']);
        }
    }

    public static function up($param)
    {
        $mb=self::where('id',$param['id'])->find();
        if(!$mb){
            throw new CmsException();
        }
        $json=json_encode($param['data'],JSON_UNESCAPED_UNICODE);
        $mb->save(['json'=>$json]);
    }

    //根据diy的ID获取json
    public static function getDiyDataById($id)
    {
        $json = self::where('id', $id)->value('json');
        $data = json_decode($json, true);
        return $data;
    }

    //根据ctx或封面内容
    public static function detailByType($cid,$id)
    {
        $type=Category::CategoryGetParam($cid,'type');
        $model=new Cover();
        if($type=='pros'){
            $model=new Pros();
        }
        if($type=='lists'){
            $model=new Article();
        }
        if($type=='cards'){
            $model=new Cards();
        }
        $res=$model->where('id',$id)->find();
        if(!$res){
            throw new PcException(['msg'=>'内容不存在']);
        }
        return $res->content;
    }

    /**
     * 手机端组装页面数据
     */
    public static function setMbHomeData($tmp)
    {
        foreach ($tmp as $k=>$v) {
            $tmp[$k]['data']=[];
            $cid=$tmp[$k]['withid'];
            if($v['name']=='hero'){
                $tmp[$k]['data']=BannerItem::getAd($cid);
            }
            if($v['name']=='grid'){
                $tmp[$k]['data']=Category::getGrid();
            }
            if($v['name']=='lists'){
                if($cid>0) {
                    $tmp[$k]['data'] = Article::getCategoryArticle($cid);
                }
                $tmp[$k]['data'] = Article::getArticlebyTop($cid);
            }
            if($v['name']=='pros'){
                if($cid>0) {
                    $tmp[$k]['data']=Pros::getCategoryPros($cid);
                }
                $tmp[$k]['data'] =Pros::getProsbyTop($cid);
            }
            if($v['name']=='cards'){
                if($cid>0) {
                    $tmp[$k]['data'] = Cards::getCategoryCards($cid);
                }
                $tmp[$k]['data'] =Cards::getCardsbyTop($cid);
            }
            if($v['name']=='ask'){
                $ask=Ask::getJson($cid);
                $tmp[$k]['data']=$ask['json'];
            }
        }
        return $tmp;
    }

    /**
     * 手机端组装页面数据
     */
    public static function setMbPageData($cid,$tmp)
    {
        foreach ($tmp as $k=>$v) {
            $tmp[$k]['data']=[];
            if($tmp[$k]['withid']>0){
                $cid=$tmp[$k]['withid'];
            }
            if($v['name']=='hero'){
                $tmp[$k]['data']=BannerItem::getAd($tmp[$k]['withid']);
            }
            if($v['name']=='grid'){
                $tmp[$k]['data']=Category::getGrid();
            }
            if($v['name']=='lists'){
                $tmp[$k]['data']=Article::getCategoryArticle($cid);
            }
            if($v['name']=='cards'){
                $tmp[$k]['data']=Cards::getCategoryCards($cid);
            }
            if($v['name']=='pros'){
                $tmp[$k]['data']=Pros::getCategoryPros($cid);
            }
            if($v['name']=='ask'){
                $ask=Ask::getJson($cid);
                $tmp[$k]['data']=$ask['json'];
            }
            if($v['name']=='content'){
                $tmp[$k]['data'] = Cover::getCtxByCid($cid);
            }
        }
        return $tmp;
    }

    public static function getHomeJson()
    {
        $id = Db::name('diy')->where('key','mb_home_temp_id')->value('value');
        if ($id < 1) {
            throw new PcException(['msg'=>'首页模板不存在']);
        }
        $where['id'] = $id;
        $where['type'] = 'home';
        $json = MbDiy::where($where)->value('json');
        $data = json_decode($json, true);
        return $data;
    }

}