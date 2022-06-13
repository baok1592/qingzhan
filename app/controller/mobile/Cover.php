<?php

namespace app\controller\mobile;

use app\model\Category as CategoryModel;
use app\model\MbDiy as MbDiyModel;

class Cover extends MobileController
{
    public function index($cid)
    {
        $tid=CategoryModel::CategoryGetParam($cid,'mb_diy_id');
        $json = MbDiyModel::where('id',$tid)->value('json');
        $tmpJson = json_decode($json, true);
        $data=MbDiyModel::setMbPageData($cid,$tmpJson);
        return app('json')->go($data);
    }
}

