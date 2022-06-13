<?php

namespace ruhua\utils;

use ruhua\exceptions\CmsException;
use think\Image as TpImage;

class UpImg
{
    private static $instance;
    protected $path = '/uploads/imgs/';
    protected $file = "";
    protected $isThumb = true;

    /**
     * 单例模式
     */
    public static function getInstance($file, $isThumb = true)
    {
        if (is_null(self::$instance)) {
            self::$instance = new self($file, $isThumb);
        }
        return self::$instance;
    }

    protected function __construct($file, $isThumb)
    {
        $this->file = $file;
        $this->isThumb = $isThumb;
    }

    //添加图片
    public function add($cid)
    {
        $this->checkImg(); //判断类型
        $this->createDir($cid);
        $nameArr = $this->setName();
        $this->saveLocal($cid, $nameArr[0]);
        return $nameArr[0];
    }

    //创建缩略图
    public function createThumb($cid, $name, $size)
    {
        $file = TpImage::open($this->file);    //打开图片
        $file->thumb($size, $size, 1)->save('.' . $this->path . $cid . '/' . $name);
    }

    //保存到本地
    public function saveLocal($cid, $name)
    {
        \think\facade\Filesystem::disk('public')->
        putFileAs($this->path . $cid, $this->file, $name);
    }

    //设置文件名
    public function setName()
    {
        $houzui = $this->file->getOriginalExtension();   //获取后缀名
        $uniqid = uniqid();
        $nameArr[0] = $uniqid . "." . $houzui;
        $nameArr[1] = $uniqid . "_thumb." . $houzui;
        return $nameArr;
    }

    //判断类型
    public function checkImg()
    {
        $houzui = $this->file->getOriginalExtension();   //获取后缀名
        if ($houzui != "jpg" && $houzui != "jpeg" && $houzui != "png" && $houzui != "gif") {
            throw new CmsException(['msg' => '非图片格式']);
        }
    }

    //创建目录
    public function createDir($cid)
    {
        try {
            if (!is_dir(ROOT . $this->path . $cid)) {
                //创建一个目录，参数2：权限，参数3：是否递归
                mkdir(ROOT . $this->path . $cid, 0774, true);
            }
        } catch (\Exception $e) {
            throw new CmsException(['msg' => '目录不存在']);
        }
    }

}