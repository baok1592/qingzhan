<?php 

namespace  ruhua\exceptions;


class CmsException extends BaseException
{
    public $code = 400;
    public $msg = '操作失败';
    public $errorCode = 1000;

    public function __construct($params = []){
        if( !is_array($params)){
            return ;
        }
        if(array_key_exists('code',$params)){
            $this->code = $params['code'];
        }
        if(array_key_exists('msg',$params)){
            $this->msg = $params['msg'];
            $this->message = $params['msg'];
        }
        if(array_key_exists('errorCode',$params)){
            $this->errorCode = $params['errorCode'];
        }
    }
}