<?php

namespace  ruhua\enum;

//自定义枚举类
class OrderEnum
{
    // 待支付
    const UNPAYID = 0;

    // 已支付
    const PAYID = 1;

    // 已发货
    const DELIVERED = 1;

    // 已支付，但库存不足
    const PAYID_BUT_OUT_OF = 3;
}