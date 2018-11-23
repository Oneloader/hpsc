<?php

namespace Wiki\Model;

use Think\Model;

class NavModel extends Model
{
    protected $tableName = 'menu';

    /**
     * 前端顶部nav
     * @return array
     */
    public function get_top_navs(){
        $pos_info = D('adv_pos')
            ->field('id,title')
            ->select();
        foreach ($pos_info as $key=>$val){
            $pos[$key]['id']=$val['id'];
            $pos[$key]['name']=$val['title'];
        }
        return $pos;
    }

    public function get_left_navs(){

    }
}