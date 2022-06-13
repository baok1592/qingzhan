<?php

namespace  ruhua\exceptions;


class UserException extends BaseException
{
    // HTTP 状态码 404,200
    public $code = 400;

    // 错误具体信息
    public $msg = '用户不存在';

    // 错误具体信息
    public $message = '用户不存在';

    // 自定义的错误码
    public $errorCode = 10001;
}