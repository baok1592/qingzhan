<?php
namespace app\validate;

use ruhua\bases\BaseValidate;

class InstallValidate extends BaseValidate
{
    protected $rule = [
        'HOST'        => 'require',
        'PORT'        => 'require',
        'USER'        => 'require',
        'NAME'        => 'require',
        'PREFIX'      => 'require',
        'username'       => 'require',
        'password'       => 'require|confirm',
    ];

    protected $message = [
        'HOST.require'           => '数据库地址不能为空',
        'PORT.require'           => '数据库端口不能为空',
        'USER.require'           => '数据库用户名不能为空',
        'NAME.require'           => '数据库名字不能为空',
        'PREFIX.require'         => '表前缀不能为空',
        'username.require'          => '管理员账户不能为空',
        'password.require'          => '密码不能为空',
        'password.confirm'          => '两次密码不一致',
    ];

    protected $scene = [
        
    ];
}