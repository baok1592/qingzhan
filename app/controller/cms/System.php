<?php


namespace app\controller\cms;

use app\model\SysConfig as SysConfigModel;
use ruhua\bases\BaseController;
use think\facade\App;
use think\facade\Db;


class System extends BaseController
{
    //cms站点信息
    public function getCmsSysData()
    {
        $data=SysConfigModel::where('key','in','web_url,site_name,tel')->
        field('key,value')->select();
        return app('json')->go($data);
    }
    //按类型获取配置信息
    public function getConfigType($type)
    {
        $data=SysConfigModel::where(['type'=>$type,'is_use'=>1])->order('id asc')->
        field('id,key,value,desc,switch,other')->select();
        return app('json')->go($data);
    }
    //修改配置信息
    public function up()
    {
        (new SysConfigModel())->updateConfig($this->request->param());
        return app('json')->go();
    }
    //获取环境信息
    public function systemInfo(){
        $mysql=Db::query("SELECT VERSION() AS ver");
        $data=[['操作系统',PHP_OS],['php版本',PHP_VERSION],['ThinkPHP版本',App::version()],['上传附件限制',ini_get('upload_max_filesize')],
            ['执行时间限制',ini_get('max_execution_time').'秒'],['剩余空间',round((disk_free_space(".")/(1024*1024)),2).'M',],
            ['程序运行目录',public_path()],['数据库版本',$mysql[0]["ver"]]
            ];
        return app('json')->go($data);
    }
    //清除缓存
    public function ClearCache(){
        $post=input('post.');
        if(!empty($post['temp']))
            deldir(VAE_ROOT.'/runtime/temp');
        if(!empty($post['log']))
            deldir(VAE_ROOT.'/runtime/log');
        if(!empty($post['cache']))
            deldir(VAE_ROOT.'/runtime/cache');
        return app('json')->go();
    }
}