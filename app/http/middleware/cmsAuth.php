<?php

namespace app\http\middleware;

use app\service\TokenService;
use app\service\GroupService;

class cmsAuth
{
    public function handle($request, \Closure $next)
    {
        (new GroupService())->checkRule();
        return $next($request);
    }
}