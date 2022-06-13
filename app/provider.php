<?php
//use app\ExceptionHandle;//原TP异常类
use ruhua\exceptions\ExceptionHandle;//自定义异常类
use app\Request;

// 容器Provider定义文件
return [
    'think\Request'          => Request::class,
    'think\exception\Handle' => ExceptionHandle::class,
];
