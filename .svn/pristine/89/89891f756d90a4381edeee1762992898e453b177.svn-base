<?php
/**
 * 小程序接口文件
 */
namespace Wiki\Controller;
use Admin\Builder\AdminListBuilder;
use Admin\Model\DocumentModel;
use Api\Controller\MessageController;
use Common\Model\AdvModel;
use Common\Model\MemberModel;
use Common\Model\NavModel;
use Couchbase\Document;
use Home\Controller\IndexController;
use Think\Cache\Driver\Redis;
use Think\Controller;
use Think\Page;
use Ucenter\Controller\ConfigController;
use Weibo\Model\TopicModel;
use Weibo\Model\WeiboCommentModel;
use Weibo\Model\WeiboModel;


class ApiController extends BaseController
{
    /**
     *登录（调用wx.login获取）
     * @param $code string
     * @param $rawData string
     * @param $signatrue string
     * @param $encryptedData string
     * @param $iv string
     * @return $code 成功码
     * @return $session3rd 第三方3rd_session
     * @return $data 用户数据
     */

    public function wx_login()
    {
        include_once "wxBizDataCrypt.php";
        //开发者使用登陆凭证 code 获取 session_key 和 openid
        $APPID = 'wxa6edd390d0659206';//自己配置
        $AppSecret = '6eb5274bf3f130f5b7b3809e434bd2c2';//自己配置
        $code = I('code');
        $url = "https://api.weixin.qq.com/sns/jscode2session?appid=" . $APPID . "&secret=" . $AppSecret . "&js_code=" . $code . "&grant_type=authorization_code";
        $arr = $this->vget($url); // 一个使用curl实现的get方法请求
        $arr = json_decode($arr, true);
        $openid = $arr['openid'];
        $session_key = $arr['session_key'];
        // 数据签名校验
        $signature = I('signature');
        $rawData = I('post.rawData');
        $signature2 = sha1($rawData . $session_key);
        if ($signature != $signature2) {
            exit(['code' => 500, 'msg' => '数据签名验证失败！']);
        }
        Vendor("PHP.wxBizDataCrypt"); //加载解密文件，在官方有下载
        $encryptedData = I('encryptedData');
        $iv = I('iv');
        $pc = new \WXBizDataCrypt($APPID, $session_key);
        $errCode = $pc->decryptData($encryptedData, $iv, $data); //其中$data包含用户的所有数据
        $data = json_decode($data, true);
        if ($errCode == 0) {
            $result = $this->login($data);
            successReturn($result);//打印解密所得的用户信息
        } else {
            successReturn($errCode);//打印失败信息
        }
    }

