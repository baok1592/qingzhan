<?php
declare (strict_types = 1);

namespace app;

use ruhua\utils\System;
use ruhua\utils\Json;
use think\Service;

/**
 * 应用服务类
 */
class AppService extends Service
{
    public function register()
    {
        // 服务注册
        $this->app->bind( 'json',Json::class);
        $this->app->bind( 'system',System::class);
    }

    public function boot()
    {
        // 服务启动
    }
}
