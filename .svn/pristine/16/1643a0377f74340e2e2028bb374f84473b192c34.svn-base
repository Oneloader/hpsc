<?php
namespace Admin\Controller;

use Admin\Builder\AdminListBuilder;
use Admin\Builder\AdminConfigBuilder;

class WeiboController extends AdminController
{
    public function config()
    {
        $builder = new AdminConfigBuilder();
        $data = $builder->callback('configCallback')->handleConfig();

        $data['SHOW_TITLE'] = $data['SHOW_TITLE'] == null ? 1 : $data['SHOW_TITLE'];
        $data['HIGH_LIGHT_AT'] = $data['HIGH_LIGHT_AT'] == null ? 1 : $data['HIGH_LIGHT_AT'];
        $data['HIGH_LIGHT_TOPIC'] = $data['HIGH_LIGHT_TOPIC'] == null ? 1 : $data['HIGH_LIGHT_TOPIC'];
        $data['CAN_IMAGE'] = $data['CAN_IMAGE'] == null ? 1 : $data['CAN_IMAGE'];
        $data['CAN_TOPIC'] = $data['CAN_TOPIC'] == null ? 1 : $data['CAN_TOPIC'];
        $data['WEIBO_INFO'] = $data['WEIBO_INFO'] ? $data['WEIBO_INFO'] : L('_TIP_WEIBO_INFO_') . L('_QUESTION_');
        $data['WEIBO_NUM'] = $data['WEIBO_NUM'] ? $data['WEIBO_NUM'] : 140;
        $data['SHOW_COMMENT'] = $data['SHOW_COMMENT'] == null ? 1 : $data['SHOW_COMMENT'];
        $data['ACTIVE_USER'] = $data['ACTIVE_USER'] == null ? 1 : $data['ACTIVE_USER'];
        $data['ACTIVE_USER_COUNT'] = $data['ACTIVE_USER_COUNT'] ? $data['ACTIVE_USER_COUNT'] : 6;
        $data['NEWEST_USER'] = $data['NEWEST_USER'] == null ? 1 : $data['NEWEST_USER'];
        $data['NEWEST_USER_COUNT'] = $data['NEWEST_USER_COUNT'] ? $data['NEWEST_USER_COUNT'] : 6;

        $tab = array(
            array('data-id' => 'all', 'title' => L('_ALL_WEBSITE_FOLLOW_')),
            array('data-id' => 'concerned', 'title' => L('_MY_FOLLOW_')),
            array('data-id' => 'hot', 'title' => L('_HOT_WEIBO_')),
            array('data-id' => 'fav', 'title' => L('_MY_FAV_')),
        );
        $default = array(array('data-id' => 'enable', 'title' => L('_ENABLE_'), 'items' => $tab), array('data-id' => 'disable', 'title' => L('_DISABLE_'), 'items' => array()));

        $data['WEIBO_DEFAULT_TAB'] = $builder->parseKanbanArray($data['WEIBO_DEFAULT_TAB'], $tab, $default);

        $scoreTypes = D('Ucenter/Score')->getTypeList(array('status' => 1));
        foreach ($scoreTypes as $val) {
            $types[$val['id']] = $val['title'];
        }


        $data['WEIBO_SHOW_TITLE1'] = $data['WEIBO_SHOW_TITLE1'] ? $data['WEIBO_SHOW_TITLE1'] : L('_NEWEST_WEIBO_');
        $data['WEIBO_SHOW_COUNT1'] = $data['WEIBO_SHOW_COUNT1'] ? $data['WEIBO_SHOW_COUNT1'] : 5;
        $data['WEIBO_SHOW_ORDER_FIELD1'] = $data['WEIBO_SHOW_ORDER_FIELD1'] ? $data['WEIBO_SHOW_ORDER_FIELD1'] : 'create_time';
        $data['WEIBO_SHOW_ORDER_TYPE1'] = $data['WEIBO_SHOW_ORDER_TYPE1'] ? $data['WEIBO_SHOW_ORDER_TYPE1'] : 'desc';
        $data['WEIBO_SHOW_CACHE_TIME1'] = $data['WEIBO_SHOW_CACHE_TIME1'] ? $data['WEIBO_SHOW_CACHE_TIME1'] : '600';


        $data['WEIBO_SHOW_TITLE2'] = $data['WEIBO_SHOW_TITLE2'] ? $data['WEIBO_SHOW_TITLE2'] : L('_HOT_WEIBO_');
        $data['WEIBO_SHOW_COUNT2'] = $data['WEIBO_SHOW_COUNT2'] ? $data['WEIBO_SHOW_COUNT2'] : 5;
        $data['WEIBO_SHOW_ORDER_FIELD2'] = $data['WEIBO_SHOW_ORDER_FIELD2'] ? $data['WEIBO_SHOW_ORDER_FIELD2'] : 'comment_count';
        $data['WEIBO_SHOW_ORDER_TYPE2'] = $data['WEIBO_SHOW_ORDER_TYPE2'] ? $data['WEIBO_SHOW_ORDER_TYPE2'] : 'desc';
        $data['WEIBO_SHOW_CACHE_TIME2'] = $data['WEIBO_SHOW_CACHE_TIME2'] ? $data['WEIBO_SHOW_CACHE_TIME2'] : '600';
        $order = array('create_time' => L('_DELIVER_TIME_'), 'comment_count' => L('_COMMENT_COUNT_'));

        $builder->keyText('WEIBO_SHOW_TITLE1', L('_WEIBO_TITLE_'), L('_HOME_BLOCK_TITLE_'));
        $builder->keyText('WEIBO_SHOW_COUNT1', L('_WEIBO_COUNT_SHOW_'), '');
        $builder->keyRadio('WEIBO_SHOW_ORDER_FIELD1', L('_SORT_VALUE_'), L('_TIP_SORT_TYPE_'), $order);
        $builder->keyRadio('WEIBO_SHOW_ORDER_TYPE1', L('_SORT_TYPE_'), L('_TIP_SORT_TYPE_'), array('desc' => L('_COUNTER_'), 'asc' => L('_DIRECT_')));
        $builder->keyText('WEIBO_SHOW_CACHE_TIME1', L('_CACHE_TIME_'), L('_TIP_CACHE_TIME_'));

        $builder->keyText('WEIBO_SHOW_TITLE2', L('_WEIBO_TITLE_'), L('_HOME_BLOCK_TITLE_'));
        $builder->keyText('WEIBO_SHOW_COUNT2', L('_WEIBO_COUNT_SHOW_'), '');
        $builder->keyRadio('WEIBO_SHOW_ORDER_FIELD2', L('_SORT_VALUE_'), L('_TIP_SORT_TYPE_'), $order);
        $builder->keyRadio('WEIBO_SHOW_ORDER_TYPE2', L('_SORT_TYPE_'), L('_TIP_SORT_TYPE_'), array('desc' => L('_COUNTER_'), 'asc' => L('_DIRECT_')));
        $builder->keyText('WEIBO_SHOW_CACHE_TIME2', L('_CACHE_TIME_'), L('_TIP_CACHE_TIME_'));


        $builder->title(L('_WEIBO_BASIC_SETTINGS_'))
            ->data($data)
            ->keySwitch('SHOW_TITLE', L('_RANK_SHOW_IN_LEFT_'))
            ->keyBool('WEIBO_BR', L('_CONTENT_TYPE_OPEN_'), L('_SUPPORT_ENTER_SPACE_'))
            ->keySwitch('HIGH_LIGHT_AT', L('_HIGHLIGHT_AT_SOMEBODY_'))
            ->keySwitch('HIGH_LIGHT_TOPIC', L('_HIGHLIGHT_WEIBO_TOPIC_'))
            ->keyText('WEIBO_INFO', L('_WEIBO_POST_BOX_UP_LEFT_CONTENT_'))
            ->keyText('WEIBO_NUM', L('_WEIBO_WORDS_LIMIT_'))
            ->keyText('HOT_LEFT', L('_HOT_WEIBO_RULE_'))->keyDefault('HOT_LEFT', 3)
            ->keySwitch('CAN_IMAGE', L('_INSERT_PICTURE_TYPE_OPEN_CLOSE_'))
            ->keySwitch('CAN_TOPIC', L('_INSERT_TOPIC_TYPE_OPEN_CLOSE_'))
            ->keyRadio('COMMENT_ORDER', L('_WEIBO_COMMENTS_LIST_ORDER_'), '', array(0 => L('_TIME_COUNTER_'), 1 => L('_TIME_DIRECT_')))
            ->keyRadio('SHOW_COMMENT', L('_WEIBO_COMMENTS_LIST_DEFAULT_SHOW_HIDE_'), '', array(0 => L('_HIDE_'), 1 => L('_SHOW_')))
            //->keySelect('WEIBO_DEFAULT_TAB', '动态默认显示标签', '', array('all'=>'全站动态','concerned'=>'我的关注','hot'=>'热门动态'))
            ->keyKanban('WEIBO_DEFAULT_TAB', L('_WEIBO_SIGN_DEFAULT_'))
            ->keySwitch('ACTIVE_USER', L('_ACTIVE_USER_SWITCH_'))
            ->keySelect('ACTIVE_USER_ORDER', L('_ACTIVE_USER_SORT_'), '', $types)
            ->keyText('ACTIVE_USER_COUNT', L('_ACTIVE_USER_SHOW_NUMBER_'), '')
            ->keyText('USE_TOPIC', L('_TOPIC_USUAL_'), L('_SHOW_IN_BUTTON_LEFT_'))
            ->keySwitch('NEWEST_USER', L('_USER_SWITCH_NEWEST_'))
            ->keyText('NEWEST_USER_COUNT', L('_USER_SHOW_NUMBER_NEWEST_'), '')
            ->keyText('HOT_WEIBO_COMMENT_NUM','热门动态标记阀值', '评论数超过该值时，会出现热门动态标记')->keyDefault('HOT_WEIBO_COMMENT_NUM', 10)
            ->keyDefault('WEIBO_BR', 0)
            ->group(L('_BASIC_SETTINGS_'), 'SHOW_TITLE,WEIBO_NUM,WEIBO_BR,WEIBO_DEFAULT_TAB,HIGH_LIGHT_AT,HIGH_LIGHT_TOPIC,WEIBO_INFO,HOT_LEFT,HOT_WEIBO_COMMENT_NUM')
            ->group(L('_SETTINGS_TYPE_'), 'CAN_IMAGE,CAN_TOPIC')
            ->group(L('_SETTINGS_COMMENTS_'), 'COMMENT_ORDER,SHOW_COMMENT')
            ->group(L('_SETTINGS_RIGHT_SIDE_'), 'ACTIVE_USER,ACTIVE_USER_ORDER,ACTIVE_USER_COUNT,NEWEST_USER,NEWEST_USER_COUNT')
            ->group(L('_SETTINGS_TOPIC_'), 'USE_TOPIC')
            ->group(L('_HOME_BLOCK_LEFT_'), 'WEIBO_SHOW_TITLE1,WEIBO_SHOW_COUNT1,WEIBO_SHOW_ORDER_FIELD1,WEIBO_SHOW_ORDER_TYPE1,WEIBO_SHOW_CACHE_TIME1')
            ->group(L('_HOME_BLOCK_RIGHT_'), 'WEIBO_SHOW_TITLE2,WEIBO_SHOW_COUNT2,WEIBO_SHOW_ORDER_FIELD2,WEIBO_SHOW_ORDER_TYPE2,WEIBO_SHOW_CACHE_TIME2')
            ->buttonSubmit();


        $builder->display();
    }

