<?php


namespace app\model;


use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;
use ruhua\exceptions\CmsException;
use ruhua\utils\Logs;
use think\model\concern\SoftDelete;

class Admins extends BaseModel
{
    protected $updateTime = false;
    use SoftDelete;
    protected $deleteTime = 'delete_time';

    public function access()
    {
        return $this->hasOne('GroupAccess','aid','id')->bind(['group_id']);
    }

    public function getStateAttr($v)
    {
        return $v == 1 ? true : false;
    }

    public static function createAdmin($form)
    {
        $user = self::where('username', $form['username'])->find();
        if ($user) {
            throw new CmsException(['msg' => '用户名已存在']);
        }
        $form['password'] = password($form['password']);
        try{
            $res = self::create($form);
            if (!$res) {
                throw new CmsException(['msg' => '注册失败']);
            }
            GroupAccess::create(['aid' => $res['id'], 'group_id' => $form['gid']]);
        }catch (\Exception $e){
            throw new CmsException(['msg' => $e->getMessage()]);
        }
    }

    public static function deleteAdmin($id)
    {
        if ($id <= 1) {
            throw new BaseException(['msg' => '不能删除最高管理员']);
        }
        $res = self::find($id);
        if (!$res) {
            throw new BaseException(['msg' => '用户不存在']);
        }
        $res->delete();
        Logs::Write("删除管理员","cms");
    }


    public static function updateGid($aid,$gid)
    {
        $res=GroupAccess::update(['group_id'=>$gid],['aid'=>$aid]);
        if(!$res){
            throw new CmsException();
        }
    }


    private static function getTime($month)
    {
        if ($month) {
            $start = date('Y-m', $month);
            $end = date('Y-m', strtotime('+1 month', $month));
        } else {
            $start = date('Y-m', time());
            $end = date('Y-m', strtotime('+1 month', time()));
        }
        $date['time'] = $start;
        $date['last_time'] = $end;
        return $date;
    }

}