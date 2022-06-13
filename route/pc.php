<?php
use think\facade\Route;


Route::get('/', 'pc.index/index');
Route::get('cover/:id', 'pc.cover/index');
Route::get('lists/:id', 'pc.lists/index');
Route::get('cards/:id', 'pc.cards/index');
Route::get('pros/:id', 'pc.pros/index');
Route::get('detail', 'pc.index/detail');
Route::get('category/:id', 'pc.index/categoryJump');