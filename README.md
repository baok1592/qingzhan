## 项目介绍
如花建站系统是一款多端合一的网站搭建系统，简单易用的拖拽搭建，一键拥有PC网站、小程序、app、公众号、微网站H5。
丰富的组件 高颜值的外观 针对搜索引擎SEO优化。无论是满足企业网站需求，还是站群排名，个人建站推广，均适用。


**【如花建站系统-轻松自助建站】可免费使用，您的star是我们前进的动力**

<br/>

## 主要特性
1.  如花建站系统，基于 vue3 + Thinkphp6 开发
2.  丰富的组件，可视化DIY装修，可随心所欲装扮自己的网站
3.  数据和界面模板样式相分离，清晰简洁的将一套数据多端共用，PC和手机实现相互独立的界面样式
4.  强化路由功能，采用RESTful接口标准，三大路由：pc、mobile、admin
5.  API支持完善，方便二次开发
6.  支持一键安装，即将支持在线更新，方便快捷
7.  后台支持多语言切换，网站需要多语言的，简单二开下即可

<br/>

## 体验
官网：https://qz.ruhuashop.com/

PC演示：https://qz1.ruhuashop.com/

后台演示： https://qz1.ruhuashop.com/qzcms/

<br/>

## 安装 轻站系统

git下载后放到站点目录下，直接访问： ```域名/install``` 即可进行一键安装

注：未映射域名，直接用localhost的，建议直接导入data/main.sql文件，修改config/database.php中数据库配置信息即可

安装手册：https://www.yuque.com/u127926/mx35wr/ar67if

<br/>

## 架构特色
1.  内容管理后台：<br/>
基于 Typescirpt + vue3 + elementplus + pinia + webpack5 <br/>
使用了antfu大神的 [unplugin-auto-import](https://github.com/antfu/unplugin-auto-import) 和 [unocss](https://github.com/unocss/unocss)
<br/>
未使用vite 是考虑到目前webpack使用者较多

2.  手机端/用户端：<br/>
采用uniapp开发，基于vue3 + js。Hbuilder下使用 TS 不顺手，所以用的JS开发，也便于不熟悉TS的同学二开和交流

3.  PC端和API：<br/>
Thinkphp6对于PC端的渲染是简单易用，能灵活的实现页面组件切换。
CMV模式结构清晰，二开上手快。


<br/>


## 目录说明

<br/>

```
站点根目录
    ├─app                       // 控制器、模型、服务
    ├─config                    // 配置文件 
    ├─data                      // 一键安装及sql文件
    ├─route                     // 路由
    ├─view                      // PC 视图文件
    ├─public                    // 外部可访问文件
      ├─h5                      // 手机端网站
      ├─qzcms                   // CMS后台管理
      ├─assets                  // 图片、css、js
      ├─uploads                 // 上传的文件

```


<br/>

<p align="center">
  <img src="https://raw.githubusercontent.com/baok1592/qingzhan/main/public/assets/show1.jpg">
</p>
<p align="center">
  <img src="https://raw.githubusercontent.com/baok1592/qingzhan/main/public/assets/show2.jpg">
</p>
