<?php

namespace app\controller\pc;

use app\model\BannerItem as BannerItemModel;
use app\model\Category as CategoryModel;
use app\model\PcDiy as PcDiyModel;
use app\model\SysConfig as SysConfigModel;
use app\model\Article as ArticleModel;
use app\model\Cards as CardsModel;
use app\model\Pros as ProsModel;
use ruhua\bases\BaseCommon;
use ruhua\exceptions\PcException;
use think\facade\Db;
use think\facade\View;

class PcDiyController
{
    protected $web_url;
    public function __construct()
    {
        $this->navAndFooter();
        $this->getCompanyInfo();
        $this->getSiteInfo();
    }

    /**
     * 获取网站企业信息
     */
    public function getCompanyInfo()
    {
        $res = SysConfigModel::where('type', 2)->field('key,value')->select()->toArray();
        $company=[];
        foreach ($res as $k=>$v){
            $company[$v['key']]=$v['value'];
        }
        View::assign("company", $company); //页面组件
    }

    /**
     * 获取网站站点信息
     */
    public function getSiteInfo()
    {
        $res = SysConfigModel::where('type', 1)->field('key,value')->select()->toArray();
        $site=[];
        foreach ($res as $k=>$v){
            $site[$v['key']]=$v['value'];
        }
        View::assign("site", $site);
    }

    /**
     * 设置页面的导航和底部
     */
    public function navAndFooter()
    {
        $home_data = $this->getHomeJson();
        if (is_array($home_data)) {
            foreach ($home_data as $v) {
                if ($v['name'] == 'nav') {
                    $this->setNav($v);
                }
                if ($v['name'] == 'footer') {
                    $this->setFooter($v);
                }
            }
        }
    }

    public function setTmpData($tmpData)
    {
        $tmp = [];
        foreach ($tmpData as $v) {
            if (in_array($v['name'], ['nav', 'footer'])) {
                continue;
            }
            $cid=$v['withid'];
            $arr=$v;
            unset($arr['json'],$arr['child'],$arr['img'],$arr['radios']);
            $arr['path'] = "../view/pc/component/{$v['name']}/{$v['child']}.html";
            if($v['name']=='slogan' || $v['name']=='count' || $v['name']=='speech'){
                $arr['list']=$v['json'];
            }
            if($v['name']=='lists' && $v['withid']>0){
                $arr['list'] = ArticleModel::getCidAll($cid);
            }
            if($v['name']=='cards' && $v['withid']>0){
                $arr['list']=CardsModel::getCidAll($cid);
            }
            if($v['name']=='pros' && $v['withid']>0){
                $arr['list']=ProsModel::getCidAll($cid);
            }
            if($v['name']=='hero' && $v['withid']>0){
                $arr['list']=BannerItemModel::getAd($cid);
            }
            $tmp[]=$arr;
        }
        return $tmp;
    }

    /**
     * 获取默认数据：当前栏目的所有数据
     */
    public function defaultData($tmpData,$category)
    {
        foreach ($tmpData as $k=>$v){
            if($v['name']==$category['type'] && $v['withid']==0){
                $cid=$category['id'];
                if($v['name']=='lists' && $cid>0){
                    $tmpData[$k]['list'] = ArticleModel::getCidAll($cid);
                }
                if($v['name']=='cards' && $cid>0){
                    $tmpData[$k]['list'] = CardsModel::getCidAll($cid);
                }
                if($v['name']=='pros' && $cid>0){
                    $tmpData[$k]['list'] = ProsModel::getCidAll($cid);
                }
            }
        }
        return $tmpData;
    }