    public function vget($url)
    {
        $info = curl_init();
        curl_setopt($info, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($info, CURLOPT_HEADER, 0);
        curl_setopt($info, CURLOPT_NOBODY, 0);
        curl_setopt($info, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($info, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($info, CURLOPT_URL, $url);
        $output = curl_exec($info);
        curl_close($info);
        return $output;
    }

    public function login($data = array())
    {
        session('[start]');
        $openid = $data['openId'];
        $nickname = cutstr_html($data['nickName']);
        if (empty($openid)) {
            return array('status' => -1, 'msg' => '参数有误', 'result' => '');
        }
        if (isset($data['openId'])) {
            $where['openid'] = $data['openId'];
            $user = D('member')->where($where)->find();
        }
        if (empty($user)) {
            $map['openid'] = $openid;
            $map['nickname'] = $nickname;
            $map['reg_time'] = time();
            $map['status'] = 1;
            $map['sex'] = empty($data['gender']) ? 0 : $data['gender'];
            $map['token'] = md5(time() . mt_rand(1, 99999));
            $member_name = D('member')
                ->where(['nickname' => $nickname])
                ->select();
            if (empty($member_name)) {
                $member_id = M('member')->add($map);
                if (isset($data['avatarUrl'])) {
                    /*   保存用户头像   */
                    $avatar['uid'] = $member_id;
                    $avatar['path'] = $data['avatarUrl'];
                    $avatar['create_time'] = time();
                    $avatar['status'] = 1;
                    M('avatar')->add($avatar);
                }
                $avatar_url = D('avatar')
                    ->field('path')
                    ->where(['uid' => $member_id])
                    ->find();
                $background_img = D('background')
                    ->field('path')
                    ->where(['uid' => $member_id])
                    ->find();
                $member = D('member')
//                    ->alias('m')
                    ->field('uid,nickname,sex,signature,token,openid,reg_time,phone')
//                    ->join('ot_avatar as a ON m.uid=a.uid')
//                    ->join('ot_background as b ON m.uid=b.uid')
                    ->where(['uid' => $member_id])
                    ->find();
                $member['reg_time'] = date('Y-m-d', $member['reg_time']);
                $member['avatar'] = $avatar_url['path'];
                $member['background_img'] = $background_img['path'];
                if ($openid == $member['openid']) {
                    session('uid', $member_id);
                    session('nickname', $member['nickname']);
                }
            } else {
                return array('status' => 0, 'msg' => '昵称已存在');
            }
        } else {
            $user['token'] = md5(time() . mt_rand(1, 999999999));
            M('member')
                ->where("uid", $user['uid'])
                ->save(array('token' => $user['token'], 'last_login_time' => time(), 'status' => 1));
            $avatar_url = D('avatar')
                ->field('path')
                ->where(['uid' => $user['uid']])
                ->find();
            $background_img = D('background')
                ->field('background_img')
                ->where(['uid' => $user['uid']])
                ->find();
            $member = D('member')
                ->field('uid,nickname,sex,signature,token,openid,reg_time,phone')
                ->where(['uid' => $user['uid']])
                ->find();
            $member['reg_time'] = date('Y-m-d', $member['reg_time']);
            $member['avatar'] = $avatar_url['path'];
            $member['background_img'] = $background_img['background_img'];
            session('uid', $user['uid']);
        }
        session('openid', $member['openid']);
        return array('status' => 1, 'msg' => '登陆成功', 'result' => $member);
    }


    /**
     * 上传图片
     */
    public function upload_picture()
    {
        //TODO: 用户登录检测

        /* 返回标准数据 */
        $return = array('status' => 1, 'info' => L('_UPLOAD_SUCCESS_'), 'data' => '');

        /* 调用文件上传组件上传文件 */
        $Picture = D('Picture');

        $driver = modC('PICTURE_UPLOAD_DRIVER', 'local', 'config');
        $driver = check_driver_is_exist($driver);
        $uploadConfig = get_upload_config($driver);

        $info = $Picture->upload(
            $_FILES,
            C('PICTURE_UPLOAD'),
            $driver,
            $uploadConfig
        ); //TODO:上传到远程服务器
        /* 记录图片信息 */
        if ($info) {
            $return['status'] = 1;
            empty($info['download']) && $info['download'] = $info['file'];
            $return = array_merge($info['download'], $return);
        } else {
            $return['status'] = 0;
            $return['info'] = $Picture->getError();
        }

        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }


    /**
     * 获取顶部nav
     * @return array
     */
    public function get_top_nav()
    {
        if (checkGet()) {
            $navModel = new \Wiki\Model\NavModel();
            $top_navs = $navModel->get_top_navs();
            successReturn($top_navs);
        }
    }

    /**
     * 获取轮播图
     */
    public function get_banner()
    {
        if (checkPost()) {
            $pos = I('cate_id', 0, 'intval');
            if (!$pos) {
                successReturn([]);
            }
            //获取轮播图
            $advModel = new AdvModel();
            $advs = $advModel->getAdvListByPos($pos);
            successReturn($advs);
        }
    }

    /**
     * 获取首页热门推荐
     */
    public function get_index_hot_weibo()
    {
        if (checkGet()) {
            $cate_id = I('get.cate_id', '', 'string');
            $map['_string'] = 'FIND_IN_SET(' . $cate_id . ',is_top)';
            $map['status'] = 1;
//            $map['is_top'] = 1;
            $weiboHot = D('weibo')
                ->field('id,uid,title,content,category,create_time,type,images')
                ->where($map)
                ->limit(3)
                ->order(['comment_count' => 'desc'])
                ->select();
//            var_dump($weiboHot);exit;
            foreach ($weiboHot as $weibo => $hot) {
                $user_info = $this->user_info($hot['uid']);
                $cate = explode(',', $hot['category']);
                $cate_info = [];
                foreach ($cate as $cat => $ca) {
                    $cate_info[] = $this->get_category($ca);
                }
                $weiboHot_list[$weibo]['id'] = $hot['id'];
                $weiboHot_list[$weibo]['uid'] = $hot['uid'];
                $weiboHot_list[$weibo]['title'] = $hot['title'];
                $weiboHot_list[$weibo]['content'] = $hot['content'];
                $weiboHot_list[$weibo]['create_time'] = date('Y-m-d H:i', $hot['create_time']);
                $weiboHot_list[$weibo]['user_info'] = $user_info;
                $weiboHot_list[$weibo]['cate_info'] = $cate_info;
                $weiboHot_list[$weibo]['img_list'] = $this->data_img($hot['images']);
//                var_dump($re);
//                var_dump($cate_info);exit;
//                if (isset($re[0])){
//                    if (strpos($re[0],C('website'))){
//                        $weiboHot_list[$weibo]['img_list'] = $re;
//                    }else{
//                        $weiboHot_list[$weibo]['img_list'] = C('website').$re[0];
//                    }
//                }else{
//                    $weiboHot_list[$weibo]['img_list'] = "";
//                }
            }
//            var_dump($weiboHot_list);exit;
            successReturn($weiboHot_list);
        }
    }

    /**
     * 获取全部热门推荐
     */
    public function get_all_hot_weibo()
    {
        if (checkGet()) {
            $cate_id = I('get.cate_id', '', 'string');
            $page = I('p', 1, 'intval'); //分页
            if ($cate_id == 10002) {
                $params = [
                    'field' => ['id,uid,title,content,category,create_time,type,images'],
                    'where' => ['status' => 1, '_string' => 'FIND_IN_SET(' . $cate_id . ',is_top)'],
                    'order' => ['create_time' => 'desc'],   //最新
                    'page' => $page,
                    'count' => 5,
                ];
            } else {
                $params = [
                    'field' => ['id,uid,title,content,category,create_time,type,images'],
                    'where' => ['status' => 1, '_string' => 'FIND_IN_SET(' . $cate_id . ',is_top)'],
                    'order' => ['create_time' => 'desc'],   //最新
                    'page' => $page,
                    'count' => 5,
                ];
            }
            $weiboHot = $this->get_weibo_list($params);
//            $weiboHot = D('weibo')
//                ->field('id,uid,title,content,category,create_time,type,images')
//                ->where($map)
////                ->order(['comment_count'=>'desc'])
//                ->page($page)
//                ->select();
//            var_dump($weiboHot);exit;
            $model = new WeiboModel();
            foreach ($weiboHot as $weibo => $hot) {
                $user_info = $this->user_info($hot['uid']);
                $cate = explode(',', $hot['category']);
                $cate_info = [];
                foreach ($cate as $cat => $ca) {
                    $cate_info[] = $this->get_category($ca);
                }
                $re = $this->data_img($hot['images']);
                $weiboHot_list[$weibo]['id'] = $hot['id'];
                $weiboHot_list[$weibo]['uid'] = $hot['uid'];
                $weiboHot_list[$weibo]['title'] = $hot['title'];
                $weiboHot_list[$weibo]['content'] = $hot['content'];
                $weiboHot_list[$weibo]['create_time'] = date('Y-m-d H:i', $hot['create_time']);
                $weiboHot_list[$weibo]['user_info'] = $user_info;
                $weiboHot_list[$weibo]['cate_info'] = $cate_info;

                $weiboHot_list['weibo_total'] = $model->getWeiboCount($params['where']);
                $weiboHot_list['now_page'] = $page;
                $weiboHot_list['total_page'] = ceil($weiboHot_list['weibo_total'] / $params['count']);
//                if ($weiboHot_list['total_page'] == $weiboHot_list['now_page']){
//                    $weiboHot_list['end'] = 1;
//                }else{
//                    $weiboHot_list['end'] = 0;
//                }
//                var_dump($re);
//                var_dump($cate_info);exit;
//                if (isset($re[0])){
//                    if (strpos($re[0],C('website'))){
//                        $weiboHot_list[$weibo]['img_list'] = $re;
//                    }else{
//                        $weiboHot_list[$weibo]['img_list'] = C('website').$re[0];
//                    }
//                }else{
//                    $weiboHot_list[$weibo]['img_list'] = "";
//                }
            }
            successReturn($weiboHot_list);
        }
    }

    /**
     *  根据用户id获取用户信息
     */
    public function user_info($id)
    {
        $user_info = D('member')
            ->field('uid,nickname,signature')
            ->where(['uid' => $id])
            ->find();
        $img = D('avatar')
            ->field('path')
            ->where(['uid' => $id])
            ->find();
        $user_info['path'] = $img['path'];
//        if (!empty($user_info['path'])){
////            $user_info['path'] = c('WEBSITE')."/Uploads/Avatar".$user_info['path'];
//            $user_info['path'] = $user_info['path'];
//        }else{
//            $user_info['path'] = null;
//        }
        return $user_info;
    }

    /**
     * 根据微博分类id获取分类信息
     */
    public function get_category($cate_id)
    {
        $cate = explode(',', $cate_id);
        $cate_info = [];
        foreach ($cate as $key => $val) {
            $cate_info[] = D('weibo_topic')
                ->field('id,name')
                ->where(['id' => $val])
                ->find();
        }
        return $cate_info;
    }

    /**
     * 图片数组
     */
    public function data_img($data)
    {
        $images = explode(',', $data);
        foreach ($images as $key => $val) {
            $img = D('picture')
                ->field('url,path')
                ->where(['id' => $val])
                ->find();
            if (!empty($img['path'])) {
                if (strpos($img, C('website'))) {
                    $images[$key] = $img['path'];
                } else {
                    $images[$key] = $img['path'];
                }
            } elseif (!empty($img['url'])) {
                $images[$key] = $img['url'];
            }
        }
        return $images;
    }

    /**
     * 获取最新微博列表
     */
    public function get_newest_weibo()
    {
        if (checkPost()) {
            $page = I('p', 1, 'intval'); //分页
            $uid = I('post.user_id', '', 'intval');
            $cate_id = I('post.cate_id', '', 'string');
            $tag_id = I('post.tag_id', '', 'string');
            if ($cate_id == 10002) {
                $params = [
                    'field' => ['id,uid,title,content,category,create_time,comment_count,likes_count,repost_count,status,images'],
//                    'where' => ['status' => 1],
                    'where' => ['status' => 1,'category'=>['like',['%'.','.$tag_id.','.'%',$tag_id.','.'%','%'.','.$tag_id,$tag_id],'OR']],
                    'order' => ['create_time' => 'desc'],   //最新
                    'page' => $page,
                    'count' => 5,
                ];
            } else {
                $params = [
                    'field' => ['id,uid,title,content,category,create_time,comment_count,likes_count,repost_count,status,images'],
                    'where' => ['status' => 1, '_string' => 'FIND_IN_SET(' . $cate_id . ',pos)','category'=>['like',['%'.','.$tag_id.','.'%',$tag_id.','.'%','%'.','.$tag_id,$tag_id],'OR']],
                    'order' => ['create_time' => 'desc'],   //最新
                    'page' => $page,
                    'count' => 5,
                ];
            }
//            $map['_string'] = 'FIND_IN_SET('.$cate_id.',is_top)';
            $model = new WeiboModel();
            if ($uid) {
                $list = $this->get_weibo_list($params);
                foreach ($list as $key => $val) {
                    $cate_info = $this->get_category($val['category']);
                    $user_info = $this->user_info($val['uid']);
//                $img = unserialize($val['data']);
                    $img_path = $this->data_img($val['images']);
                    $weibo_list['weibo_list'][$key]['id'] = $val['id'];
                    $weibo_list['weibo_list'][$key]['title'] = $val['title'];
                    $weibo_list['weibo_list'][$key]['content'] = $val['content'];
                    $weibo_list['weibo_list'][$key]['create_time'] = date('Y-m-d H:i', $val['create_time']);
                    $weibo_list['weibo_list'][$key]['comment_count'] = $val['comment_count'];
                    $weibo_list['weibo_list'][$key]['likes_count'] = $val['likes_count'];
                    $weibo_list['weibo_list'][$key]['repost_count'] = $val['repost_count'];
                    $weibo_list['weibo_list'][$key]['user'] = $user_info;
                    $weibo_list['weibo_list'][$key]['cate_info'] = $cate_info;
                    if (strpos($img_path[0], C('website'))) {
                        $weibo_list['weibo_list'][$key]['img_list'] = $img_path;
                    } else {
                        $weibo_list['weibo_list'][$key]['img_list'] = $img_path;
                    }
                    $like = D('support')
                        ->where(['row' => $val['id'], 'uid' => $uid, 'table' => 'weibo'])
                        ->find();
                    if (!empty($like)) {
                        $weibo_list['weibo_list'][$key]['like'] = 1;
                    } else {
                        $weibo_list['weibo_list'][$key]['like'] = 0;
                    }

                    $weibo_list['weibo_total'] = $model->getWeiboCount($params['where']);
                    $weibo_list['now_page'] = $page;
                    $weibo_list['total_page'] = ceil($weibo_list['weibo_total'] / $params['count']);
//                    if ($weibo_list['total_page'] == $weibo_list['now_page']){
//                        $weibo_list['end'] = 1;
//                    }else{
//                        $weibo_list['end'] = 0;
//                    }
                }
            } else {
                $list = $this->get_weibo_list($params);
                foreach ($list as $key => $val) {
                    $cate_info = $this->get_category($val['category']);
                    $user_info = $this->user_info($val['uid']);
//                $img = unserialize($val['data']);
                    $img_path = $this->data_img($val['images']);
                    $weibo_list['weibo_list'][$key]['id'] = $val['id'];
                    $weibo_list['weibo_list'][$key]['title'] = $val['title'];
                    $weibo_list['weibo_list'][$key]['content'] = $val['content'];
                    $weibo_list['weibo_list'][$key]['create_time'] = date('Y-m-d H:i', $val['create_time']);
                    $weibo_list['weibo_list'][$key]['comment_count'] = $val['comment_count'];
                    $weibo_list['weibo_list'][$key]['likes_count'] = $val['likes_count'];
                    $weibo_list['weibo_list'][$key]['repost_count'] = $val['repost_count'];
                    $weibo_list['weibo_list'][$key]['user'] = $user_info;
                    $weibo_list['weibo_list'][$key]['cate_info'] = $cate_info;
                    if (strpos($img_path[0], C('website'))) {
                        $weibo_list['weibo_list'][$key]['img_list'] = $img_path;
                    } else {
                        $weibo_list['weibo_list'][$key]['img_list'] = $img_path[0];
                    }
                    $weibo_list['weibo_total'] = $model->getWeiboCount($params['where']);
                    $weibo_list['now_page'] = $page;
                    $weibo_list['total_page'] = ceil($weibo_list['weibo_total'] / $params['count']);
//                    if ($weibo_list['total_page'] == $weibo_list['now_page']){
//                        $weibo_list['end'] = 1;
//                    }else{
//                        $weibo_list['end'] = 0;
//                    }
                }
            }
            successReturn($weibo_list);
        }
    }

    /**
     * 获取微博详情
     */
    public function get_weibo_info()
    {
        if (checkGet()) {
            $id = I('get.id', 0, 'intval');
//            $uid = session('uid');
            $uid = I('get.user_id', '', 'intval');
            $model = new WeiboModel();
            $info = $model->getWeiboDetail1($id);
            $user_info = $this->user_info($info['uid']);
            $is_follow = D('follow')
                ->where(['who_follow' => $uid, 'follow_who' => $user_info['uid']])
                ->find();
            if ($is_follow) {
                $info['follow'] = 1;
            } else {
                $info['follow'] = 0;
            }
            $cate_info = $this->get_category($info['category']);
            $images = $this->data_img($info['images']);
            $weibo_info = array(
                'id' => $info['id'],
                'title' => $info['title'],
                'content' => $info['content'],
                'create_time' => $info['create_time'],
                'comment_count' => $info['comment_count'],
                'likes_count' => $info['likes_count'],
                'user' => $user_info,
                'cate_info' => $cate_info,
                'img_list' => $images,
                'is_follow' => $info['follow'],
            );
            successReturn($weibo_info);
        }
    }

    /**
     * 获取微博评论列表
     */
    public function get_weibo_comments()
    {
        if (checkPost()) {
            $page = I('p', 1, 'intval'); //分页
            $weibo_id = I('post.id', '', 'intval');
            $listRows =5;
            $model = new WeiboCommentModel();
            $list = $model->getCommentList($weibo_id, $page, $listRows);
            $ids = getSubByKey($list, 'id');
            foreach ($ids as $key => $val) {
                $comment_list = D('weibo_comment')
                    ->field('id,uid,weibo_id,content,create_time,to_comment_id')
    //                ->limit($start.','.$listRows)
                    ->where(['id' => $val])
                    ->find();
                $create_time = date('Y-m-d H:i', $comment_list['create_time']);
                $user_info = $this->user_info($comment_list['uid']);
                $comment_info = [];
                if ($comment_list['to_comment_id']!=0){
                    $to_comment = D('weibo_comment')
                        ->field('id,uid,weibo_id,content,create_time')
                        ->where(['id'=>$comment_list['to_comment_id']])
                        ->find();
                    $comment_user_info = $this->user_info($to_comment['uid']);
                    $comment_info['id'] = $to_comment['id'];
                    $comment_info['user'] = $comment_user_info;
                    $comment_info['content'] = $to_comment['content'];
                    $comment_info['create_time'] = date('Y-m-d H:i',$to_comment['create_time']);
                }else{
                    $comment_info = null;
                }
                $comment['weibo_list'][$key] = array(
                    'id' => $comment_list['id'],
                    'weibo_id' => $comment_list['weibo_id'],
                    'content' => $comment_list['content'],
                    'user' => $user_info,
                    'create_time' => $create_time,
                    'to_comment' => $comment_info,
                );
            }
            $comment['comment_total'] = count($comment['weibo_list']);
            $comment['now_page'] = $page;
            $comment['total_page'] = ceil($comment['comment_total'] / $listRows);
            successReturn($comment);
        }
    }

    /**
     * 关注
     */
    public function get_follow()
    {
        if (checkGet()) {
            $who_follow = I('get.who_follow');
            $follow_who = I('get.follow_who');
            $is_follow = D('follow')
                ->where(['follow_who' => $follow_who, 'who_follow' => $who_follow])
                ->find();
            if ($is_follow) {
                $follow = D('follow')
                    ->delete($is_follow['id']);
                if ($follow) {
//                    $message_cont = [
//                        'from_id' => $who_follow,
//                        'title' => "取消关注了",
//                        'args' => json_encode(['uid'=>$follow_who]),
//                        'type' => 'follow',
//                        'create_time' => time(),
//                        'status' => 1,
//                    ];
//                    $msg_content_id = D('message_content')->add($message_cont);
//
//                    $message_info = [
//                        'content_id' => $msg_content_id,
//                        'from_uid' => $who_follow,
//                        'to_uid' => $follow_who,
//                        'create_time' => time(),
//                        'is_read' => 0,
//                        'status' => 1,
//                        'type' => 'follow',
//                    ];
//                    $msg_ = D('message')->add($message_info);
                    $type = "follow";
                    $content = ['uid'=>$follow_who];
                    $msg_ = $this->add_message('取消关注',$who_follow,$follow_who,$content,$type);
                    if ($msg_) {
                        errorReturn('您已取消关注该用户');
                    }
                }
            } else {
                $info = array(
                    'follow_who' => $follow_who,
                    'who_follow' => $who_follow,
                    'create_time' => time(),
                );
                $follow = D('follow')
                    ->add($info);
                if ($follow) {
//                    $message_cont = [
//                        'from_id' => $who_follow,
//                        'title' => "关注了",
//                        'args' => json_encode(['uid'=>$follow_who]),
//                        'type' => 'follow',
//                        'create_time' => time(),
//                        'status' => 1,
//                    ];
//                    $msg_content_id = D('message_content')->add($message_cont);
//
//                    $message_info = [
//                        'content_id' => $msg_content_id,
//                        'from_uid' => $who_follow,
//                        'to_uid' => $follow_who,
//                        'create_time' => time(),
//                        'is_read' => 0,
//                        'status' => 1,
//                        'type' => 'follow',
//                    ];
//                    $msg_ = D('message')->add($message_info);
                    $type = "follow";
                    $content = ['uid'=>$follow_who];
                    $msg_ = $this->add_message('关注',$who_follow,$follow_who,$content,$type);
                    if ($msg_) {
                        successReturn('', '关注成功');
                    }
                }
            }
        }
    }

    /**
     * 评论
     */
    public function do_comments()
    {
        if (checkPost()) {
            $uid = I('post.user_id', 1, 'intval');
            $weibo_id = I('post.weibo_id', 1, 'intval');
            $comment_id = I('post.comment_id', '', 'intval');
            $content = I('post.content', 1, 'string');
            $commentModel = new WeiboCommentModel();
            if ($comment_id==''){
                $cmt_id = 0;
                $weibo = D('weibo')
                    ->where(['id' => $weibo_id])
                    ->find();
            }else{
                $cmt_id = $comment_id;
                $weibo = D('weibo_comment')
                    ->where(['id' => $comment_id])
                    ->find();
            }
            $re['comment_id'] = $commentModel->addComment($uid, $weibo_id, $content,$cmt_id);
            $type = "comment";
            $content = ['weibo_id'=>$weibo_id,'comment_id'=>$re['comment_id']];
            $msg_ = $this->add_message('回复',$uid,$weibo['uid'],$content,$type);
            if ($msg_) {
                successReturn($re,'回复成功');
            }
        }
    }

    /**
     * 转发微博信息feichai
     */
    public function repost_info()
    {
        if (checkGet()) {
            $aSourceId = I('get.source_id', 0, 'intval');
            $aWeiboId = I('get.weibo_id', 0, 'intval');

            $weiboModel = new WeiboModel();
            $result = $weiboModel->getWeiboDetail($aSourceId);

            $this->assign('sourceWeibo', $result);
            $weiboContent = '';
            if ($aSourceId != $aWeiboId) {
                $weibo1 = $weiboModel->getWeiboDetail($aWeiboId);
                $weiboContent = '//@' . $weibo1['user']['nickname'] . ' ：' . $weibo1['content'];
            }
            $info['weiboId'] = $aWeiboId;
            $info['weiboContent'] = $weiboContent;
            $info['sourceId'] = $aSourceId;
            successReturn($info);
        }
    }

    /**
     * 转发微博
     */
    public function do_repost()
    {
        if (checkPost()) {
            $this->checkIsLogin();
            $aContent = I('post.content', '', 'op_t');
            $aType = I('post.type', '', 'op_t');
            $aSourceId = I('post.source_id', 0, 'intval');
            $aWeiboId = I('post.weibo_id', 0, 'intval');
            $aBeComment = I('post.becomment', 'false', 'op_t');

            $this->checkAuth(null, -1, L('_INFO_AUTHORITY_TRANSMIT_LACK_'));

            $return = check_action_limit('add_weibo', 'Weibo/Weibo', 0, is_login(), true);
            if ($return && !$return['state']) {
                $this->error($return['info']);
            }

            if (empty($aContent)) {
                $this->error(L('_ERROR_CONTENT_CANNOT_EMPTY_'));
            }

            $weiboModel = new WeiboModel();
            $feed_data = '';
            $source = $weiboModel->getWeiboDetail($aSourceId);
            $sourceweibo = $source['weibo'];
            $feed_data['source'] = $sourceweibo;
            $feed_data['sourceId'] = $aSourceId;
            //发布微博
            $new_id = send_weibo($aContent, $aType, $feed_data);

            if ($new_id) {
                $weiboModel->where('id=' . $aSourceId)->setInc('repost_count');
                $aWeiboId != $aSourceId && $weiboModel->where('id=' . $aWeiboId)->setInc('repost_count');
                S('weibo_' . $aWeiboId, null);
                S('weibo_' . $aSourceId, null);
                //清除html缓存
                clean_weibo_html_cache($aSourceId);
                //清除html缓存
                clean_weibo_html_cache($aWeiboId);
            }
            // 发送消息
            $toUid = $weiboModel->where(array('id' => $aWeiboId))->getField('uid');

            $message_content = array(
                'keyword1' => parse_content_for_message($aContent),
                'keyword2' => '转发了你的微博：',
                'keyword3' => $source['type'] == 'repost' ? "转发微博" : parse_content_for_message($source['content'])
            );
            send_message($toUid, L('_PROMPT_TRANSMIT_'), $message_content, 'Weibo/Index/weiboDetail', array('id' => $new_id), is_login(), 'Weibo', 'Common_comment');

            // 发布评论
            //  dump($aBeComment);exit;
            if ($aBeComment == 'true') {
                send_comment($aWeiboId, $aContent);
            }

            $result['html'] = R('WeiboDetail/weibo_html', array('weibo_id' => $new_id), 'Widget');
            //返回成功结果
            $result['status'] = 1;
            $result['info'] = '转发成功！';
            successReturn($result);
        }
    }

    /**
     * 获取粉丝列表
     */
    public function get_fans()
    {
        if (checkGet()) {
            $page = I('p', 1, 'intval'); //分页
            $totalCount = I('count', 1, 'intval');
            $uid = I('get.user_id', 1, 'intval');
//            $fans = D('Follow')->getFans($uid, $page, array('avatar128', 'uid', 'nickname', 'fans', 'following', 'weibocount', 'space_url', 'title', 'signature'), $totalCount);
            $fans = D('Follow')->getFans($uid, $page, array('uid', 'nickname', 'fans', 'following', 'weibocount', 'title', 'signature'), $totalCount);
            successReturn($fans);
        }
    }

    /**
     * 获取分类标签
     */
    public function get_cat_tags()
    {
        if (checkGet()) {
            $map = [['status' => 1]];
            $topicModel = new TopicModel();
            $topicList = $topicModel->getTopicByMap($map);
            if ($topicList) {
                successReturn($topicList);
            } else {
                errorReturn('暂时没有分类标签');
            }
        }
    }

    /**
     * 根据分类标签获取微博列表
     */
    public function get_cate_weibo(){
        if (checkGet()){
            $tag_id = I('get.tag_id', 1, 'intval');
            $page = I('p', 1, 'intval'); //分页
            $uid = I('get.user_id', '', 'intval');
            $cate_id = I('get.cate_id', '', 'string');
            if ($cate_id == 10002) {
                $params = [
                    'field' => ['id,uid,title,content,category,create_time,comment_count,likes_count,repost_count,status,images'],
                    'where' => ['status' => 1,'category'=>['like',['%'.','.$tag_id.','.'%',$tag_id.','.'%','%'.','.$tag_id,$tag_id],'OR']],
                    'order' => ['create_time' => 'desc'],   //最新
                    'page' => $page,
                    'count' => 5,
                ];
            }
            $model = new WeiboModel();
            if ($uid) {
                $list = $this->get_weibo_list($params);
                foreach ($list as $key => $val) {
                    $cate_info = $this->get_category($val['category']);
                    $user_info = $this->user_info($val['uid']);
//                $img = unserialize($val['data']);
                    $img_path = $this->data_img($val['images']);
                    $weibo_list['weibo_list'][$key]['id'] = $val['id'];
                    $weibo_list['weibo_list'][$key]['title'] = $val['title'];
                    $weibo_list['weibo_list'][$key]['content'] = $val['content'];
                    $weibo_list['weibo_list'][$key]['create_time'] = date('Y-m-d H:i', $val['create_time']);
                    $weibo_list['weibo_list'][$key]['comment_count'] = $val['comment_count'];
                    $weibo_list['weibo_list'][$key]['likes_count'] = $val['likes_count'];
                    $weibo_list['weibo_list'][$key]['repost_count'] = $val['repost_count'];
                    $weibo_list['weibo_list'][$key]['user'] = $user_info;
                    $weibo_list['weibo_list'][$key]['cate_info'] = $cate_info;
                    if (strpos($img_path[0], C('website'))) {
                        $weibo_list['weibo_list'][$key]['img_list'] = $img_path;
                    } else {
                        $weibo_list['weibo_list'][$key]['img_list'] = $img_path;
                    }
                    $like = D('support')
                        ->where(['row' => $val['id'], 'uid' => $uid, 'table' => 'weibo'])
                        ->find();
                    if (!empty($like)) {
                        $weibo_list['weibo_list'][$key]['like'] = 1;
                    } else {
                        $weibo_list['weibo_list'][$key]['like'] = 0;
                    }

                    $weibo_list['weibo_total'] = $model->getWeiboCount($params['where']);
                    $weibo_list['now_page'] = $page;
                    $weibo_list['total_page'] = ceil($weibo_list['weibo_total'] / $params['count']);
//                    if ($weibo_list['total_page'] == $weibo_list['now_page']){
//                        $weibo_list['end'] = 1;
//                    }else{
//                        $weibo_list['end'] = 0;
//                    }
                }
            } else {
                $list = $this->get_weibo_list($params);
                foreach ($list as $key => $val) {
                    $cate_info = $this->get_category($val['category']);
                    $user_info = $this->user_info($val['uid']);
//                $img = unserialize($val['data']);
                    $img_path = $this->data_img($val['images']);
                    $weibo_list['weibo_list'][$key]['id'] = $val['id'];
                    $weibo_list['weibo_list'][$key]['title'] = $val['title'];
                    $weibo_list['weibo_list'][$key]['content'] = $val['content'];
                    $weibo_list['weibo_list'][$key]['create_time'] = date('Y-m-d H:i', $val['create_time']);
                    $weibo_list['weibo_list'][$key]['comment_count'] = $val['comment_count'];
                    $weibo_list['weibo_list'][$key]['likes_count'] = $val['likes_count'];
                    $weibo_list['weibo_list'][$key]['repost_count'] = $val['repost_count'];
                    $weibo_list['weibo_list'][$key]['user'] = $user_info;
                    $weibo_list['weibo_list'][$key]['cate_info'] = $cate_info;
                    if (strpos($img_path[0], C('website'))) {
                        $weibo_list['weibo_list'][$key]['img_list'] = $img_path;
                    } else {
                        $weibo_list['weibo_list'][$key]['img_list'] = $img_path[0];
                    }
                    $weibo_list['weibo_total'] = $model->getWeiboCount($params['where']);
                    $weibo_list['now_page'] = $page;
                    $weibo_list['total_page'] = ceil($weibo_list['weibo_total'] / $params['count']);
//                    if ($weibo_list['total_page'] == $weibo_list['now_page']){
//                        $weibo_list['end'] = 1;
//                    }else{
//                        $weibo_list['end'] = 0;
//                    }
                }
            }
            successReturn($weibo_list);
        }
    }

    /**
     * 发表微博
     * @return array
     */
    public function save_weibo()
    {
        if (checkPost()) {
//            $uid = I('post.user_id',1,'intval');
//            $content = I('post.content',1,'string');
//            $attach_ids = I('post.attach_ids', '', 'op_t');
//            $weibo_model = new WeiboModel();
//            $re['weibo_id'] = $weibo_model->addWeibo($uid,$content,$attach_ids);
            $aTitle = I('post.title', '', 'string');
            $uid = I('post.user_id', '', 'intval');
            $aContent = I('post.content', '', 'htmlspecialchars,op_t');
            $belong = I('post.cate_id', '', 'intval');
            $category = I('post.category');
            $images = I('post.images', '', 'string');
//            $types = array('repost', 'feed', 'image', 'share');
//            if (!in_array($aType, $types)) {
//                $class_str = 'Addons\\Insert' . ucfirst($aType) . '\\Insert' . ucfirst($aType) . 'Addon';
//                $class_exists = class_exists($class_str);
//                if (!$class_exists) {
//                    $this->error(L('_ERROR_CANNOT_SEND_THIS_'));
//                } else {
//                    $class = new $class_str();
//                    if (method_exists($class, 'parseExtra')) {
//                        $res = $class->parseExtra($aExtra);
//                        if (!$res) {
//                            $this->error($class->error);
//                        }
//                    }
//                }
//            }
            //权限判断
//            $this->checkIsLogin();
//            $this->checkAuth(null, -1, L('_INFO_AUTHORITY_LACK_'));
//            $return = check_action_limit('add_weibo', 'weibo', 0, is_login(), true);
//            if ($return && !$return['state']) {
//                $this->error($return['info']);
//            }
//
//            $feed_data = array();
//            if (!empty($aAttachIds)) {
//                $feed_data['attach_ids'] = $aAttachIds;
//            } else {
//                if ($aType == 'image') {
//                    $this->error(L('_ERROR_AT_LEAST_ONE_'));
//                }
//            }
//            if (!empty($aExtra)) $feed_data = array_merge($feed_data, $aExtra);
            // 执行发布，写入数据库
            $weibo_id = send_wb($uid, $aTitle, $aContent, $category, $images, $belong);
            if (!$weibo_id) {
                $this->error(L('_FAIL_PUBLISH_'));
            }
//            $result['html'] = R('WeiboDetail/weibo_html', array('weibo_id' => $weibo_id), 'Widget');

            $result['status'] = 1;
            $result['msg'] = 'success';
            $result['data'] = [L('_SUCCESS_PUBLISH_') . L('_EXCLAMATION_')];
            successReturn($result);
        }
    }

    /**
     * 多选图片上传
     *
     * @version v1.0.0
     * @author
     * @since  17-11-24
     */
//    public function upload()
//    {
//        $file = $_FILES['images'];
//        empty($file) && errorReturn('请选择要上传的文件');
//        unset($_FILES['images']);
//        $count = count($file['name']);       // 上传图片的数量
//        $count > 9 && errorReturn('批量上传图片一次最多上传9张图片');
//        $tmpFile  = [];
//        $returnData = [];
//        for($i=0;$i<$count;$i++)          // 循环处理图片
//        {
//            $tmpFile['images']['name']   = $file['name'][$i];
//            $tmpFile['images']['type']   = $file['type'][$i];
//            $tmpFile['images']['tmp_name'] = $file['tmp_name'][$i];
//            $tmpFile['images']['error']  = $file['error'][$i];
//            $tmpFile['images']['size']   = $file['size'][$i];
//            $_FILES['file_'.$i] = $tmpFile;
//            // 判断是否是允许的图片类型
//            $uptype = explode(".",$file['name'][$i]);
//            $ext = end($uptype);
//            stripos('jpeg|png|bmp|jpg',$ext) === FALSE && errorReturn('图片格式支持 JPEG、PNG、BMP格式图片');
////            $data = $this->uploadOne($info,'jpeg|png|bmp|jpg');
//            $data = $this->upload_one($tmpFile,'jpeg|png|bmp|jpg');
//            if($data['status'] == 1)
//            {
//                errorReturn('第'.($i+1).'张图片上传失败，'.$data['msg']);
//            }
//            $returnData[]   = $data;   // 图片路径
////            $returnData[$i]['old_name'] = substr($tmpFile['name'],0,strrpos($tmpFile['name'], '.')); // 图片原名称
//        }
//        ajaxReturn(['status'=>1,'msg'=>'上传成功','data'=>$returnData]);
//    }

    /**
     * 单文件上传
     * @version v1.0.0
     * @author
     * @since  17-11-24
     * @param  $file   上传表单name名称
     * @param  $type   上传类型
     * @param  $maxSize 上传文件限制大小(默认 10M)
     */
//    private function upload_one($filename,$type = 'jpeg|png|bmp|jpg',$maxSize = 10240){
//        /*--------------单文件上传---------------*/
//        define ('WEBSITE', 'http://www.demo.com/');
//        $uplad_tmp_name = $filename['images']['tmp_name'];
//        $uplad_name     = $filename['images']['name'];
//        list($width,$height)    = getimagesize($uplad_tmp_name); // 获取图片的宽和高
//        $image_url="";
////上传文件类型列表
//        $uptypes=array(
//            'image/jpg',
//            'image/jpeg',
//            'image/png',
//            'image/pjpeg',
//            'image/gif',
//        );
////……html显示上传界面
//        /*图片上传处理*/
////把图片传到服务器
////初始化变量
//        $date = date('Y-m-d',time());
//        $uploaded=0;
//        $unuploaded=0;
////图片目录
//        $img_dir="Uploads/Picture/".$date."/";
//
////上传文件路径
//        $img_url=WEBSITE."Uploads/Picture/".$date."/";
//
//        if (!is_dir($img_dir)){
//            mkdir($img_dir);
//        }
//
////如果当前图片不为空
//        if(!empty($uplad_name))
//        {
//            $uptype = explode(".",$uplad_name);
//            $file_end = end($uptype);
//            $newname = md5(uniqid(microtime(),true)).'.'.$file_end;
//            $uplad_name= $newname;
//            //如果上传的文件没有在服务器上存在
//            if(!file_exists($img_dir.$uplad_name))
//            {
//                //把图片文件从临时文件夹中转移到我们指定上传的目录中
//                $file=$img_dir.$uplad_name;
//                move_uploaded_file($uplad_tmp_name,$file);
//                $img_url1 = $img_url.$uplad_name;
//                $uploaded++;
//
//                $data['url'] = $img_url1;
//                $data['type'] = 'local';
//                $data['md5'] = md5($img_url1);
//                $data['sha1'] = sha1($img_url1);
//                $data['status'] = 1;
//                $data['create_time'] = time();
//                $data['width'] = $width;
//                $data['height'] = $height;
//                $pic_id = D('picture')->add($data);
//
//                return array('img_id'=>$pic_id,'url'=>$img_url1);
//            }
//        }
//        errorReturn($img_url1);
//    }

    /**
     * 单文件上传
     * @version v1.0.0
     * @author
     * @since  17-11-24
     * @param  $file   上传表单name名称
     * @param  $type   上传类型
     * @param  $maxSize 上传文件限制大小(默认 10M)
     */
    public function upload_one()
    {
        /*--------------单文件上传---------------*/
        define('WEBSITE', 'https://ssl.xinjmc.com/hpsc/');
//        var_dump($_FILES);exit;
        $uplad_tmp_name = $_FILES['imgfile']['tmp_name'];
        $uplad_name = $_FILES['imgfile']['name'];
        $uplad_type = $_FILES['imgfile']['type'];
        list($width, $height) = getimagesize($uplad_tmp_name); // 获取图片的宽和高
        $image_url = "";
//上传文件类型列表
        $uptypes = array(
            'image/jpg',
            'image/jpeg',
            'image/png',
            'image/pjpeg',
            'image/gif',
        );
        if (in_array($uplad_type, $uptypes, true)) {
            //……html显示上传界面
            /*图片上传处理*/
//把图片传到服务器
//初始化变量
            $date = date('Y-m-d', time());
            $uploaded = 0;
            $unuploaded = 0;
//图片目录
            $img_dir = "Uploads/Picture/" . $date . "/";
//上传文件路径
            $img_url = WEBSITE . "Uploads/Picture/" . $date . "/";
            if (!is_dir($img_dir)) {
                mkdir($img_dir);
            }
//如果当前图片不为空
            if (!empty($uplad_name)) {
                $uptype = explode(".", $uplad_name);
                $file_end = end($uptype);
                $newname = md5(uniqid(microtime(), true)) . '.' . $file_end;
                $uplad_name = $newname;
                //如果上传的文件没有在服务器上存在
                if (!file_exists($img_dir . $uplad_name)) {
                    //把图片文件从临时文件夹中转移到我们指定上传的目录中
                    $file = $img_dir . $uplad_name;
                    move_uploaded_file($uplad_tmp_name, $file);
                    $img_url1 = $img_url . $uplad_name;
                    $uploaded++;
                    $data['path'] = $img_url1;
                    $data['type'] = 'local';
                    $data['md5'] = md5($img_url1);
                    $data['sha1'] = sha1($img_url1);
                    $data['status'] = 1;
                    $data['create_time'] = time();
                    $data['width'] = $width;
                    $data['height'] = $height;
                    $pic_id = D('picture')->add($data);
                    ajaxReturn(array('status' => 1, 'msg' => '上传成功', 'img_id' => $pic_id));
                }
            }
            errorReturn($img_url1);
        }
    }

    /**
     * 搜索微博及用户
     */
    public function search()
    {
        if (checkPost()) {
            $keywords = I('post.keywords', '', 'string');
//            $aKeywords = $this->parseSearchKey($keywords);
//            $aKeywords = text($aKeywords);
            $list['weibo'] = $this->search_weibo($keywords);
            $list['user'] = $this->search_user($keywords);
            successReturn($list);
        }
    }

    private function search_weibo($aKeywords)
    {
        $param['where']['title|content'] = array('like', "%$aKeywords%");
        $param['where']['status'] = 1;
        $param['order'] = 'create_time desc';
//        $param['count'] = $r;
        //查询
        $weiboModel = new WeiboModel();
        $list = $weiboModel->getWeiboList($param);
        foreach ($list as $key => $val) {
            $weibo = D('weibo')
                ->field('id,uid,title,content,category,create_time,type,images')
                ->where(['id' => $val, 'status' => 1])
                ->find();
            $images = $weibo['images'];
            $top = $weibo['category'];
            $arr_img = explode(',', $images);
            $arr_topic = explode(',', $top);
//            var_dump($weibo);exit;
            $member = D('member')
                ->alias('m')
                ->field('m.nickname,m.reg_time,m.signature,a.path')
                ->join('left join ot_avatar a ON m.uid=a.uid')
                ->where(['m.uid' => $weibo['uid'], 'm.status' => 1])
                ->find();
            $member['reg_time'] = date('Y-m-d', $member['reg_time']);

            $list[$key] = [
                'id' => $weibo['id'],
                'uid' => $weibo['uid'],
                'title' => $weibo['title'],
                'content' => $weibo['content'],
                'create_time' => date('Y-m-d', $weibo['create_time']),
                'user_info' => $member,
            ];
            foreach ($arr_img as $im) {
                $picture = D('picture')
                    ->field('path')
                    ->where(['id' => $im])
                    ->find();
                $list[$key]['images'][] = $picture['path'];
            }
            foreach ($arr_topic as $top => $to) {
                $topices = D('weibo_topic')
                    ->field('id,name')
                    ->where(['id' => $to])
                    ->find();
                $list[$key]['cate_info'][] = $topices;
            }
        }
        if ($list) {
            return $list;
        } else {
            return null;
        }
    }

    private function search_user($aKeywords)
    {
//        $r = 30;
        $param['nickname'] = array('like', "%{$aKeywords}%");
        $param['status'] = 1;
        $param['order'] = 'create_time desc';
//        $param['count'] = $r;
        //查询
        $user = D('member')
            ->where($param)
            ->select();
        $uid = getSubByKey($user, 'uid');
        $list = [];
        foreach ($uid as $li) {
            $member = D('member')
                ->alias('m')
                ->field('m.uid,m.nickname,m.reg_time,m.signature,a.path')
                ->join('left join ot_avatar a ON m.uid=a.uid')
                ->where(['m.uid' => $li, 'm.status' => 1])
                ->find();
            $member['reg_time'] = date('Y-m-d', $member['reg_time']);
            $list[] = $member;
        }
        if ($list) {
            return $list;
        } else {
            return null;
        }
    }

    /**
     * 获取通知详情
     */
    public function notices_info()
    {
        if (checkGet()) {
            $announce_id = I('get.id','','int');
            $uid = I('get.user_id','','int');
            $where['create_time'] = ['lt', time()];
            $where['end_time'] = ['gt', time()];
            $where['status'] = ['eq', 1];
            $where['id'] = ['eq', $announce_id];
            $message = D('announce')
                ->field('id,title,content,link,create_time,manage')
                ->where($where)
                ->order('sort asc')
                ->find();
            if ($message){
                $msg_anc = D('message')
                    ->field('is_read')
                    ->where(['content_id'=>$announce_id,'type'=>"announce"])
                    ->find();
                if (!empty($msg_anc['is_read'])){
                    $parame = [
                        'last_toast'=>time(),
                    ];
                    D('message')->where(['content_id'=>$announce_id,'to_uid'=>$uid,'status'=>1,'type'=>"announce"])->save($parame);
                }else{
                    $parame = [
                        'content_id'=>$announce_id,
                        'to_uid'=>$uid,
                        'is_read'=>1,
                        'create_time'=>time(),
                        'status'=>1,
                        'type'=>"announce",
                    ];
                    D('message')->add($parame);
                }
                $announce['id'] = $message['id'];
                $announce['title'] = $message['title'];
                $announce['content'] = $message['content'];
                $announce['link'] = $message['link'];
                $announce['create_time'] = date('Y-m-d H:i', $message['create_time']);
                $announce['user'] = $this->user_info($message['manage']);
            }
//            $announce = [];
//            foreach ($message as $key => $val) {
//            }
            successReturn($announce);
        }
    }

    /**
     * 个人中心
     */
    public function user_center()
    {
        if (checkGet()) {
            $uid = I('get.user_id', 1, 'intval');
            $page = I('get.p', 1, 'intval');
            $listRows = 5;//每页显示数量
            $start = ($page - 1) * $listRows;//起始位置
            $list['my_info'] = D('member')
                ->where(['uid' => $uid])
                ->select();
            $params = [
                'where' => ['uid' => $uid, 'status' => 1],
                'order' => ['id' => 'desc'],   //最新
                'page' => $page,
                'count' => 5,
            ];
            $weibo = $this->get_weibo_list($params);
            foreach ($weibo as $key => $val) {
                $cate_info = $this->get_category($val['category']);
                $user_info = $this->user_info($val['uid']);
//                $img = unserialize($val['data']);
                $img_path = $this->data_img($val['images']);
                $list['weibo'][$key]['id'] = $val['id'];
                $list['weibo'][$key]['title'] = $val['title'];
                $list['weibo'][$key]['content'] = $val['content'];
                $list['weibo'][$key]['create_time'] = date('Y-m-d H:i', $val['create_time']);
                $list['weibo'][$key]['comment_count'] = $val['comment_count'];
                $list['weibo'][$key]['likes_count'] = $val['likes_count'];
                $list['weibo'][$key]['repost_count'] = $val['repost_count'];
                $list['weibo'][$key]['user'] = $user_info;
                $list['weibo'][$key]['cate_info'] = $cate_info;
                if (strpos($img_path[0], C('website'))) {
                    $list['weibo'][$key]['img_list'] = $img_path;
                } else {
                    $list['weibo'][$key]['img_list'] = $img_path[0];
                }
            }
//            $list['weibo'] = D('weibo')
//                ->field('id,uid,title,content,category,create_time,type,images')
//                ->limit($start . ',' . $listRows)
//                ->where(['uid' => $uid, 'status' => 1])
//                ->order(['id' => 'desc'])
//                ->select();
            $list['weibo_count'] = count($list['weibo']);
            $list['follow_count'] = D('follow')
                ->where(array('who_follow' => $uid))
                ->count();
//                $list['follow_count'] = count($follow);
            $list['fans_count'] = D('follow')
                ->where(array('follow_who' => $uid))
                ->count();
//                $list['fans_count'] = count($fans);
            $list['support_count'] = D('support')
                ->where(array('uid' => $uid))
                ->count();
            $list['total'] = $list['weibo_count'];
            $list['now_page'] = $page;
            $list['total_page'] = ceil($list['total'] / $listRows);
            successReturn($list);
        }
    }


    public function add_message($title,$uid,$to_uid,$content=array(),$type){
        $message_cont = [
            'from_id' => $uid,
            'title' => $title,
            'args' => json_encode($content),
            'type' => $type,
            'create_time' => time(),
            'status' => 1,
        ];
        $msg_content_id = D('message_content')->add($message_cont);
        if ($msg_content_id){
            $message_info = [
                'content_id' => $msg_content_id,
                'from_uid' => $uid,
                'to_uid' => $to_uid,
                'create_time' => time(),
                'is_read' => 0,
                'status' => 1,
                'type' => $type,
            ];
            $msg_ = D('message')->add($message_info);
            return $msg_;
        }else{
            errorReturn('操作失败');exit;
        }
    }

    /**
     * 喜欢
     */
    public function support()
    {
        if (checkGet()) {
            $id = I('get.id', '', 'intval');
            $uid = I('get.user_id', '', 'intval');
            $support = D('support')
                ->where(['row' => $id, 'uid' => $uid])
                ->find();
            if (empty($support)) {
                $data = array(
                    'appname' => 'Weibo',
                    'row' => $id,
                    'uid' => $uid,
                    'create_time' => time(),
                    'table' => 'weibo',
                );
                $result = D('support')->add($data);
                if ($result) {
                    $re = D('weibo')
                        ->where(['id' => $id])
                        ->setInc('likes_count', 1);
                    $weibo = D('weibo')
                        ->where(['id' => $id])
                        ->find();
                    if ($re) {
                        $type = "support";
                        $content = ['weibo_id'=>$id];
                        $msg_ = $this->add_message('喜欢',$uid,$weibo['uid'],$content,$type);
                        if ($msg_) {
                            successReturn('', '点赞成功');
                        }
                    }
                }
            } else {
                $result = D('support')
                    ->where(['id' => $support['id']])
                    ->delete();
                if ($result) {
                    $re = D('weibo')
                        ->where(['id' => $id])
                        ->setDec('likes_count', 1);
                    $weibo = D('weibo')
                        ->where(['id' => $id])
                        ->find();
                    if ($re) {
                        $type = "support";
                        $content = ['weibo_id'=>$id];
                        $msg_ = $this->add_message('取消喜欢',$uid,$weibo['uid'],$content,$type);
                        if ($msg_) {
                            successReturn('', '取消点赞成功');
                        }
                    }
                }
            }
        }
    }

    /**
     * 我的关注
     */
    public function user_follow()
    {
        if (checkGet()) {
            $uid = I('get.user_id', 1, 'intval');
            $page = I('get.p', 1, 'intval');
            $type = I('get.type', 1, 'string');//weibo:关注的微博  user:关注的用户
            $listRows = 5;//每页显示数量
            if ($type == "weibo") {
//                根据当前用户id找到其下关注用户的所有微博
                $start = ($page - 1) * $listRows;//起始位置
                $support = D('support')
                    ->field('row')
                    ->limit($start . ',' . $listRows)
                    ->where(['uid' => $uid, 'table' => "weibo"])
                    ->select();
                foreach ($support as $key => $val) {
                    $like_weibo = D('weibo')
                        ->where(['id' => $val['row'], 'status' => 1])
                        ->find();
                    $cate_info = $this->get_category($like_weibo['category']);
                    $user_info = $this->user_info($like_weibo['uid']);
                    $img_path = $this->data_img($like_weibo['images']);
                    $create_time = date('Y-m-d H:i', $like_weibo['create_time']);
                    $list['weibo_list'][$key]['id'] = $like_weibo['id'];
                    $list['weibo_list'][$key]['title'] = $like_weibo['title'];
                    $list['weibo_list'][$key]['content'] = $like_weibo['content'];
                    $list['weibo_list'][$key]['create_time'] = $create_time;
                    $list['weibo_list'][$key]['comment_count'] = $like_weibo['comment_count'];
                    $list['weibo_list'][$key]['likes_count'] = $like_weibo['likes_count'];
                    $list['weibo_list'][$key]['user'] = $user_info;
                    $list['weibo_list'][$key]['cate_info'] = $cate_info;
                    $list['weibo_list'][$key]['img_list'] = $img_path;
                    $list['weibo_list'][$key]['like'] = 1;
                }
                $count = D('support')
                    ->field('row')
                    ->where(['uid' => $uid, 'table' => "weibo"])
                    ->count();
            } elseif ($type == "user") {
//                根据当前用户id找到其下所有的关注用户
                $start = ($page - 1) * $listRows;//起始位置
                $my_follow = D('follow')
                    ->field('follow_who')
                    ->limit($start . ',' . $listRows)
                    ->where(array('who_follow' => $uid))
                    ->select();
                foreach ($my_follow as $key => $val) {
                    $user_info = $this->user_info($val["follow_who"]);
                    $user_signature = D('member')
                        ->field('signature')
                        ->where(['uid' => $val["follow_who"]])
                        ->find();
                    $sign = mb_substr($user_signature['signature'], 0, 12, 'utf-8');
                    $user_info['sign'] = $sign;
                    $list['weibo_list'][$key] = $user_info;
                }
                $count = D('follow')
                    ->field('follow_who')
                    ->where(array('who_follow' => $uid))
                    ->count();
            } else {
                $list = null;
            }
            $list['total'] = $count;
            $list['now_page'] = $page;
            $list['total_page'] = ceil($list['total'] / $listRows);
//            if ($list['total_page'] == $list['now_page']){
//                $list['end'] = 1;
//            }else{
//                $list['end'] = 0;
//            }
            successReturn($list);
        }
    }

    /**
     * 获取用户基础资料
     */
    public function get_user_info()
    {
        if (checkGet()) {
            $uid = I('get.user_id', '', 'intval');
            $login_id = I('get.login_id', '', 'intval');
            //如果uid不为空且login_id为空 查询的是未登录状态下浏览其他用户的信息
            if (!$login_id) {
                $member = D('member')
                    ->alias('m')
                    ->join('left join ot_avatar a ON m.uid=a.uid')
                    ->join('left join ot_background b ON m.uid=b.uid')
                    ->field('m.uid,m.nickname,m.sex,m.signature,m.token,m.openid,m.reg_time,a.path,b.background_img')
                    ->where(['m.uid' => $uid])
                    ->find();
                $be_count = $this->be_count($uid);
                $is_follow = 0;
                $count = $this->get_count($uid);
                $count = array_merge($count, $be_count);
            }
            if (!$uid) {
                $member = D('member')
                    ->alias('m')
                    ->join('left join ot_avatar a ON m.uid=a.uid')
                    ->join('left join ot_background b ON m.uid=b.uid')
                    ->field('m.uid,m.nickname,m.sex,m.signature,m.token,m.openid,m.reg_time,a.path,b.background_img')
                    ->where(['m.uid' => $login_id])
                    ->find();
                $is_follow = 0;
                $count = $this->get_count($login_id);
            }
            //两个id都不为空查询的是已登录状态下浏览其他用户的信息
            if (!empty($login_id) && !empty($uid)) {
                $member = D('member')
                    ->alias('m')
                    ->join('left join ot_avatar a ON m.uid=a.uid')
                    ->join('left join ot_background b ON m.uid=b.uid')
                    ->field('m.uid,m.nickname,m.sex,m.signature,m.token,m.openid,m.reg_time,a.path,b.background_img')
                    ->where(['m.uid' => $uid])
                    ->find();
                $follow = D('follow')
                    ->where(['who_follow' => $login_id, 'follow_who' => $uid])
                    ->find();
                if ($follow) {
                    $is_follow = 1;
                } else {
                    $is_follow = 0;
                }
                $be_count = $this->be_count($uid);
                $count = $this->get_count($uid);
                $count = array_merge($count, $be_count);
            }
//            var_dump($member);exit;
            $list = array(
                'uid' => $member['uid'],
                'nickname' => $member['nickname'],
                'sex' => $member['sex'],
                'signature' => $member['signature'],
                'token' => $member['token'],
                'openid' => $member['openid'],
                'reg_time' => date('Y-m-d', $member['reg_time']),
                'avatar' => $member['path'],
                'background_img' => $member['background_img'],
                'is_follow' => $is_follow,
            );
            $list = array_merge($list, $count);
            successReturn($list);
        }
    }

    /**
     * 根据id获取用户下的作品/关注/粉丝/点赞 的总数
     */
    public function get_count($uid)
    {
        $weibo_count = D('weibo')
            ->where(['uid' => $uid,'status'=>1])
            ->count();
        $follow_count = D('follow')
            ->where(['who_follow' => $uid])
            ->count();
        $fans_count = D('follow')
            ->where(['follow_who' => $uid])
            ->count();
        $support_count = D('support')
            ->where(['uid' => $uid])
            ->count();
        $member['weibo_count'] = $weibo_count;
        $member['follow_count'] = $follow_count;
        $member['fans_count'] = $fans_count;
        $member['likes_count'] = $support_count;
        return $member;
    }

    /**
     * 根据用户id获取用户作品被评论/喜欢的总数量
     */
    public function be_count($uid)
    {
        $comment_count = D('weibo')
            ->field('comment_count')
            ->where(['uid' => $uid, 'status' => 1])
            ->sum('comment_count');
//            ->select();
        $likes_count = D('weibo')
            ->field('likes_count')
            ->where(['uid' => $uid, 'status' => 1])
            ->sum('likes_count');
        $count['all_comment_count'] = $comment_count;
        $count['all_likes_count'] = $likes_count;
        return $count;
    }

    /**
     * 更新用户基础资料
     */
    public function save_my_info()
    {
        if (checkPost()) {
            $uid = I('post.user_id', 1, 'intval');
            $name = I('post.nickname', 1, 'string');
            $bkg_img = I('post.bkg_img', 1, 'string');//背景图片
            $sex = I('post.sex', 1, 'int');
            $phone = I('post.phone', '', 'string');
            $captcha = I('post.captcha', 1, 'int');
            $signature = I('post.signature', 1, 'string');

            $member = D('member')
                ->where(['uid' => $uid])
                ->find();
            $member_name = cutstr_html($name);
            if ($member_name !== $member['nickname']) {
                $this->checkNickname($member_name);
            }
            $message_code = S('message_code');
            if ($message_code) {
                if ($captcha != $message_code) {
                    errorReturn('验证码错误');
                }
            } else {
                errorReturn('验证码已过期,请重新发送验证码');
            }
//            var_dump($member);exit;
//            $message_code = session('message_code');
//            if ($message_code == $captcha){
//            var_dump($phone);exit;
            $user['nickname'] = $member_name;
            $user['sex'] = $sex;
            $user['phone'] = $phone;
            $user['signature'] = $signature;
            $rs_member = D('Member')
                ->where(['uid' => $uid])
                ->save($user);
            $bkg_exist = D('background')
                ->where(['uid' => $uid])
                ->find();
            if (!empty($bkg_img)) {
                if (!empty($bkg_exist)) {
                    $bkg['background_img'] = $bkg_img;
                    $bkg['create_time'] = time();
                    $bkg['status'] = 1;
                    D('background')
                        ->where(['uid' => $uid])
                        ->save($bkg);
                } else {
                    $bkg['uid'] = $uid;
                    $bkg['background_img'] = $bkg_img;
                    $bkg['create_time'] = time();
                    $bkg['status'] = 1;
                    D('background')
                        ->add($bkg);
                }
            }
            //TODO tox 清空缓存
            S('weibo_at_who_users', null);
            if ($rs_member) {
                successReturn([], '设置成功');
            } else {
                errorReturn('未修改数据');
            }
        }
    }

    /**
     * 获取短信验证码
     */
    public function get_message_code()
    {
        if (checkGet()) {
            include('MessageController.class.php');
            session(null);
//            session(array('name'=>'message_code','expire'=>3600));
            $phone = I('get.phone');
//            $phone = '13888888888';
            if (preg_match("/^(13[0-9]|14[5-9]|15[0-3|5-9]|166|17[1-8]|18[0-9]|19[89])\d{8}$/", $phone)) {
                //测试数据验证码
//                $message_code = '123456';
//                $expire_time = time() + 60;
//                $re = $this->check_message_time($phone, $message_code, $expire_time);
//                if ($re) {
//                    successReturn($message_code, '发送成功');
//                } else {
//                    errorReturn('发送失败');
//                }
                //对接云片短信验证码
                //检查发送次数
//                    $message_code = mt_rand(1000,9999);
//                    $code = (time()+60).','.$message_code;
//                    session('message_code',$code);
                //用存数据库的方式验证验证码,提高安全性
//                $message_code = mt_rand(1000,9999);
//                $expire_time = time()+60;
//                $re = $this->check_message_time($phone,$message_code,$expire_time);
//                if ($re){
//                    $msg = "【鑫美嘉辰】您的验证码是".$message_code;
////                    successReturn($msg,'短信发送成功');
//                    $message = new MessageController();
//                    $re_1 = $message->send($msg,$phone);
//                    if ($re_1['status']==1){
//                        if ($re_1['msg']['code']==0){
//                            successReturn('','短信发送成功');
//                        }else{
//                            errorReturn($re_1['msg']['msg']);
//                        }
//                    }else{
//                        errorReturn($re_1['msg']['msg']);
//                    }
//                }else{
//                    errorReturn('发送失败,请重试!');
//                }
//                $re = $this->check_message_time($phone);
//                if ($re['status'] == 1){
////                $message_code=mt_rand(100000,999999);
//                    $message_code='123456';
//                    str_shuffle($message_code);
////                session('message_code',$message_code);
//                    $session = S('message_code',$message_code,array('type'=>'session','expire'=>3600));
////                session(array('name'=>'message_code','value'=>$message_code,'expire'=>60));
////                var_dump(S('message_code'));exit;
//                    //            $redis->set('code_'.$phone,$message_code,60);
//                    //检查发送次数
//                    if ($session){
//                        $msg = "验证码为".$message_code;
//                        successReturn($msg,'短信发送成功');
//                    }
////                $message = new MessageController();
////                $re = $message->send($msg,$phone);
////                return $re;
//                }else{
//                    successReturn($re['msg']);
//                }

                    //本地验证每日短信发送上限
//                $re = $this->check_message_time($phone);
//                if ($re['status'] == 1){
//                    //测试数据验证码
//                    $message_code='123456';
//                    $expire_time = time()+60;
//                    $re = $this->check_message_time($phone,$message_code,$expire_time);
//                    if ($re){
//                        successReturn($message_code,'发送成功');
//                    }else{
//                        errorReturn('发送失败');
//                    }
                    //对接云片短信验证码
                    //检查发送次数
//                    $message_code = mt_rand(1000,9999);
//                    $code = (time()+60).','.$message_code;
//                    session('message_code',$code);

                //用存数据库的方式验证验证码,提高安全性
                $message_code = mt_rand(1000,9999);
                $expire_time = time()+60;
//                    session('message_code',$code);
                $re = $this->check_message_time($phone,$message_code,$expire_time);
                if ($re){
                    $msg = "【鑫美嘉辰】您的验证码是".$message_code;
//                    successReturn($msg,'短信发送成功');
                    $message = new MessageController();
                    $re_1 = $message->send($msg,$phone);
                    if ($re_1['status']==1){
                        if ($re_1['msg']['code']==0){
                            successReturn('','短信发送成功');
                        }else{
                            errorReturn($re_1['msg']['msg']);
                        }
                    }else{
                        errorReturn($re_1['msg']['msg']);
                    }
                }else{
                    errorReturn('发送失败,请重试!');
                }
//                }else{
//                    errorReturn($re['msg']);
//                }
            } else {
                errorReturn('请输入正确的11位手机号码');
            }
        }
    }

    /**
     * 检查用户短信发送次数,防止短信被盗刷
     */
    public function check_message_time($phone, $message_code, $expire_time)
    {
        $t = time();
        $end_time = mktime(23, 59, 59, date("m", $t), date("d", $t), date("Y", $t)); //当天结束时间
//        $end_time = '1537545601'; //当天结束时间
        $check_time = D('message_limit')
            ->field('num,end_time')
            ->where(['phone' => $phone])
            ->find();
        $map['code'] = $message_code;
        $map['expire_time'] = $expire_time;
        if (!empty($check_time)) {
            $result = D('message_limit')
                ->where(['phone' => $phone])
                ->save($map);
            if ($result) {
                return true;
            } else {
                return false;
            }
        } else {
            $map['num'] = 1;
            $map['date'] = time();
            $map['phone'] = $phone;
            $map['end_time'] = $end_time;
            $time = D('message_limit')
                ->add($map);
            if ($time) {
                return true;
            } else {
                return false;
            }
        }
//        if (!empty($check_time)){
//            if ($end_time == $check_time['end_time']){
//                if (time()<=$check_time['end_time']){
//                    if ($check_time['num']>=10){
//                        return array('status'=>0,'msg'=>'每日发送短信已达上限!');
//                    }else{
//                        $map['num'] = $check_time['num']+1;
//                        $map['date'] = time();
//                        $time = D('message_limit')
//                            ->where(['phone'=>$phone])
//                            ->save($map);
//                        if ($time){
//                            return array('status'=>1,'msg'=>'短信已发送!');
//                        }else{
//                            return array('status'=>0,'msg'=>'短信发送失败!');
//                        }
//                    }
//                }else{
//                    $map['num'] = 1;
//                    $map['date'] = time();
//                    $map['end_time'] = $end_time;
//                    $time = D('message_limit')
//                        ->where(['phone'=>$phone])
//                        ->save($map);
//                    if ($time){
//                        return array('status'=>1,'msg'=>'短信已发送!');
//                    }else{
//                        return array('status'=>0,'msg'=>'短信发送失败!');
//                    }
//                }
//            }else{
//                $map['num'] = 1;
//                $map['date'] = time();
//                $map['end_time'] = $end_time;
//                $time = D('message_limit')
//                    ->where(['phone'=>$phone])
//                    ->save($map);
//                if ($time){
//                    return array('status'=>1,'msg'=>'短信已发送!');
//                }else{
//                    return array('status'=>0,'msg'=>'短信发送失败!');
//                }
//            }
//        }else{
//            $map['num'] = 1;
//            $map['date'] = time();
//            $map['phone'] = $phone;
//            $map['end_time'] = $end_time;
//            $time = D('message_limit')
//                ->add($map);
//            if ($time){
//                return array('status'=>1,'msg'=>'短信已发送!');
//            }else{
//                return array('status'=>0,'msg'=>'短信发送失败!');
//            }
//        }
    }

    /**
     * 获取用户的作品
     */
    public function get_user_profiles()
    {
        if (checkGet()) {
            $uid = I('get.user_id', 1, 'int');
            $page = I('p', 1, 'int');
            $listRows = 5;
            $start = ($page - 1) * $listRows;//起始位置
            $weiboModel = new WeiboModel();
            $list = $weiboModel->getUserWeibo($uid, $start, $listRows);
            $count = D('weibo')->where(array('status' => 1, 'uid' => $uid))->count();
            foreach ($list as $key => $val) {
                $cate_info = $this->get_category($val['category']);
                $user_info = $this->user_info($val['uid']);
                $img_path = $this->data_img($val['images']);
                $weibo_list['weibo_list'][$key]['id'] = $val['id'];
                $weibo_list['weibo_list'][$key]['title'] = $val['title'];
                $weibo_list['weibo_list'][$key]['content'] = $val['content'];
                $weibo_list['weibo_list'][$key]['create_time'] = date('Y-m-d H:i', $val['create_time']);
                $weibo_list['weibo_list'][$key]['comment_count'] = $val['comment_count'];
                $weibo_list['weibo_list'][$key]['likes_count'] = $val['likes_count'];
                $weibo_list['weibo_list'][$key]['repost_count'] = $val['repost_count'];
                $weibo_list['weibo_list'][$key]['user'] = $user_info;
                $weibo_list['weibo_list'][$key]['cate_info'] = $cate_info;
                $weibo_list['weibo_list'][$key]['img_list'] = $img_path;
                $like = D('support')
                    ->where(['row' => $val['id'], 'uid' => $uid, 'table' => 'weibo'])
                    ->find();
                if (!empty($like)) {
                    $weibo_list['weibo_list'][$key]['like'] = 1;
                } else {
                    $weibo_list['weibo_list'][$key]['like'] = 0;
                }
            }
            $weibo_list['total'] = $count;
            $weibo_list['now_page'] = $page;
            $weibo_list['total_page'] = ceil($weibo_list['total'] / $listRows);
        }
        successReturn($weibo_list);
    }

    /**
     * 获取用户的动态
     */
    public function get_user_dynamic(){
        if (checkGet()){
            $uid = I('get.user_id','','intval');
            $page = I('p', 1, 'int');
            $listRows =10;
            $start = ($page - 1) * $listRows;//起始位置
            $message = D('message')
                ->field('content_id')
                ->limit($start.','.$listRows)
                ->where(array('from_uid'=>$uid,'status'=>1))
                ->order('create_time desc')
                ->select();
            $count = D('message')
                ->field('content_id')
                ->where(array('from_uid'=>$uid,'status'=>1))
                ->count();
            $list = [];
            foreach ($message as $key=>$val) {
                $message_content = D('message_content')
//                        ->field('id,title,content,url,create_time')
                    ->where(array('id' => $val['content_id'], 'status' => 1))
                    ->find();
                $message_dynamic = $this->get_dynamic_info($uid,$message_content,$val);
                $list['weibo_list'][$key] = $message_dynamic;
            }
//            var_dump($message);exit;
            $list['total'] = $count;
            $list['now_page'] = $page;
            $list['total_page'] = ceil($list['total'] / $listRows);
            successReturn($list);exit;
        }
    }

    /**
     * 获取通知
     */
    public function notices()
    {
        if (checkGet()) {
            $uid = I('get.user_id', '', 'int');
            $type = I('get.type', '', 'int');
            $page = I('get.p', '', 'int');
            $listRows = 10;
            $start = ($page - 1) * $listRows;//起始位置
//            $uid = 1;
//            $message_sessions = get_all_message_session();
//            foreach($message_sessions as &$val){
//                if($val['block_tpl']){
//                    $val['block_tpl']=APP_PATH.$val['module'].'/.../'.$val['block_tpl'].'.html';
//                }else{
//                    $val['block_tpl']=APP_PATH.'Common/.../_message_block.html';
//                }
//                if($val['default']){
//                    $val['name']=$val['name'].'【默认】';
//                }
//            }
//            unset($val);
//            $builder=new AdminListBuilder();
//            $builder->title('会话类型列表')
//                ->suggest('这里只能查看和刷新，要对会话做增删改，请修改对应文件')
//                ->ajaxButton(U('Message/sessionRefresh'),null,'刷新',array('hide-data' => 'true'))
//                ->keyText('name','标识（发送消息时的$type参数值）')
//                ->keyTitle()
//                ->keyText('alias','所属模块')
//                ->keyImage('logo','会话图标')
//                ->keyText('sort','排序值')
//                ->keyText('block_tpl','列表样式模板(“...”表示“View/default/MessageTpl/block”)')
//                ->data($message_sessions)
//                ->display();
//            var_dump($message_sessions);exit;
//            var_dump(is_login());exit;
            /*-------$type 1为官方公告 2为互动消息---------*/
            if ($type == "1") {
                $where['create_time'] = ['lt', time()];
                $where['end_time'] = ['gt', time()];
                $where['status'] = ['eq', 1];
                $count = D('announce')
                    ->where($where)
                    ->count('id');
                $message = D('announce')
                    ->field('id,title,content,link,create_time,manage,remark')
                    ->limit($start.','.$listRows)
                    ->where($where)
                    ->order('create_time desc')
                    ->select();
                $announce = [];
                foreach ($message as $key => $val) {
                    $announce['weibo_list'][$key]['id'] = $val['id'];
                    $announce['weibo_list'][$key]['title'] = $val['title'];
                    $announce['weibo_list'][$key]['remark'] = $val['remark'];
                    $announce['weibo_list'][$key]['content'] = $val['content'];
                    $announce['weibo_list'][$key]['link'] = $val['link'];
                    $announce['weibo_list'][$key]['create_time'] = date('Y-m-d H:i', $message[$key]['create_time']);
                    $announce['weibo_list'][$key]['user'] = $this->user_info($val['manage']);
                    $msg_anc = D('message')
                        ->where(['content_id'=>$val['id'],'type'=>"announce"])
                        ->find();
                    if ($msg_anc){
                        $announce['weibo_list'][$key]['is_read'] = 1;
                    }else{
                        $announce['weibo_list'][$key]['is_read'] = 0;
                    }
                }
                $announce['weibo_total'] = $count;
                $announce['now_page'] = $page;
                $announce['total_page'] = ceil($announce['weibo_total'] / $listRows);
                successReturn($announce);
            } elseif ($type == "2") {
                $start = ($page - 1) * $listRows;//起始位置
                $message = D('message')
                    ->field('content_id,from_uid')
                    ->limit($start.','.$listRows)
                    ->where(array('to_uid'=>$uid,'status'=>1))
                    ->order('create_time desc')
                    ->select();
                $count = D('message')
                    ->field('content_id')
                    ->where(array('to_uid'=>$uid,'status'=>1))
                    ->count();
                $msg = [];
                foreach ($message as $key=>$val) {
                    $message_content = D('message_content')
                        ->where(array('id' => $val['content_id'], 'status' => 1))
                        ->find();
                    $message_dynamic = $this->get_dynamic_info($val['from_uid'],$message_content,$val['content_id']);
                    $msg['weibo_list'][$key] = $message_dynamic;
                }
//                foreach ($message as $key => $val) {
//                    $message_content = D('message_content')
////                        ->field('id,title,content,url,create_time')
//                        ->where(array('id' => $val['content_id'], 'status' => 1))
//                        ->find();
//                    $msg[] = $message_content;
//                }
                $msg['total'] = $count;
                $msg['now_page'] = $page;
                $msg['total_page'] = ceil($msg['total'] / $listRows);
                successReturn($msg);
            } else {
                return null;
            }
        }
    }

    /**
     * 获取互动数据
     */
    public function get_dynamic_info($uid,$message,$msg_info){
        $msg = D('message')
            ->field('create_time,is_read')
            ->where(['content_id'=>$msg_info['content_id']])
            ->find();
        $weibo_id = json_decode($message['args'],true);
        if ($message['type']=="comment"){
            $content = D('weibo_comment')
                ->field('content,to_comment_id')
                ->where(['uid'=>$uid,'id'=>$weibo_id['comment_id']])
                ->find();
            $msg_content['comment_id'] = $weibo_id['comment_id'];
            $msg_content['content'] = $content['content'];
            if ($content['to_comment_id']==0){
                $msg_content['my_info'] = $this->user_info($message['from_id']);
                $msg_content['user'] = $this->user_info( $msg_content['weibo_detail']['uid']);
            }else{
                $to_comment = D('weibo_comment')
                    ->where(['id'=>$content['to_comment_id']])
                    ->find();
                $msg_content['my_info'] = $this->user_info($message['from_id']);
                $msg_content['user'] = $this->user_info($to_comment['uid']);
                $msg_content['to_comment'] = $to_comment['content'];
            }
            $model = new WeiboModel();
            $msg_content['weibo_detail'] = $model->getWeiboDetail1($weibo_id['weibo_id']);
            $msg_content['cate_info'] = $this->get_category( $msg_content['weibo_detail']['category']);
            $msg_content['img_list'] = $this->data_img($msg_content['weibo_detail']['images']);
            $msg_content['type'] = $message['type'];
        }elseif ($message['type']=="support"){
            $model = new WeiboModel();
            $msg_content['weibo_detail'] = $model->getWeiboDetail1($weibo_id['weibo_id']);
            $msg_content['img_list'] = $this->data_img($msg_content['weibo_detail']['images']);
            $msg_content['type'] = $message['type'];
            $msg_content['my_info'] = $this->user_info($message['from_id']);
            if ($message['title']=="喜欢"){
                $msg_content['is_support'] = 1;
            }else{
                $message['is_support'] = 0;
            }
        }elseif ($message['type']=="follow"){
            $msg_content['my_info'] = $this->user_info($message['from_id']);
            $msg_content['user'] = $this->user_info($weibo_id['uid']);
            if ($message['title']=="关注"){
                $msg_content['is_follow'] = 1;
            }else{
                $message['is_follow'] = 0;
            }
            $msg_content['type'] = $message['type'];
        }
        $msg_content['create_time'] = date('Y-m-d H:i:s',$msg['create_time']);
        $msg_content['is_read'] = $msg['is_read'];
        return $msg_content;
    }

    /**
     * 用户认证页面
     */
    public function user_auth(){
        if (checkGet()){
            $attestModel=D('Ucenter/Attest');
            $attestTypeModel=D('Ucenter/AttestType');
            $attestType=$attestTypeModel->getTypeList();
            $this->_checkAttestStatus();
            $celebrity=$attestModel->getListLimit();
            $attest['type'] = $attestType;
            $attest['celebrity'] = $celebrity;
            successReturn($attest);
        }
    }

    /**
     * 用户认证
     */
    public function individual()
    {
        $this->_checkAttestConditions();
        $this->_checkAttestStatus();

    }

    public function apply()
    {
        $attest_old=$this->_checkAttestStatus(1);

        $this->checkAuth('Ucenter/Attest/apply',-1,'你没有申请权限');
        if(IS_POST){
            $attest=$this->attestModel->create();
            //检测认证资料 start
            $res=$this->_checkAttestConditions($attest);
            if(!$res){
                $this->error('为满足认证申请条件！');
            }
            $attest_type=$this->_checkTypeExist($attest['attest_type_id']);
            $attest_type['fields']['child_type_option']=explode(',',str_replace('，',',',$attest_type['fields']['child_type_option']));
            $attest_type['fields']['image_type_option']=explode(',',str_replace('，',',',$attest_type['fields']['image_type_option']));
            if(!in_array($attest['child_type'],$attest_type['fields']['child_type_option'])){
                $this->error('非法操作！');
            }
            if($attest_type['fields']['company_name']!=0){
                if($attest_type['fields']['company_name']==1&&strlen($attest['company_name'])==0){
                    $this->error('企业、组织名称不能为空！');
                }
                if(strlen($attest['company_name'])<2||strlen($attest['company_name'])>100){
                    $this->error('名称长度应该在2到100之间');
                }
            }
            if($attest_type['fields']['name']!=0){
                if($attest_type['fields']['name']==1&&strlen($attest['name'])==0){
                    $this->error('真实姓名不能为空！');
                }
                if(preg_match('/^[\x4e00-\x9fa5]{2,8}$/',$attest['name'])===false){
                    $this->error('请填写真实姓名');
                }
            }
            if($attest_type['fields']['name']!=0){
                if($attest_type['fields']['id_num']==1&&strlen($attest['id_num'])==0){
                    $this->error('身份证号不能为空！');
                }
                if(preg_match('/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/',$attest['id_num'])===false&&preg_match('/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/',$attest['id_num'])===false){
                    $this->error('请填写正确身份证号码');
                }
            }
            if($attest_type['fields']['phone']!=0){
                if($attest_type['fields']['phone']==1&&strlen($attest['phone'])==0){
                    $this->error('联系方式不能为空！');
                }
                if(preg_match('/^(1[3|4|5|7|8])[0-9]{9}$/',$attest['phone'])===false&&preg_match('/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/',$attest['phone'])===false){
                    $this->error('请填写正确联系方式');
                }
            }
            if(!in_array($attest['image_type'],$attest_type['fields']['image_type_option'])){
                $this->error('非法操作！');
            }
            if($attest_type['fields']['prove_image']==1&&!count($attest['prove_image'])){
                $this->error('请上传组织或企业证件的高清照片！');
            }
            if($attest_type['fields']['image']==1&&!count($attest['image'])){
                $this->error('请上传证件正反面的高清照片！');
            }
            if($attest_type['fields']['other_image']==1&&!count($attest['other_image'])){
                $this->error('请上传其他证明材料的高清照片！');
            }
            if($attest_type['fields']['info']!=0){
                if($attest_type['fields']['info']==1&&strlen($attest['info'])==0){
                    $this->error('认证补充不能为空！');
                }
            }
            //检测认证资料 end

            $attest['prove_image']&&$attest['prove_image']=implode(',',$attest['prove_image']);
            $attest['image']&&$attest['image']=implode(',',$attest['image']);
            $attest['other_image']&&$attest['other_image']=implode(',',$attest['other_image']);
            $attest['uid']=is_login();
            $attest['status']=2;
            $res=$this->attestModel->editData($attest);
            if($res!==false){
                $uids=get_auth_user('Admin/Attest/setAuditStatus');
                $user=query_user(array('nickname'));
                send_message($uids,'用户申请认证','用户'.$user['nickname'].'申请'.$attest_type['title'].'，请速去审核',U('Admin/attest/attestlist',array('attest_type_id'=>$attest['attest_type_id'],'status'=>3),true,true),array('status'=>2),-1);
                $this->success('申请成功，请等待审核！',U('Ucenter/Attest/process'));
            }else{
                $this->success('申请失败，请重试！');
            }
        }else{
            $res=$this->_checkAttestConditions($attest_old);
            if(!$res){
                $this->error('未满足认证申请条件！');
            }
            if($attest_old){
                $attestType=$this->_checkTypeExist($attest_old['attest_type_id']);
            }else{
                $aId=I('get.id',0,'intval');
                $attestType=$this->_checkTypeExist($aId);
            }
            $attestType['fields']['child_type_option']=explode(',',str_replace('，',',',$attestType['fields']['child_type_option']));
            $attestType['fields']['image_type_option']=explode(',',str_replace('，',',',$attestType['fields']['image_type_option']));
            $this->assign('attest_type',$attestType);

            $this->display();
        }
    }

    private function get_weibo_list($params){
        $model = new WeiboModel();
        $lists = $model->getWeiboListByIndex($params);
        return $lists;
    }

    /**
     * checkIsLogin  判断是否登录
     * @author:xjw129xjt(肖骏涛) xjt@ourstu.com
     */
    private function checkIsLogin()
    {
        if (!is_login()) {
            $this->error(L('_ERROR_PLEASE_FIRST_LOGIN_'));
        }
    }

    /**
     * 解析搜索字符串
     */
    protected function parseSearchKey($key = null)
    {
        $action = MODULE_NAME . '_' . CONTROLLER_NAME . '_' . ACTION_NAME;
        $post = I('post.');
        if (empty($post)) {
            $keywords = cookie($action);
        } else {
            $keywords = $post;
            cookie($action, $post);
            $_GET['page'] = 1;
        }

        if (!$_GET['page']) {
            cookie($action, null);
            $keywords = null;
        }
        return $key ? $keywords[$key] : $keywords;
    }

    /**
     * assignSelf  输出当前登录用户信息
     * @author:xjw129xjt(肖骏涛) xjt@ourstu.com
     */
    private function reSelf()
    {
        $self = query_user(array('title', 'avatar128', 'nickname', 'uid', 'space_url', 'score', 'title', 'fans', 'following', 'weibocount', 'rank_link'));
        //获取用户封面id
        $map = getUserConfigMap('user_cover');
        $map['role_id'] = 0;
        $model = D('Ucenter/UserConfig');
        $cover = $model->findData($map);
        $self['cover_id'] = $cover['value'];
        $self['cover_path'] = getThumbImageById($cover['value'], 300, 180);
        return $self;
    }

    /**验证用户名
     * @param $nickname
     * @auth 陈一枭
     */
    private function checkNickname($nickname)
    {
        $length = mb_strlen($nickname, 'utf8');
        if ($length == 0) {
            $this->error(L('_ERROR_NICKNAME_INPUT_').L('_PERIOD_'));
        } else if ($length > modC('NICKNAME_MAX_LENGTH',32,'USERCONFIG')) {
            $this->error(L('_ERROR_NICKNAME_1_'). modC('NICKNAME_MAX_LENGTH',32,'USERCONFIG').L('_ERROR_NICKNAME_2_').L('_PERIOD_'));
        } else if ($length < modC('NICKNAME_MIN_LENGTH',2,'USERCONFIG')) {
            $this->error(L('_ERROR_NICKNAME_LENGTH_1_').modC('NICKNAME_MIN_LENGTH',2,'USERCONFIG').L('_ERROR_NICKNAME_2_').L('_PERIOD_'));
        }
        $match = preg_match('/^(?!_|\s\')[A-Za-z0-9_\x80-\xff\s\']+$/', $nickname);
        if (!$match) {
            $this->error(L('_ERROR_NICKNAME_LIMIT_').L('_PERIOD_'));
        }

        $map_nickname['nickname'] = $nickname;
        $map_nickname['uid'] = array('neq', is_login());
        $had_nickname = D('Member')->where($map_nickname)->count();
        if ($had_nickname) {
            $this->error(L('_ERROR_NICKNAME_USED_').L('_PERIOD_'));
        }
        $denyName = M("Config")->where(array('name' => 'USER_NAME_BAOLIU'))->getField('value');
        if ($denyName != '') {
            $denyName = explode(',', $denyName);
            foreach ($denyName as $val) {
                if (!is_bool(strpos($nickname, $val))) {
                    $this->error(L('_ERROR_NICKNAME_FORBIDDEN_').L('_PERIOD_'));
                }
            }
        }
    }

    private function get_uid()
    {
        return is_login();
    }

    private function _checkAttestConditions($attest_old=null)
    {
        if($attest_old){
            $attestType=$this->_checkTypeExist($attest_old['attest_type_id']);
        }else{
            $aId=I('get.id',0,'intval');
            $attestType=$this->_checkTypeExist($aId);
        }
        $this->assign('attest_type',$attestType);

        //检测申请条件 start
        $can_apply=1;
        if($attestType['conditions']['avatar']==1){
            $avatar_user=query_user(array('avatar128'));
            $this->assign('user_avatar',$avatar_user['avatar128']);

            $map['uid']=is_login();
            $map['status']=1;
            $avatar=M('Avatar')->where($map)->find();
            if($avatar){
                $this->assign('avatar_ok',1);
            }else{
                $can_apply=0;
            }
        }
        if($attestType['conditions']['phone']==1){
            $mobile=query_user(array('mobile'));
            if($mobile['mobile']!=''){
                $this->assign('phone_ok',1);
            }else{
                $can_apply=0;
            }
        }
        $followModel=D('Follow');
        if($attestType['conditions']['follow']>0){
            $map_follow['who_follow']=is_login();
            $map_follow['follow_who']=array('neq','');
            $follow_count=$followModel->where($map_follow)->count();
            if($follow_count>$attestType['conditions']['follow']){
                $this->assign('follow_ok',1);
            }else{
                $can_apply=0;
            }
        }
        if($attestType['conditions']['fans']>0){
            $map_fans['follow_who']=is_login();
            $map_fans['who_follow']=array('neq','');
            $fans_count=$followModel->where($map_fans)->count();
            if($fans_count>$attestType['conditions']['fans']){
                $this->assign('fans_ok',1);
            }else{
                $can_apply=0;
            }
        }
        if($attestType['conditions']['friends']>0){
            $friendUids=$followModel->getMyFriends();
            $map_friend['uid']=array('in',$friendUids);
            $map_friend['status']=1;
            $friends_count=$this->attestModel->where($map_friend)->count();
            if($friends_count>$attestType['conditions']['fans']){
                $this->assign('friends_ok',1);
            }else{
                $can_apply=0;
            }
        }
        $this->assign('can_apply',$can_apply);
        //检测申请条件 end
        return $can_apply;
    }

    private function _checkAttestStatus($redirect=0)
    {
        $attestModel=D('Ucenter/Attest');
        $attestTypeModel=D('Ucenter/AttestType');
        $map['uid']=is_login();
        $map['status']=array('in','1,2,0');
        $attest=$attestModel->getData($map);
        if(!$attest){
            return false;
        }
        $attest['prove_image']=explode(',',$attest['prove_image']);
        $attest['image']=explode(',',$attest['image']);
        $attest['other_image']=explode(',',$attest['other_image']);
        $attest['type']=$attestTypeModel->getData($attest['attest_type_id'],1);
        if($attest['status']==1){
            if($redirect){
                redirect(U('Ucenter/Attest/process'));
            }
        }
        if($attest['status']==2||$attest['status']==0){
            $aChange=I('change',0,'intval');
            if(!$aChange){
                if($redirect){
                    redirect(U('Ucenter/Attest/process'));
                }
            }else{
                $this->assign('change',1);
            }
        }
        $this->assign('attest',$attest);
        return $attest;
    }

    private function _checkTypeExist($id)
    {
        $attestTypeModel=D('Ucenter/AttestType');
        $data=$attestTypeModel->getData($id,1);
        if(!$data){
            $this->error('该认证类型不存在！');
        }
        return $data;
    }
}