<?php
// 应用公共文件

// 应用公共文件
define('IS_WRITE', true);

function curl_get($url, &$httpCode = 0)
{
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $web = \think\facade\Request::domain();
    curl_setopt(
        $ch, CURLOPT_HTTPHEADER,
        array(
            'web_url:' . $web,

        )
    );

    //不做证书校验,部署在linux环境下请改为true
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
    $file_contents = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    return $file_contents;
}

function curl_pay_get($url, $token = "")
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt(
        $ch, CURLOPT_HTTPHEADER,
        array(
            'Authorization:WECHATPAY2-SHA256-RSA2048 ' . $token,
            'Content-Type: application/json',
            'Accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'User-Agent:Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022)'
        )
    );

    //不做证书校验,部署在linux环境下请改为true
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
    $file_contents = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    return $file_contents;
}

function curl_download($url, $dir)
{
    $ch = curl_init($url);
    $fp = fopen($dir, "wb");
    curl_setopt($ch, CURLOPT_FILE, $fp);
    curl_setopt($ch, CURLOPT_TIMEOUT, 240);          //单位 秒，也可以使用
    curl_setopt($ch, CURLOPT_HEADER, 0);
    $res = curl_exec($ch);
    curl_close($ch);
    fclose($fp);
    return $res;
}

function curl_post($url, array $params = array(), $token = "")
{
    $data_string = json_encode($params);


    $web = \think\facade\Request::domain();

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 50);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
    curl_setopt(
        $ch, CURLOPT_HTTPHEADER,
        array(
            'Authorization:WECHATPAY2-SHA256-RSA2048 ' . $token,
            'Content-Type: application/json',
            'web_url:' . $web,
            'Accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'User-Agent:Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022)'
        )
    );
    $data = curl_exec($ch);
    curl_close($ch);
    return ($data);
}

/**
 * 根据数据生成树形结构数据
 * @param array $data 要转换的数据集
 * @param int $pk 主键（栏目id）
 * @param string $pid parent标记字段
 * @return array
 */
function create_tree($data, $pk = 'id', $pid = 'pid')
{
    $tree = $list = [];

    foreach ($data as $val) {
        $list[$val[$pk]] = $val;
    }

    foreach ($list as $key => $val) {
        if ($val[$pid] == 0) {
            $tree[] = &$list[$key];
        } else {
            //找到其父类
            $list[$val[$pid]]['children'][] = &$list[$key];
        }
    }
    return $tree;
}

function curl_post_baidu($url, array $params = array(), $token = "")
{
    $ch = curl_init();
    $options = array(
        CURLOPT_URL => $url,
        CURLOPT_POST => true,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POSTFIELDS => implode("\n", $params),
        CURLOPT_HTTPHEADER => array('Content-Type: text/plain'),
    );
    curl_setopt_array($ch, $options);
    $result = curl_exec($ch);
    curl_close($ch);
    return $result;
}

/**
 * 管理员密码加密方式
 * @param $password  密码
 * @param $password_code 密码额外加密字符
 * @return string
 */
function password($password)
{
    $password_code = config('setting.psw_code');
    return md5(md5($password) . md5($password_code));
}

//判断系统是否完成安装
function vae_is_installed()
{
    static $vaeIsInstalled;
    if (empty($vaeIsInstalled)) {
        $vaeIsInstalled = file_exists(VAE_ROOT . 'data/install.lock');
    }
    return $vaeIsInstalled;
}

//删除文件夹下所有文件
function deldir($dir)
{
    //先删除目录下的文件：
    $dh = opendir($dir);
    while ($file = readdir($dh)) {
        if ($file != "." && $file != "..") {
            $fullpath = $dir . "/" . $file;
            if (!is_dir($fullpath)) {
                unlink($fullpath);
            } else {
                deldir($fullpath);
            }
        }
    }
    closedir($dh);
    //删除当前文件夹：
    if (rmdir($dir)) {
        return true;
    } else {
        return false;
    }
}

function parse_sql($sql = '', $limit = 0, $prefix = [])
{

    // 被替换的前缀
    $from = '';
    // 要替换的前缀
    $to = '';
    // 替换表前缀
    if (!empty($prefix)) {
        $to = current($prefix);
        $from = current(array_flip($prefix));

    }

    if ($sql != '') {
        // 纯sql内容
        $pure_sql = [];

        // 多行注释标记
        $comment = false;

        // 按行分割，兼容多个平台
        $sql = str_replace(["\r\n", "\r"], "\n", $sql);
        $sql = explode("\n", trim($sql));
        \think\facade\Log::error($sql);
        // 循环处理每一行
        foreach ($sql as $key => $line) {
            \think\facade\Log::error($line);
            // 跳过空行
            if ($line == '') {
                continue;
            }

            // 跳过以#或者--开头的单行注释
            if (preg_match("/^(#|--)/", $line)) {
                continue;
            }

            // 跳过以/**/包裹起来的单行注释
            if (preg_match("/^\/\*(.*?)\*\//", $line)) {
                continue;
            }

            // 多行注释开始
            if (substr($line, 0, 2) == '/*') {
                $comment = true;
                continue;
            }

            // 多行注释结束
            if (substr($line, -2) == '*/') {
                $comment = false;
                continue;
            }

            // 多行注释没有结束，继续跳过
            if ($comment) {
                continue;
            }

            // 替换表前缀
            if ($from != '') {
                $line = str_replace('`' . $from, '`' . $to, $line);
            }
            if ($line == 'BEGIN;' || $line == 'COMMIT;') {
                continue;
            }
            // sql语句
            array_push($pure_sql, $line);
        }

        // 只返回一条语句
        if ($limit == 1) {
            return implode("", $pure_sql);
        }

        // 以数组形式返回sql语句
        $pure_sql = implode("\n", $pure_sql);
        $pure_sql = explode(";\n", $pure_sql);
        return $pure_sql;
    } else {
        return $limit == 1 ? '' : [];
    }
}