    public function configCallback()
    {
        S('weibo_latest_user_top', null);
        S('weibo_latest_user_new', null);
    }


    public function weibo()
    {
        $aPage = I('page', 1, 'intval');
        $r = 20;
        $aTopicId=I('topic_id',0,'intval');
        $cate_ = D('adv_pos')
            ->field('id')
//            ->where(['name'=>'weibo'])
            ->find();
//        var_dump($aTopicId);exit;
        $model = M('Weibo');
        if($aTopicId){//话题找动态
            $map['topic_id']=$aTopicId;
            $map['status']=1;
            list($list,$totalCount)=D('Weibo/WeiboTopicLink')->getListPageByMap($map,$aPage,$r);
            $mapWibo['status']=array('EGT', 0);
            foreach($list as &$val){
                $mapWibo['id']=$val['weibo_id'];
                $val=$model->where($mapWibo)->find();
            }
            unset($val);
        }else{
            //动态内容找动态
            $aContent = I('content', '', 'op_t');

            $map = ['status' => array('EGT', 0),'belong'=>$cate_['id']];

            $aContent && $map['content'] = array('like', '%' . $aContent . '%');

            $list = $model->where($map)->order('create_time desc')->page($aPage, $r)->select();
            unset($li);
            $totalCount = $model->where($map)->count();
        }
        //显示页面
        $builder = new AdminListBuilder();
        $attr['class'] = 'btn ajax-post';
        $attr['target-form'] = 'ids';
        $attr1 = $attr;
        $attr1['url'] = $builder->addUrlParam(U('setWeiboTop'), array('top' => $cate_['id']));
        $attr0 = $attr;
        $attr0['url'] = $builder->addUrlParam(U('setWeiboTop'), array('top' => ''));

        $topic = D('weibo_topic')
            ->where(['status'=>1])
            ->select();
        $categoty = [];
        foreach ($topic as $key=>$val){
            $categoty[$val['id']] = $val['name'];
//                $categoty[$key][$val['id']] = $val['name'];
        }
        $member = D('member')
            ->where(['status'=>1])
            ->select();
        $mem = [];
        foreach ($member as $key=>$val){
            $mem[$val['uid']] = $val['nickname'];
        }

//        $belong = "weibo";
        $from_id = "10002";

        $builder->title(L('_WEIBO_MANAGER_'))
            ->setStatusUrl(U('setWeiboStatus'))
            ->buttonNew(U('Weibo/addWeibo/belong/'.$cate_['id']),'新增')
            ->buttonEnable()
            ->buttonDisable()
            ->buttonDelete()
            ->button(L('_STICK_'), $attr1)
            ->button(L('_STICK_CANCEL_'), $attr0)
            ->ajaxButton(U('Weibo/cleanWeiboHtmlCache'),null,'清除动态html-cache',array('hide-data' => 'true'))
            ->keyId()
            ->keyTitle()
            ->keyLink('content', L('_CONTENT_'), 'comment?weibo_id=###')
            ->keyMultiImage('images','图片详情')
//            ->keyUid()
            ->keyMap('uid','用户',$mem)
//            ->keyCategory()
            ->keyCate('category','微博分类')
            ->keyPos('pos', '微博分组')
            ->keyCreateTime()
            ->keyStatus()
            ->keyDoActionEdit('editWeibo?id=###&belong='.$cate_['id'])
//            ->keyMap('is_top', L('_STICK_'), array('' => '未推荐',1 => '已推荐'))
            ->keyRecommend('is_top',L('_STICK_'),$from_id)
            ->search(L('_CONTENT_'), 'content')
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }


