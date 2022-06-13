<?php

namespace  ruhua\subscribes;


use app\model\FxAgent as FxAgentModel;
use app\model\FxBind as FxBindModel;
use app\model\FxBind;
use app\model\FxRecord;
use think\facade\Log;

/**
 * 分销事件
 * Class ProductSubscribe
 * @package crmeb\subscribes
 */
class FxSubscribes
{

    public function handle()
    {

    }

    /**
     * 添加商品分销提现记录
     * @param $event
     */
    public function onAddGoodsFxRecord($event){
        list($oid,$uid)=$event;
        Log::error("进入自动提现事件");
        if(app('system')->getValue('fx_status') != 0) {
            FxRecord::addRecord($oid, $uid);
        }
    }

    /**
     * 添加VIP分销提现记录
     * @param $event
     */
    public function onAddVipFxRecord($event){
        list($oid,$uid)=$event;
        if(app('system')->getValue('fx_status') != 0) {
            FxRecord::addVipRecord($oid, $uid);
        }
    }
}