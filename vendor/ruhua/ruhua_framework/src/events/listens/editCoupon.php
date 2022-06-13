<?php

namespace  ruhua\events\listens;


use app\model\UserCoupon as UserCouponModel;
use  ruhua\exceptions\OrderException;

class editCoupon
{
    public function handle($event)
    {
        $post=$event;
        $this->editCoupon($post);
    }

    /**
     * 优惠券使用完成
     * @param $data
     * @throws OrderException
     */
    public function editCoupon($data){
        if($data['coupon_id']){

            $coupon=UserCouponModel::where('id',$data['coupon_id'])->update(['status'=>2]);
            if(!$coupon){
                throw new OrderException();
            }
        }
    }
}