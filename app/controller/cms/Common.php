<?php

namespace app\controller\cms;

use app\model\Admins as AdminsModel;
use app\model\Image as ImageModel;
use ruhua\bases\BaseController;
use app\model\Article as ArticleModel;
use app\model\Cards as CardsModel;
use app\model\Pros as ProsModel;
use app\model\User as UserModel;
use ruhua\utils\UpImg;

class Common extends BaseController
{
    //统计
    public function statistics()
    {
        $res=[
            "user"=>[],
            "ctx"=>[],
            "page_view"=>[],
            "login_log"=>[]
        ];
        $res['ctx']['lists']=ArticleModel::getAll(true);
        $res['ctx']['cards']=CardsModel::getAll(true);
        $res['ctx']['pros']=ProsModel::count();

        $res['user']['all']='--';
        $res['user']['gzh']='--';
        $res['user']['xcx']='--';
        $res['login_log'] = AdminsModel::order("login_time desc")->field('login_time,username')->limit(10)->select();
        return app('json')->go($res);
    }


}