    /*行业*/
    public function industry()
    {
        $aPage = I('page', 1, 'intval');
        $r = 20;
        $aTopicId=I('topic_id',0,'intval');
        $cate_ = D('adv_pos')
            ->field('id')
            ->where(['name'=>'industry'])
            ->find();
//        var_dump($aTopicId);exit;
        $model = M('Weibo');
        if($aTopicId){//话题找动态
            $map['topic_id']=$aTopicId;
            $map['status']=1;
            list($list,$totalCount)=D('Weibo/WeiboTopicLink')->getListPageByMap($map,$aPage,$r);
            $mapWibo['status']=array('EGT', 0);
            foreach($list as &$val){
                $mapWibo['id']=$val['weibo_id'];
                $val=$model->where($mapWibo)->find();
            }
            unset($val);
        }else{//动态内容找动态
            $aContent = I('content', '', 'op_t');

            $map = ['status' => array('EGT', 0)];
            $map['_string'] = 'FIND_IN_SET('.$cate_['id'].',pos)';

            $aContent && $map['content'] = array('like', '%' . $aContent . '%');

            $list = $model->where($map)->order('create_time desc')->page($aPage, $r)->select();
            unset($li);
            $totalCount = $model->where($map)->count();
        }
//        var_dump($list);exit;
        //显示页面
        $builder = new AdminListBuilder();
        $attr['class'] = 'btn ajax-post';
        $attr['target-form'] = 'ids';
        $attr1 = $attr;
        $attr1['url'] = $builder->addUrlParam(U('setWeiboTop'), array('top' => $cate_['id']));
        $attr0 = $attr;
        $attr0['url'] = $builder->addUrlParam(U('setWeiboTop'), array('top' => ''));
        $topic = D('weibo_topic')
            ->where(['status'=>1])
            ->select();
        $categoty = [];
        foreach ($topic as $key=>$val){
            $categoty[$val['id']] = $val['name'];
        }
        $member = D('member')
            ->where(['status'=>1])
            ->select();
        $mem = [];
        foreach ($member as $key=>$val){
            $mem[$val['uid']] = $val['nickname'];
        }
//        $belong = "industry";
        $from_id = "10003";

        $builder->title(L('_WEIBO_INDUSTRY_'))
            ->setStatusUrl(U('setWeiboStatus'))
            ->buttonNew(U('Weibo/addWeibo/belong/'.$cate_['id']),'新增')
            ->buttonEnable()
            ->buttonDisable()
            ->buttonDelete()
            ->button(L('_STICK_'), $attr1)
            ->button(L('_STICK_CANCEL_'), $attr0)
            ->ajaxButton(U('Weibo/cleanWeiboHtmlCache'),null,'清除动态html-cache',array('hide-data' => 'true'))
            ->keyId()
            ->keyTitle()
            ->keyLink('content', L('_CONTENT_'), 'comment?weibo_id=###')
            ->keyMultiImage('images','图片详情')
//            ->keyUid()
            ->keyMap('uid','用户',$mem)
//            ->keyCategory()
            ->keyCate('category','作品分类')
            ->keyPos('pos', '微博分组')
            ->keyCreateTime()
            ->keyStatus()
            ->keyDoActionEdit('editWeibo?id=###&belong='.$cate_['id'])
//            ->keyMap('is_top', L('_STICK_'), array(0 => "未推荐", 1 => L('_STICK_')))
            ->keyRecommend('is_top',L('_STICK_'),$from_id)
            ->search(L('_CONTENT_'), 'content')
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }


