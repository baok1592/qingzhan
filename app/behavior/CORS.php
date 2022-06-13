<?php
namespace app\behavior;


class CORS
{
    public function handle($event)
    {
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: token,Authorization,Origin, X-Requested-With, X_Requested_With,Content-Type, Accept");
        header('Access-Control-Allow-Methods: POST,GET,PUT,DELETE');
        if(request()->isOptions()){
            exit();
        }
    }
}