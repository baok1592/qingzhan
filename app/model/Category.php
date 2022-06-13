<?php


namespace app\model;


use ruhua\exceptions\BaseException;
use ruhua\bases\BaseModel;
use ruhua\exceptions\CmsException;
use ruhua\exceptions\PcException;
use think\facade\Db;
use think\facade\View;
use think\model\concern\SoftDelete;

class Category extends BaseModel
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';

    public function setImgAttr($v)
    {
        return $v['url'];
    }

    public function getJsonAttr($value)
    {
        return json_decode($value);
    }

    public function Article()
    {
        return $this->hasMany('Article', 'category_id', 'category_id')->field('id,short_title,category_id,title,img_id,author,summary,source,create_time');
    }


    public static function deleteCategory($id)
    {
        $category = self::where('id', $id)->find();
        if (!$category) {
            throw new CmsException(['msg' => '无该栏目！']);
        }
        $pids = self::where('pid', $id)->find();
        if ($pids) {
            throw new BaseException(['msg' => '请先删除子栏目！']);
        }
        $category->delete();
    }

    public static function updateCategory($form)
    {
        $id = $form['id'];
        unset($form['id']);
        $category = self::find($id);
        if (!$category) {
            throw new BaseException(['msg' => '栏目错误']);
        }
        $content = $form['content'];
        Db::startTrans();
        try {
            $category->save($form);
            if ($content && $category->id) {
                Cover::where('cid',$category->id)->save(['content'=>$content]);
            }
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
            throw new CmsException(['msg' => '修改失败']);
        }
    }

    public static function createCategory($form)
    {
        $form['sort'] = 0;
        $content = $form['content'];
        Db::startTrans();
        try {
            $one = self::create($form);
            if ($content && $one->id) {
                Cover::create(['cid'=>$one->id,'content'=>$content]);
            }
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
            throw new CmsException(['msg' => '新增失败']);
        }
    }

    public static function upCategorySort($arr)
    {
        if (!is_array($arr)) {
            throw new CmsException();
        }
        foreach ($arr as $v) {
            self::update(['sort' => $v['sort']], ['id' => $v['id']]);
        }
    }

    public static function getInfo($id)
    {
        $res = self::where('id', $id)->withoutField('diy_id,mb_diy_id,ctx_id,mb_ctx_id,level,img_id,sort')->find()->toArray();
        if (!$res) {
            throw new PcException(['msg'=>'栏目不存在']);
        }
        return $res;
    }
    public static function getDiyData($id)
    {
        $category = self::where('id', $id)->find();
        $json = PcDiy::where('id', $category['diy_id'])->value('json');
        $data = json_decode($json, true);
        return $data;
    }

    /**
     * 通过cid获取栏目PC模板id
     */
    public static function getTempByCid($cid,$type)
    {
        if($type=='pc'){
            $value='diy_id';
        }
        if($type=='pc_ctx'){
            $value='ctx_id';
        }
        if($type=='mb'){
            $value='mb_diy_id';
        }
        if($type=='mb_ctx'){
            $value='mb_ctx_id';
        }
        $id=self::where('id',$cid)->value($value);
        if($id<1){
            throw new PcException(['msg'=>'模板ID不存在']);
        }
        return $id;
    }

    /**
     * 通过ID获取栏目字段
     */
    public static function CategoryGetParam($id,$param)
    {
        $v=self::where('id',$id)->value($param);
        if(!$v){
            throw new PcException(['msg'=>'栏目不存在此字段']);
        }
        return $v;
    }

    /**
     * 手机端grid数据
     */
    public static function getGrid()
    {
        $where[]=['is_top','=',1];
        $where[]=['img_id','>',0];
        $data = self::where($where)->with('img')->order('sort asc')
            ->field('id,name,type,img_id')->limit(4)->select()->toArray();
        return $data;
    }


    public function img()
    {
        return $this->belongsTo('Image','img_id','id')
            ->bind(['url']);
    }

    public static function getCtxDetail($cid,$id)
    {
        $cateType=Category::CategoryGetParam($cid,'type');
        if($cateType=='pros'){
            $data=Pros::with('img')->find($id);
        }
        if($cateType=='lists'){
            $data=Article::with('img')->find($id);
        }
        if($cateType=='cards'){
            $data=Cards::with('img')->find($id);
        }
        $data['cate_type']=$cateType;
        if($cateType=='cards' || $cateType=='pros'){
            $urls=Image::where('id','in',$data['img_ids'])->field('url')->select()->toArray();
            $imgs=[];
            foreach ($urls as $v){
                $imgs[]=$v['url'];
            }
            $data['imgs']=$imgs;
        }
        if(!isset($data)){
            throw new BaseException(['msg'=>"类型错误"]);
        }
        return $data;
    }

    public static function jump($id)
    {
       return self::where('id',$id)->value('jump_url');
    }
}