<?php

use think\facade\Route;
//系统安装
Route::group('install', function () {
    Route::get('', 'install.Index/step1');
    Route::get('step2', 'install.Index/step2');
    Route::get('step3', 'install.Index/step3');
    Route::get('step4', 'install.Index/step4');
    Route::post('start', 'install.Index/createData');
});