<?php

namespace app\http\middleware;

//中间件，验证token，检测权限
use app\service\TokenService;
use auth\Auth;
use think\facade\Request;

class CheckCms
{
    public function handle($request, \Closure $next)
    {
        $res = TokenService::GTadmimScope();//判断是否具有管理员权限
        $aid = TokenService::getCurrentAid();
        $rule = Request::url();
        if(strchr($rule,'?'))
            $rule=substr($rule,0,strripos($rule,'?'));
        $data = (new Auth())->check($rule,$aid);
        if ($res == true && $data == true) {
            return $next($request);
        }
        return app('json')->fail('没有权限');
    }
}