    /*机构*/
    public function organization()
    {
        $aPage = I('page', 1, 'intval');
        $r = 20;
        $aTopicId=I('topic_id',0,'intval');
        $cate_ = D('adv_pos')
            ->field('id')
            ->where(['name'=>'organization'])
            ->find();
//        var_dump($aTopicId);exit;
        $model = M('Weibo');
        if($aTopicId){//话题找动态
            $map['topic_id']=$aTopicId;
            $map['status']=1;
            list($list,$totalCount)=D('Weibo/WeiboTopicLink')->getListPageByMap($map,$aPage,$r);
            $mapWibo['status']=array('EGT', 0);
            foreach($list as &$val){
                $mapWibo['id']=$val['weibo_id'];
                $val=$model->where($mapWibo)->find();
            }
            unset($val);
        }else{//动态内容找动态
            $aContent = I('content', '', 'op_t');

            $map = ['status' => array('EGT', 0)];

            $aContent && $map['content'] = array('like', '%' . $aContent . '%');
            $map['_string'] = 'FIND_IN_SET('.$cate_['id'].',pos)';

            $list = $model->where($map)->order('create_time desc')->page($aPage, $r)->select();
            unset($li);
            $totalCount = $model->where($map)->count();
        }
        //显示页面
        $builder = new AdminListBuilder();
        $attr['class'] = 'btn ajax-post';
        $attr['target-form'] = 'ids';
        $attr1 = $attr;
        $attr1['url'] = $builder->addUrlParam(U('setWeiboTop'), array('top' => $cate_['id']));
        $attr0 = $attr;
        $attr0['url'] = $builder->addUrlParam(U('setWeiboTop'), array('top' => ''));

        $topic = D('weibo_topic')
            ->where(['status'=>1])
            ->select();
        $categoty = [];
        foreach ($topic as $key=>$val){
            $categoty[$val['id']] = $val['name'];
//                $categoty[$key][$val['id']] = $val['name'];
        }
        $member = D('member')
            ->where(['status'=>1])
            ->select();
        $mem = [];
        foreach ($member as $key=>$val){
            $mem[$val['uid']] = $val['nickname'];
        }
//        $belong = 'organization';
        $from_id = '10004';

        $builder->title(L('_WEIBO_ORGANIZATION_'))
            ->setStatusUrl(U('setWeiboStatus'))
            ->buttonNew(U('Weibo/addWeibo/belong/'.$cate_['id']),'新增')
            ->buttonEnable()
            ->buttonDisable()
            ->buttonDelete()
            ->button(L('_STICK_'), $attr1)
            ->button(L('_STICK_CANCEL_'), $attr0)
            ->ajaxButton(U('Weibo/cleanWeiboHtmlCache'),null,'清除动态html-cache',array('hide-data' => 'true'))
            ->keyId()
            ->keyTitle()
            ->keyLink('content', L('_CONTENT_'), 'comment?weibo_id=###')
            ->keyMultiImage('images','图片详情')
//            ->keyUid()
            ->keyMap('uid','用户',$mem)
//            ->keyCategory()
            ->keyCate('category','作品分类')
            ->keyPos('pos', '微博分组')
            ->keyCreateTime()
            ->keyStatus()
            ->keyDoActionEdit('editWeibo?id=###&belong='.$cate_['id'])
//            ->keyMap('is_top', L('_STICK_'), array(0 => "未推荐", 1 => L('_STICK_')))
            ->keyRecommend('is_top',L('_STICK_'),$from_id)
            ->search(L('_CONTENT_'), 'content')
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }

    /*飞手*/
    public function player()
    {
        $aPage = I('page', 1, 'intval');
        $r = 20;
        $aTopicId=I('topic_id',0,'intval');
//        var_dump($aTopicId);exit;
        $cate_ = D('adv_pos')
            ->field('id')
            ->where(['name'=>'player'])
            ->find();
        $model = M('Weibo');
        if($aTopicId){//话题找动态
            $map['topic_id']=$aTopicId;
            $map['status']=1;
            list($list,$totalCount)=D('Weibo/WeiboTopicLink')->getListPageByMap($map,$aPage,$r);
            $mapWibo['status']=array('EGT', 0);
            foreach($list as &$val){
                $mapWibo['id']=$val['weibo_id'];
                $val=$model->where($mapWibo)->find();
            }
            unset($val);
        }else{//动态内容找动态
            $aContent = I('content', '', 'op_t');

            $map = ['status' => array('EGT', 0)];
            $map['_string'] = 'FIND_IN_SET('.$cate_['id'].',pos)';

            $aContent && $map['content'] = array('like', '%' . $aContent . '%');

            $list = $model->where($map)->order('create_time desc')->page($aPage, $r)->select();
            unset($li);
            $totalCount = $model->where($map)->count();
        }
        //显示页面
        $builder = new AdminListBuilder();
        $attr['class'] = 'btn ajax-post';
        $attr['target-form'] = 'ids';
        $attr1 = $attr;
        $attr1['url'] = $builder->addUrlParam(U('setWeiboTop'), array('top' => $cate_['id']));
        $attr0 = $attr;
        $attr0['url'] = $builder->addUrlParam(U('setWeiboTop'), array('top' => ''));

        $topic = D('weibo_topic')
            ->where(['status'=>1])
            ->select();
        $categoty = [];
        foreach ($topic as $key=>$val){
            $categoty[$val['id']] = $val['name'];
//                $categoty[$key][$val['id']] = $val['name'];
        }
        $member = D('member')
            ->where(['status'=>1])
            ->select();
        $mem = [];
        foreach ($member as $key=>$val){
            $mem[$val['uid']] = $val['nickname'];
        }

//        $belong = 'player';
        $from_id = '10005';

        $builder->title(L('_WEIBO_PLAYER_'))
            ->setStatusUrl(U('setWeiboStatus'))
            ->buttonNew(U('Weibo/addWeibo/belong/'.$cate_['id']),'新增')
            ->buttonEnable()
            ->buttonDisable()
            ->buttonDelete()
            ->button(L('_STICK_'), $attr1)
            ->button(L('_STICK_CANCEL_'), $attr0)
            ->ajaxButton(U('Weibo/cleanWeiboHtmlCache'),null,'清除动态html-cache',array('hide-data' => 'true'))
            ->keyId()
            ->keyTitle()
            ->keyLink('content', L('_CONTENT_'), 'comment?weibo_id=###')
            ->keyMultiImage('images','图片详情')
//            ->keyUid()
            ->keyMap('uid','用户',$mem)
//            ->keyCategory()
            ->keyCate('category','作品分类')
            ->keyPos('pos', '微博分组')
            ->keyCreateTime()
            ->keyStatus()
            ->keyDoActionEdit('editWeibo?id=###&belong='.$cate_['id'])
//            ->keyMap('is_top', L('_STICK_'), array(0 => "未推荐", 1 => L('_STICK_')))
            ->keyRecommend('is_top',L('_STICK_'),$from_id)
            ->search(L('_CONTENT_'), 'content')
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }


    public function cleanWeiboHtmlCache()
    {
        D('Weibo/WeiboCache')->cleanCache();
        $this->success('操作成功！');
    }

    public function setWeiboTop($ids, $top)
    {
        foreach ($ids as $id) {
            $pos = D('Weibo')->where(array('id' => $id))->getfield('is_top');
            if ($pos){
                $test = [$pos,$top];
                $a_pos = implode(',',$test);
            }else{
                $a_pos = $top;
            }
            D('Weibo')->where(array('id' => $id))->setField('is_top', $a_pos);
            S('weibo_' . $id, null);
        }
        $this->success(L('_SUCCESS_SETTING_'), $_SERVER['HTTP_REFERER']);
    }

    public function weiboTrash()
    {
        $aPage = I('page', 1, 'intval');
        $r = 20;
        $builder = new AdminListBuilder();
        $builder->clearTrash('Weibo');
        //读取动态列表
        $map = array('status' => -1);
        $model = M('Weibo');
        $list = $model->where($map)->order('id desc')->page($aPage, $r)->select();
        $totalCount = $model->where($map)->count();
        //显示页面
        $builder->title('动态回收站')
            ->setStatusUrl(U('setWeiboStatus'))->buttonRestore()->buttonClear('Weibo')
            ->keyId()->keyLink('content', L('_CONTENT_'), 'comment?weibo_id=###')->keyUid()->keyCreateTime()
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }

    public function setWeiboStatus($ids, $status)
    {
        $builder = new AdminListBuilder();
        $builder->doSetStatus('Weibo', $ids, $status);
    }