    /**
     * 设置首页数据
     */
    public function setHomeData()
    {
        $tmpData=$this->getHomeJson();
        $tmp = [];
        foreach ($tmpData as $v) {
            if (in_array($v['name'], ['nav', 'footer'])) {
                continue;
            }
            $arr=$v;
            unset($arr['json'],$arr['child'],$arr['radios']);
            $arr['path'] = "../view/pc/component/{$v['name']}/{$v['child']}.html";
            if($v['name']=='slogan' || $v['name']=='count' || $v['name']=='speech'){
                $arr['list']=$v['json'];
            }
            if($v['name']=='lists' && $v['withid']>0){
                $arr['list']=ArticleModel::getCidIs($v['withid'],'top');
            }
            if($v['name']=='cards' && $v['withid']>0){
                $arr['list']=CardsModel::getCidIs($v['withid'],'top');
            }
            if($v['name']=='pros' && $v['withid']>0){
                $arr['list']=ProsModel::getCidIs($v['withid'],'top');
            }
            if($v['name']=='hero' && $v['withid']>0){
                $arr['list']=BannerItemModel::getAd($v['withid']);
            }
            $tmp[]=$arr;
        }
        View::assign("tmp", $tmp); //页面组件
    }

    /**
     * 设置页面数据
     */
    public function setPageData($id)
    {
        $tmpData=CategoryModel::getDiyData($id);
        $category=CategoryModel::getInfo($id);
        $tmp=$this->setTmpData($tmpData);
        $data=$this->defaultData($tmp,$category); //获取默认数据
        View::assign("tmp", $data);
        View::assign("category", $category); //当前栏目的信息
    }

    /**
     * 设置详情页面数据
     */
    public function setDetailData($tmpData)
    {
        $this->setTmpData($tmpData);
    }

    public function getHomeJson()
    {
        $id = Db::name('diy')->where('key','pc_home_temp_id')->value('value');
        if ($id < 1) {
            throw new PcException(['msg'=>'首页模板不存在']);
        }
        $where['id'] = $id;
        $where['type'] = 'home';
        $json = PcDiyModel::where($where)->value('json');
        $data = json_decode($json, true);
        return $data;
    }

    public function setNav($json)
    {
        $web_url = SysConfigModel::where('key', 'web_url')->value('value');
        $this->web_url=$web_url;
        $tmp_nav = "../view/pc/component/nav/{$json['child']}.html";
        $navs = CategoryModel::where(['level'=>0,'is_hidden'=>0])->field('id,name,type,pid,jump_url')
            ->order('sort asc')->select()->toArray();


        $navs = (new BaseCommon)->levelTree($navs);
        $home = ['id' => 0, 'name' => '首页', 'type' => 'home', 'url' => '','jump_url'=>''];
        $path = substr($_SERVER['REQUEST_URI'],1);  //当前浏览的网址
        foreach ($navs as $k => $v) {
            $navs[$k]['url'] = "{$v['type']}/{$v['id']}";
            $navs[$k]['child_path']=[];
            $navs[$k]['jump_url']=$v['jump_url'];
            if(count($v['child'])>0) {
                foreach ($v['child'] as $ko=>$vo){
                    $navs[$k]['child_path'][]="{$vo['type']}/{$vo['id']}";
                    $navs[$k]['child'][$ko]['url']="{$vo['type']}/{$vo['id']}";
                    $navs[$k]['child'][$ko]['jump_url']=$vo['jump_url'];
                }
            }
            if($navs[$k]['url']==$path || in_array($path,$navs[$k]['child_path'])){
                $navs[$k]['active']=1;
            }else{
                $navs[$k]['active']=0;
            }
        }
        array_unshift($navs, $home); //数组最前面插入元素
        View::assign("tmp_nav", $tmp_nav);
        View::assign("navs", $navs);
        View::assign("nav_json", $json);
        View::assign("web_url", $web_url);
        View::assign("path", $path);
    }

    public function setFooter($v)
    {
        $tmp_footer = "../view/pc/component/footer/{$v['child']}.html";
        View::assign("tmp_footer", $tmp_footer);
    }

    public function setLists($v)
    {
        $where['category_id'] = $v['withid'];
        $where['is_top'] = 1;
        $lists_data['list'] = ArticleModel::where($where)->select()->toArray();
        $lists_data['json'] = json_decode($v['json'], true);
        View::assign("lists_data", $lists_data);
        //dump($cards_data);
    }


}