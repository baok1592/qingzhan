<?php

namespace app\service;

use app\model\GroupAccess;
use ruhua\exceptions\CmsException;
use think\facade\Request;

/**
 * 权限管理service
 * Class GroupService
 * @package app\services
 */
class GroupService
{
    protected $white=["cms.admins/myInfo","cms.ad/getPcAll","cms.ad/getMbAll",
    "cms.ad/adSeat",'cms.ad/getMbSidAll'];
    /**
     * 检查是否有权限
     * @param $id
     * @return bool
     */
    public function checkRule()
    {
        $control = Request::controller();
        $control = strtolower($control);    //转小写
        //$con = str_ireplace('cms.', '', $control); //去掉cms.
        $action = Request::action();    //保持大小写
        $name=$control.'/'.$action;
        //白名单
        if(in_array($name,$this->white)){
            return true;
        }

        $auth=GroupAccess::getMyAuths();
        if(!array_key_exists($control,$auth)){
            throw new CmsException(['msg'=>"无权限"]);
        }
        if(!in_array($action,$auth[$control]) && !in_array('alls',$auth[$control])){
            throw new CmsException(['msg'=>"权限错误"]);
        }
    }



}