    public function addWeibo()
    {
        $aId = I('id','', 'intval');
        $aTitle = I('post.title', '', 'string');
        $aContent = I('post.content', '', 'op_t');
        $aMultiImg = I('post.images', '', 'string');
        $aCategory= I('post.category', '', '');
        $aCreateTime = I('post.create_time', time(), 'intval');
        $aStatus = I('post.status', 1, 'intval');
        $aBelong = I('belong','','string');
        $model = M('Weibo');
        $userid = session('user_auth.uid');

        if (IS_POST) {
            //写入数据库
            $data = array('title'=>$aTitle, 'content' => $aContent, 'create_time' => $aCreateTime, 'status' => $aStatus,'images'=>$aMultiImg,'category'=>$aCategory,'belong'=>$aBelong,'uid'=>$userid);
            $result = $model->add($data);
            S('weibo_' . $aId, null);
            if (!$result) {
                $this->error(L('_FAIL_EDIT_'));
            }
            //返回成功信息
            $this->success(L('_SUCCESS_EDIT_'), U('weibo'));
        } else {
            //读取动态内容
            $weibo = $model->where(array('id' => $aId))->find();
            $belong = $aBelong;

            $topic = D('weibo_topic')->where(['status'=>1])->select();
            $categoty = [];
            foreach ($topic as $key=>$val){
                $categoty[$val['id']] = $val['name'];
            }

            $posion = D('adv_pos')->where(['status'=>1])->select();
            $pos = [];
            foreach ($posion as $post=>$po){
                $pos[$po['id']] = $po['title'];
            }
            $pos = array_splice($pos,1);
            //显示页面
            $builder = new AdminConfigBuilder();
            if($belong === "10002"){
                $builder->title(L('_WEIBO_ADD_'))
                    ->keyId()
                    ->keyTitle()
                    ->keyTextArea('content', L('_CONTENT_'))
                    ->keyMultiImage('images','图片详情')
                    ->keyCheckBox('category','分类标签','',$categoty)
                    ->keyCheckBox('pos', '推荐给其他分类', '', $pos)
//                    ->keyCreateTime()
                    ->keyStatus()
                    ->keyHidden('belong','','',$belong)
                    ->buttonSubmit(U('addWeibo'))
                    ->buttonBack()
                    ->data($weibo)
                    ->display();
            }else{
                $builder->title(L('_WEIBO_ADD_'))
                    ->keyId()
                    ->keyTitle()
                    ->keyTextArea('content', L('_CONTENT_'))
                    ->keyMultiImage('images','图片详情')
//                    ->keyCheckBox('category','分类标签','',$categoty)
//                    ->keyCreateTime()
                    ->keyStatus()
                    ->keyHidden('belong','','',$belong)
                    ->buttonSubmit(U('addWeibo'))
                    ->buttonBack()
                    ->data($weibo)
                    ->display();
            }
        }
    }

    public function editWeibo()
    {
        $aId = I('id', 0, 'intval');
//        $aTitle = I('post.title', '', 'string');
//        $aContent = I('post.content', '', 'op_t');
//        $aMultiImg = I('post.data', '', 'string');
//        $aCategory= I('post.category', '', '');
//        $aCreateTime = I('post.create_time', time(), 'intval');
//        $aStatus = I('post.status', 1, 'intval');
        $aBelong = I('belong','','string');

        $model = M('Weibo');
        if (IS_POST) {
//            $images = unserialize($aMultiImg);
//            var_dump($_POST);exit;
//            $aMultiImgs['attach_ids'] = $aMultiImg;
//            $img = serialize($aMultiImgs);
//            $aImages = unserialize($aMultiImg);
            //写入数据库
            $data = array('title'=>$_POST['title'], 'content' => $_POST['content'], 'create_time' => $_POST['create_time'], 'status' => $_POST['status'],'images'=>$_POST['images'],'category'=>$_POST['category'],'pos'=>$_POST['pos']);

            $result = $model->where(array('id' => $aId))->save($data);
            S('weibo_' . $aId, null);
            if (!$result) {
                $this->error(L('_FAIL_EDIT_'));
            }

            //返回成功信息
            $this->success(L('_SUCCESS_EDIT_'), U('weibo'));
        } else {
            //读取动态内容
            $weibo = $model->where(array('id' => $aId))->find();

            $topic = D('weibo_topic')->where(['status'=>1])->select();
            $categoty = [];
            foreach ($topic as $key=>$val){
                $categoty[$val['id']] = $val['name'];
//                $categoty[$key][$val['id']] = $val['name'];
            }

            $posion = D('adv_pos')->where(['status'=>1])->select();
            $posion = array_splice($posion,1);
            $pos = [];
            foreach ($posion as $post=>$po){
                $pos[$po['id']] = $po['title'];
            }
//            var_dump(key($categoty)===0);exit;
//            var_dump($aMultiImg);exit;
            //显示页面
            $builder = new AdminConfigBuilder();

            $belong = $aBelong;
            if($belong === "10002") {
                $builder->title(L('_WEIBO_EDIT_'))
                    ->keyId()
                    ->keyTitle()
                    ->keyTextArea('content', L('_CONTENT_'))
                    ->keyMultiImage('images', '图片详情')
                    ->keyCheckBox('category', '分类标签', '', $categoty)
                    ->keyCheckBox('pos', '推荐给其他分类', '', $pos)
                    ->keyCreateTime()
                    ->keyStatus()
                    ->buttonSubmit(U('editWeibo'))->buttonBack()
                    ->data($weibo)
                    ->display();
            }else{
                $builder->title(L('_WEIBO_EDIT_'))
                    ->keyId()
                    ->keyTitle()
                    ->keyTextArea('content', L('_CONTENT_'))
                    ->keyMultiImage('images', '图片详情')
                    ->keyCheckBox('category', '分类标签', '', $categoty)
//                    ->keyCheckBox('pos', '推荐给其他分类', '', $pos)
                    ->keyCreateTime()
                    ->keyStatus()
                    ->buttonSubmit(U('editWeibo'))->buttonBack()
                    ->data($weibo)
                    ->display();
            }
        }
    }


    public function comment()
    {
        $aWeiboId = I('weibo_id', 0, 'intval');
        $aPage = I('page', 1, 'intval');
        $r = 20;
        //读取评论列表
        $map = array('status' => array('EGT', 0));
        if ($aWeiboId) $map['weibo_id'] = $aWeiboId;
        $model = M('WeiboComment');
        $list = $model->where($map)->order('id desc')->page($aPage, $r)->select();
        $totalCount = $model->where($map)->count();
        //显示页面
        $builder = new AdminListBuilder();
        $builder->title(L('_REPLY_MANAGER_'))
            ->setStatusUrl(U('setCommentStatus'))->buttonEnable()->buttonDisable()->buttonDelete()
            ->keyId()->keyText('content', L('_CONTENT_'))->keyUid()->keyCreateTime()->keyStatus()->keyDoActionEdit('editComment?id=###')
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }

