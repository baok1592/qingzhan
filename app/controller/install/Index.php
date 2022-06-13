<?php
namespace app\controller\install;

use app\validate\InstallValidate;
use ruhua\bases\BaseCommon;
use ruhua\bases\BaseController;
use ruhua\exceptions\BaseException;
use think\facade\Db;
use think\facade\Log;
use think\facade\View;

class Index extends BaseController
{
    protected function initialize()
    {
        // 检测是否安装过
        $isInstall = file_exists(TOP_ROOT . '\data\install.lock');
        if($isInstall){
            echo "已安装，即将跳转";
            echo "<script>";
            echo "setTimeout(_=>{
                window.location.href = './'
            },2000)";
            echo "</script>";
            exit;
        }
    }

    public function step1()
    {
       return View::fetch('step1');
    }

    public function step2()
    {
        if (class_exists('pdo')) {
            $data['pdo'] = 1;
        } else {
            $data['pdo'] = 0;
        }

        if (extension_loaded('pdo_mysql')) {
            $data['pdo_mysql'] = 1;
        } else {
            $data['pdo_mysql'] = 0;
        }

        if (extension_loaded('curl')) {
            $data['curl'] = 1;
        } else {
            $data['curl'] = 0;
        }

        if (ini_get('file_uploads')) {
            $data['upload_size'] = ini_get('upload_max_filesize');
        } else {
            $data['upload_size'] = 0;
        }

        if (function_exists('session_start')) {
            $data['session'] = 1;
        } else {
            $data['session'] = 0;
        }
        return View::fetch('step2', ['data' => $data]);
    }


    public function step3()
    {
        return View::fetch('step3');
    }
    public function step4()
    {
        $web_url= $_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['SERVER_NAME'].'/';
        View::assign("web_url",$web_url);
        return View::fetch('step4');
    }
    public function createData()
    {
        $data = input('post.');
        if(!$data){
            return;
        }
        (new InstallValidate)->goCheck();
        // 连接数据库
        $link=@new \mysqli("{$data['HOST']}:{$data['PORT']}", $data['USER'], $data['PWD']);
        // 获取错误信息
        $error = $link->connect_error;
        if (!is_null($error)) {
            // 转义防止和alert中的引号冲突
            throw new BaseException(['msg' => '数据库链接失败']);
        }
        // 设置字符集
        $link->query("SET NAMES 'utf8'");
        if ($link->server_info < 5.0) {
            throw new BaseException(['msg' => '请将您的mysql升级到5.0以上']);
        }
        // 创建数据库并选中
        if (!$link->select_db($data['NAME'])) {
            $create_sql = 'CREATE DATABASE IF NOT EXISTS ' . $data['NAME'] . ' DEFAULT CHARACTER SET utf8;';
            if (!$link->query($create_sql)) {
                throw new BaseException(['msg' => '数据库链接失败.0以上']);
            }
            $link->select_db($data['NAME']);
        }
        // 导入sql数据并创建表
        $vaethink_sql = file_get_contents(TOP_ROOT . '/data/main.sql');
        $sql_array = preg_split("/;[\r\n]+/", str_replace("news_", $data['PREFIX'], $vaethink_sql));
        $username = input('post.username');
        $password = input('post.password');
        $password = password(md5($password));
        $create_time = time();

        $caeate_admin_sql = "INSERT INTO " . "`".$data['PREFIX'] . "admins"."` "
            . "VALUES "
            . "(1, 0, '$username', '$password', NULL,'0', '0', 0, '0',$create_time,$create_time, NULL)";

        $web_url= $_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['SERVER_NAME'].'/';
        $sys_sql = "UPDATE " . "`".$data['PREFIX'] . "sys_config"."` "
            . "SET  `value`='{$web_url}' WHERE `key`='web_url'" ;
        Log::error("sys_sql:");
        Log::error($sys_sql);
        try{
            foreach ($sql_array as $k => $v) {
                if (!empty($v)) {
                    $link->query($v);
                }
            }
            //更新网址
            if (!$link->query($sys_sql)) {
                throw new BaseException(['msg' => '更新配置数据失败']);
            }
            //插入管理员
            if (!$link->query($caeate_admin_sql)) {
                throw new BaseException(['msg' => '创建管理员信息失败']);
            }
            $link->commit();
            $link->close();
            $this->setDataBase($data['HOST'],$data['PORT'],$data['NAME'],$data['USER'],$data['PWD'],$data['PREFIX']);   // 创建数据库配置文件
            if (false == file_put_contents(TOP_ROOT . "\data\install.lock", '轻松建站安装文件，勿删！此次安装时间：' .
                    date('Y-m-d H:i:s', time()))) {
                throw new BaseException(['msg' => '配置文件更新失败，请检查目录权限']);
            }
        }catch (\Exception $e){
            throw new BaseException(['msg'=>'安装失败:'.$e->getMessage()]);
        }

        View::assign("web_url",$web_url);
        return View::fetch('step4');
    }

    private function setDataBase($HOST,$PORT,$NAME,$USER,$PWD,$PREFIX){
        $filePath=TOP_ROOT . '/config/database.php';
        $db_str = "
<?php
return [
    'default'         => env('database.driver', 'mysql'),
    'time_query_rule' => [],
    'auto_timestamp'  => true,
    'datetime_format' => false,
    'datetime_field'  => '',
    'connections'     => [
        'mysql' => [
            'type'            => env('database.type', 'mysql'),
            'hostname'        => env('database.hostname', '{$HOST}'),
            'database'        => env('database.database', '{$NAME}'),
            'username'        => env('database.username', '{$USER}'),
            'password'        => env('database.password', '{$PWD}'),
            'hostport'        => env('database.hostport', '{$PORT}'),
            'params'          => [],
            'charset'         => env('database.charset', 'utf8'),
            'prefix'          => env('database.prefix', '{$PREFIX}'),
            'deploy'          => 0,
            'rw_separate'     => false,
            'master_num'      => 1,
            'slave_no'        => '',
            'fields_strict'   => true,
            'break_reconnect' => false,
            'trigger_sql'     => env('app_debug', true),
            'fields_cache'    => false,
        ]
    ]
];
";
        file_put_contents($filePath, $db_str);
    }
}

