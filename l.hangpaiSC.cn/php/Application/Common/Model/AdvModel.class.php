<?php

namespace Common\Model;

use Think\Model;

class AdvModel extends Model
{
    protected $tableName = 'adv';

    /*  展示数据  */
    public function getAdvList($name, $path)
    {

        $list = S('adv_list_' . $name . $path);
        if ($list === false) {
            $now_theme = modC('NOW_THEME', 'default', 'Theme');

            $advPos = D('Common/AdvPos')->getInfo($name, $path); //找到当前调用的广告位
            if ($advPos['theme'] != 'all' && !in_array($now_theme, explode(',', $advPos['theme']))) {
                return null;
            }

            $advMap['pos_id'] = $advPos['id'];
            $advMap['status'] = 1;
            $advMap['start_time'] = array('lt', time());
            $advMap['end_time'] = array('gt', time());
            $data = $this->where($advMap)->order('sort asc')->select();


            foreach ($data as &$v) {
                $d = json_decode($v['data'], true);
                if (!empty($d)) {
                    $v = array_merge($d, $v);

                }
            }
            unset($v);
            S('adv_list_' . $name . $path, $list);
        }

        return $data;
    }

    /*——————————————————分隔线————————————————*/


    /**
     * 根据广告位id获取广告
     * @param $pos
     * @return mixed
     */
    public function getAdvListByPos($pos){
        $list = S('adv_list_' . $pos);
        if ($list === false) {
            $advMap['pos_id'] = $pos;
            $advMap['status'] = 1;
            $advMap['start_time'] = array('ELT', time());
            $advMap['end_time'] = array('EGT', time());
            $data = $this
                ->field('id,title,pos_id,url,sort,data')
                ->where($advMap)
                ->select();

            foreach ($data as &$v) {
                $d = json_decode($v['data'], true);
                $picture = D('picture')
                    ->field('path')
                    ->where(['id'=>$d['pic']])
                    ->find();
                $v['pic'] = $picture['path'];
//                if (!empty($d)) {
//                    $v = array_merge($d, $v);
//                }
            }
            unset($v);
            S('adv_list_' . $pos, $list);
        }
        return $data;
    }
}