    public function commentTrash()
    {
        $aPage = I('page', 1, 'intval');
        $r = 20;
        $builder = new AdminListBuilder();
        $builder->clearTrash('WeiboComment');
        //读取评论列表
        $map = array('status' => -1);
        $model = M('WeiboComment');
        $list = $model->where($map)->order('id desc')->page($aPage, $r)->select();
        $totalCount = $model->where($map)->count();
        //显示页面
        $builder->title(L('_REPLY_TRASH_'))
            ->setStatusUrl(U('setCommentStatus'))->buttonRestore()->buttonClear('WeiboComment')
            ->keyId()->keyText('content', L('_CONTENT_'))->keyUid()->keyCreateTime()
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }

    public function setCommentStatus($ids, $status)
    {
        foreach ($ids as $id) {
            $comemnt = D('Weibo/WeiboComment')->getComment($id);
            if ($status == 1) {
                D('Weibo/Weibo')->where(array('id' => $comemnt['weibo_id']))->setInc('comment_count');
            } else {
                D('Weibo/Weibo')->where(array('id' => $comemnt['weibo_id']))->setDec('comment_count');
            }
            S('weibo_' . $comemnt['weibo_id'], null);
        }


        $builder = new AdminListBuilder();
        $builder->doSetStatus('WeiboComment', $ids, $status);
    }

    public function editComment()
    {
        $aId = I('id', 0, 'intval');

        $aContent = I('post.content', '', 'op_t');
        $aCreateTime = I('post.create_time', time(), 'intval');
        $aStatus = I('post.status', 1, 'intval');

        $model = M('WeiboComment');
        if (IS_POST) {
            //写入数据库
            $data = array('content' => $aContent, 'create_time' => $aCreateTime, 'status' => $aStatus);
            $result = $model->where(array('id' => $aId))->save($data);
            S('weibo_comment_' . $aId);
            if (!$result) {
                $this->error(L('_ERROR_EDIT_'));
            }
            //显示成功消息
            $this->success(L('_SUCCESS_EDIT_'), U('comment'));
        } else {
            //读取评论内容
            $comment = $model->where(array('id' => $aId))->find();
            //显示页面
            $builder = new AdminConfigBuilder();
            $builder->title(L('_EDIT_COMMENTS_'))
                ->keyId()->keyTextArea('content', L('_CONTENT_'))->keyCreateTime()->keyStatus()
                ->data($comment)
                ->buttonSubmit(U('editComment'))->buttonBack()
                ->display();
        }
    }


    public function topic()
    {
        $aPage = I('page', 1, 'intval');
        $aName = I('name', '', 'op_t');
        $r = 20;
        $model = M('WeiboTopic');
        $aName && $map['name'] = array('like', '%' . $aName . '%');

        $list = $model->where($map)->order('id asc')->page($aPage, $r)->select();
        unset($li);
        $totalCount = $model->where($map)->count();

        //显示页面
        $builder = new AdminListBuilder();
        $attr['class'] = 'btn ajax-post';
        $attr['target-form'] = 'ids';
        $attr1 = $attr;
        $attr1['url'] = $builder->addUrlParam(U('setTopicTop'), array('top' => 1));
        $attr0 = $attr;
        $attr0['url'] = $builder->addUrlParam(U('setTopicTop'), array('top' => 0));

        $attr_del = $attr;
        $attr_del['url'] = $builder->addUrlParam(U('delTopic'), array());

        $builder->title(L('_TOPIC_MANAGER_'))
            ->button(L('_RECOMMEND_'), $attr1)
            ->button(L('_RECOMMEND_CANCEL_'), $attr0)
            ->buttonNew(U('Weibo/addTopic'),'新增')
            ->button(L('_DELETE_'), $attr_del)
            ->button('转移v2话题到v3',array('href'=>U('Weibo/transferTopic')))
            ->keyId()
            ->keyLink('name', L('_CONTENT_'), 'weibo?topic_id=###')
            ->keyUid()
            ->keyImage('logo', L('_LOGO_'))
            ->keyText('intro', L('_LEADER_WORDS_'))
            ->keyText('qrcode', L('_QR_CODE_'))
            ->keyText('uadmin', L('_TOPIC_ADMIN_'))
            ->keyText('read_count', L('_VIEWS_'))
            ->keyMap('is_top', L('_RECOMMEND_YES_OR_NOT_'), array(0 => L('_RECOMMEND_NOT_'), 1 => L('_RECOMMEND_')))
            ->keyStatus('status')
            ->keyDoActionEdit('edit_topic?id=###','编辑')
            ->search(L('_NAME_'), 'name')
            ->data($list)
            ->pagination($totalCount, $r)
            ->display();
    }

    public function setTopicTop($ids, $top)
    {
        M('WeiboTopic')->where(array('id' => array('in', $ids)))->setField('is_top', $top);
        S('topic_rank', null, 60);
        $this->success(L('_SUCCESS_SETTING_'), $_SERVER['HTTP_REFERER']);
    }

    public function delTopic($ids)
    {
        M('WeiboTopic')->where(array('id' => array('in', $ids)))->setField(array('status'=>-1,'name'=>'已删除话题'));
        S('topic_rank', null, 60);
        $this->success(L('_SUCCESS_DELETE_'), $_SERVER['HTTP_REFERER']);
    }

