<?php


namespace app\model;


use app\model\Category as CategoryModel;
use ruhua\bases\BaseModel;
use ruhua\exceptions\CmsException;
use ruhua\exceptions\PcException;
use think\model\concern\SoftDelete;

class PcDiy extends BaseModel
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
        $pc=self::where('id',$param['id'])->find();
        if(!$pc){
            throw new CmsException();
        }
        $json=json_encode($param['data'],JSON_UNESCAPED_UNICODE);
        $pc->save(['json'=>$json]);
    }

    //根据diy的ID获取json
    public static function getDiyDataById($id)
    {
        $json = self::where('id', $id)->value('json');
        $data = json_decode($json, true);
        return $data;
    }

    //获取ctx
    public static function detailByType($cid,$id)
    {
        $type=CategoryModel::CategoryGetParam($cid,'type');
        $model=new Article();
        if($type=='pros'){
            $model=new Pros();
        }
        if($type=='cards'){
            $model=new Cards();
        }
        $res=$model->where('id',$id)->find()->toArray();
        if(!$res){
            throw new PcException(['msg'=>'内容不存在']);
        }
        return $res;
    }

    /**
     * 根据类型和ID获取详情内容
     */
    public static function getCtxByType($type,$id)
    {
        $model=new Article();
        if($type=='pros'){
            $model=new Pros();
        }
        if($type=='cards'){
            $model=new Cards();
        }
        $res=$model->where('id',$id)->find()->toArray();
        if(!$res){
            throw new PcException(['msg'=>'内容不存在']);
        }
        return $res;
    }

}