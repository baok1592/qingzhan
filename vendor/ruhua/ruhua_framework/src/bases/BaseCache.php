<?php

namespace ruhua\bases;

use think\facade\Cache;


class BaseCache
{
    protected static $TagName = '_rh857_';

    /**
     * 缓存句柄
     *
     */
    public static function handler()
    {
        return Cache::tag(self::$TagName);
    }

    /**
     * 写入缓存
     * @param string $name 缓存名称
     * @param mixed $value 缓存值
     * @param int $expire 缓存时间，为0读取系统缓存时间
     * @return bool
     */
    public static function set(string $name, $value, int $expire = null): bool
    {
        //*需先判断setting配置文件是否存在
        $expire = !is_null($expire) ? $expire : config("setting.cache_expire_in");
        if (!is_int($expire)){
            $expire = $expire*1;
        }
        return self::handler()->set($name, $value, $expire);
    }

    /**
     * 如果不存在则写入缓存
     * @param string $name
     * @param bool $default
     * @return mixed
     */
    public static function get(string $name, $default = false, int $expire = null)
    {
        $expire = !is_null($expire) ? $expire : config("setting.cache_expire_in");
        if (!is_int($expire)){
            $expire = $expire*1;
        }
        //remember() 获取缓存，不存在则写入缓存数据后返回； 第二个参数为不存在则写入的数据
        return self::handler()->remember($name, $default, $expire);
    }

    /**
     * 删除缓存
     * @param string $name
     * @return bool
     */
    public static function delete(string $name)
    {
        return Cache::delete($name);
    }

    /**
     * 清空缓存
     * @return bool
     */
    public static function clear()
    {
        return self::handler()->clear();
    }
}