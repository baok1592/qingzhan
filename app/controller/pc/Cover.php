<?php

namespace app\controller\pc;

use app\model\Category as CategoryModel;
use app\model\Cover as CoverModel;
use think\facade\View;

class Cover extends PcDiyController
{
    public function index($id)
    {
        $this->setPageData($id);
        $ctx=CoverModel::where('cid',$id)->value('content');
        View::assign("ctx", $ctx);
        return View::fetch("pc/cover");
    }
}

