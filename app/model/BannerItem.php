<?php


namespace app\model;


use app\model\BannerItem as BannerItemModel;
use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;
use ruhua\exceptions\CmsException;
use ruhua\utils\Logs;

class BannerItem extends BaseModel
{
    protected $hidden = ['update_time','delete_time'];

    public function img()
    {
        return $this->belongsTo('Image','img_id','id')->bind(['url']);
    }

    public function setImgAttr($v)
    {
        return $v['url'];
    }

    public static function add($form)
    {
        $res = BannerItemModel::create($form);
        if(!$res){
            throw new CmsException(['msg'=>'添加失败']);
        }
    }

    public static function del($id)
    {
        $banner = self::where('id', $id)->find();
        if (!$banner) {
            throw new BaseException(['msg' => 'AD不存在']);
        }
        $banner->delete();
        Logs::Write('删除了文章-id：' . $id);
    }

    public static function up($form)
    {
        $id=$form['id'];
        unset($form['id']);
        $ad =self::find($id);
        if(!$ad){
            throw new BaseException(['msg'=>'AD不存在']);
        }
        $ad->save($form);
    }

    public static function getAd($banner_id)
    {

        $res=self::with('img')->withoutField('update_time,sort,banner_id')
            ->where('banner_id',$banner_id)->order('sort desc')->select()->toArray();
        if(!$res){
            return [];
            //throw new BaseException(['msg'=>'AD数据错误']);
        }
        foreach ($res as $k=>$v){
            $res[$k]['jump_class']="";
            if($v['jump_id']<1){
                continue;
            }
            if($v['jump_type']=='category'){
                $type=Category::where('id',$v['jump_id'])->value('type');
                if(in_array($type,['lists','cover','cards','pros'])){
                    $res[$k]['jump_class']=$type;
                }
            }else{
                $res[$k]['jump_class']='detail';
                $res[$k]['jump_id']='?type='.$res[$k]['jump_type'].'&id='.$res[$k]['jump_id'];
            }
        }
        return $res;
    }


}