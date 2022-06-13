<?php


namespace app\model;

use app\service\TokenService;
use ruhua\bases\BaseModel;

class GroupAccess extends BaseModel
{
    protected $name = 'auth_group_access';
    protected $autoWriteTimestamp = false;


    public static function getMyRules()
    {
        $aid = TokenService::getCurrentAid();
        $groupId = self::where('aid', $aid)->value('group_id');
        $ruleIds = Group::where('id', $groupId)->value('rules');
        $rules = AuthRule::where('id', 'in', $ruleIds)->select();
        $navs = [];
        $permission = [];
        foreach ($rules as $v) {
            if ($v['pid'] == 0) {
                $navs[] = $v['auth_name'];
            } else {
                $permission[] = $v['auth_name'];
            }
        }
        return ["navs" => $navs, "permission" => $permission];
    }

    public static function getMyAuths()
    {
        $aid = TokenService::getCurrentAid();
        $groupId = self::where('aid', $aid)->value('group_id');
        $ruleIds = Group::where('id', $groupId)->value('rules');
        $rules = AuthRule::where('id', 'in', $ruleIds)->select();
        $auth = [];

        foreach ($rules as $v) {
            if ($v['pid'] > 0) {
                if (array_key_exists($v['cname'], $auth)) {
                    $a = explode(",", $v['fnames']);
                    $b = $auth[$v['cname']];
                    $auth[$v['cname']] = array_unique(array_merge($a, $b));
                } else {
                    $auth[$v['cname']] = explode(",", $v['fnames']);
                }
            }
        }
        return $auth;
    }


}