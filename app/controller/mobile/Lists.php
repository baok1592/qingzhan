<?php

namespace app\controller\mobile;

use app\model\Category as CategoryModel;
use app\model\MbDiy as MbDiyModel;
use think\facade\View;

class Lists extends MobileController
{
    public function index($cid)
    {
        $tid=CategoryModel::CategoryGetParam($cid,'mb_diy_id');
        $json = MbDiyModel::where('id',$tid)->value('json');
        $tmpArr = json_decode($json, true);
        $data=[];
        if($tmpArr && count($tmpArr)>0) {
            $data = MbDiyModel::setMbPageData($cid, $tmpArr);
        }
        return app('json')->go($data);
    }
}