    public function addTopic()
    {
        if (IS_POST){
            $aName = I('post.name', '', 'op_t');
            $aIntro = I('post.intro', 'string');
            $aLogo = I('post.logo', 'string');
            $aStatus = I('post.status', 1, 'intval');
//            M('WeiboTopic')->where(array('id' => array('in', $ids)))->add();
//            S('topic_rank', null, 60);
//            $this->success(L('_SUCCESS_DELETE_'), $_SERVER['HTTP_REFERER']);
            $topic_table = D('weibo_topic');
            $result = $topic_table->add(array('intro'=>$aIntro,'name'=>$aName,'logo'=>$aLogo,'status'=>$aStatus));
            if ($result){
                $this->success(L('_SUCCESS_ADD_'),U('weibo/topic'));
            }
        }else{
            //显示页面
            $builder = new AdminConfigBuilder();
            $builder->title(L('_TOPIC_ADD_'))
                ->keyText('name', L('_CONTENT_'))
                ->keyTextArea('intro', L('_LEADER_WORDS_'))
                ->keySingleImage('logo',L('_LOGO_'))
                ->keyStatus()
                ->buttonSubmit(U('addTopic'))
                ->buttonBack()
                ->display();
        }
    }

    public function edit_topic()
    {
        $aId = I('id', 0, 'intval');
        $aName = I('post.name', '', 'op_t');
        $aIntro = I('post.intro', 'string');
        $aLogo = I('post.logo', 'string');
        $aStatus = I('post.status', 1, 'intval');

        $model = M('weiboTopic');
        if (IS_POST) {
            $logo = D('picture')->where(['id'=>$aLogo])->find();
            //写入数据库

            $data = array('name' => $aName, 'intro' => $aIntro, 'logo'=>"https://".$_SERVER['HTTP_HOST'].'/hpsc'.$logo['path'], 'status' => $aStatus);
            $result = $model->where(array('id'=>$aId))->save($data);
            S('topic_' . $aId, null);
            if (!$result) {
                $this->error(L('_FAIL_EDIT_'));
            }

            //返回成功信息
            $this->success(L('_SUCCESS_EDIT_'), U('topic'));
        } else {
            //读取动态内容
            $weibo = $model->where(['id' => $aId])->find();

            //显示页面
            $builder = new AdminConfigBuilder();
            $builder->title(L('_TOPIC_EDIT_'))
                ->keyId()
                ->keyText('name', L('_CONTENT_'))
                ->keyTextArea('intro', L('_LEADER_WORDS_'))
                ->keySingleImage('logo',L('_LOGO_'))
                ->keyStatus()
                ->buttonSubmit(U('edit_topic'))
                ->buttonBack()
                ->data($weibo)
                ->display();
        }
    }

    public function transferTopic()
    {
        $weiboTopicModel=D('Weibo/Topic');
        $aPage=I('page',1,'intval');
        if($aPage==1){
            $weiboTopicModel->where(array('name'=>''))->delete();
        }
        $this->display(T('Application://Weibo@Admin/transfer'));
        G('s');
        $weiboModel=D('Weibo/Weibo');
        $weiboTopicLinkModel=D('Weibo/WeiboTopicLink');
        $totalCount=$weiboTopicModel->where(array('status'=>1))->count();
        $topicList=$weiboTopicModel->where(array('status'=>1))->page($aPage,5)->select();
        $weibo_total_num=$delete_num=0;
        $this->flashMessage('开始执行v2到v3话题转移！');
        foreach($topicList as $val)
        {
            if(trim($val['name']!='')){
                $this->flashMessage('————————————————————');
                $this->flashMessage('开始转移话题：#'.$val['name'].'#');
                $weibo_list=$weiboModel->where(array('content'=>array('like','%#'.$val['name'].'#%'),'status'=>1))->select();
                $weibo_num=$val['weibo_num']+count($weibo_list);
                $weibo_total_num+=count($weibo_list);
                //修改动态数
                $weiboTopicModel->where('id='.$val['id'])->setField('weibo_num',$weibo_num);
                foreach($weibo_list as $one_weibo){
                    //增加链接
                    $weibo_topic_link=array('weibo_id'=>$one_weibo['id'],'topic_id'=>$val['id'],'create_time'=>$one_weibo['create_time'],'status'=>1,'is_top'=>$one_weibo['is_top']);
                    $weiboTopicLinkModel->add($weibo_topic_link);

                    //修改动态内容
                    $one_weibo['content']=str_replace('#'.$val['name'].'#','[topic:'.$val['id'].']',$one_weibo['content']);
                    $weiboModel->where('id='.$one_weibo['id'])->setField('content',$one_weibo['content']);
                    $this->flashMessage('&nbsp;&nbsp;&nbsp;&nbsp;转移话题动态：【'.$one_weibo['id'].'】 成功！');
                }
                $this->flashMessage('转移话题：#'.$val['name'].'# 成功！');
                sleep(1);
            }
        }
        G('e');
        $this->flashMessage('————————————————————');
        $this->flashMessage('执行成功！');
        $this->flashMessage('总耗时:'.G('s','e',6));
        $this->flashMessage("修改话题：".count($topicList).' 条');
        $this->flashMessage("修改动态：".$weibo_total_num.' 次');
        $this->flashMessage("新增动态话题链接：".$weibo_total_num.' 条');
        $this->flashMessage("执行数据库查询：".(count($topicList)+1).' 次');
        $this->flashMessage("执行数据库修改：".(count($topicList)+$weibo_total_num).' 次');
        if($totalCount<$aPage*5){
            $this->flashMessage("执行数据库新增：".($weibo_total_num).' 次',1);
        }else{
            $this->flashMessage("执行数据库新增：".($weibo_total_num).' 次',$aPage+1);
        }
        exit;
    }
    private function flashMessage($msg,$last=0)
    {
        echo "<script type=\"text/javascript\">showmsg(\"{$msg}\",\"{$last}\")</script>";
        ob_flush();
        flush();
    }
}
