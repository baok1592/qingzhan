<?php
use think\facade\Route;

//手机端接口
Route::group('client/', function() {
    Route::get('foot_navs', 'mobile.index/getFootNavs'); //获取底部导航
    Route::get('index', 'mobile.index/index'); //首页数据
    Route::get('list', 'mobile.lists/index');//某list数据
    Route::get('cover', 'mobile.cover/index');//某cover数据
    Route::get('detail', 'mobile.index/detail');//某内容详情
    Route::get('sys', 'mobile.index/getsys');//站点信息
});

