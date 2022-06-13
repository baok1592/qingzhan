<?php

namespace  ruhua\events\listens;

use app\model\Goods as GoodsModel;
use think\facade\Log;


class ReduceStock
{
    public function handle($event)
    {
        $post = $event;
        $this->reduceStock($post);
    }

    public function reduceStock($data){
        GoodsModel::ReduceStock($data['order_id']);
    }

}