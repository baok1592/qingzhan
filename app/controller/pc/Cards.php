<?php

namespace app\controller\pc;

use app\model\Category as CategoryModel;
use app\model\PcDiy as PcDiyModel;
use think\facade\View;

class Cards extends PcDiyController
{
    public function index($id)
    {
        $this->setPageData($id);
        return View::fetch("pc/cards");
    }
}