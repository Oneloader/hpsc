<?php
/**
 * 上传图片
 * 图像识别
 * https://cloud.tencent.com/document/product/641/12438
 *
 * Created by PhpStorm.
 * User: caydencui
 * Date: 2018/1/26
 * Time: 9:52
 */
header('Content-Type:text/html;charset=utf-8');

class Response{
    public static function json($code,$message="",$data=array()){
        $result=array(
            'code'=>$code,
            'message'=>$message,
            'url'=>$data
        );
        //输出json
        echo stripslashes(json_encode($result));
        exit;
    }
}

//var_dump($_FILES['imgfile']['name']);exit;


define ('WEBSITE', 'http://www.demo.com/');

$uplad_tmp_name = $_FILES['imgfile']['tmp_name'];
$uplad_name     = $_FILES['imgfile']['name'];

$image_url="";
//上传文件类型列表
$uptypes=array(
    'image/jpg',
    'image/jpeg',
    'image/png',
    'image/pjpeg',
    'image/gif',
);
//……html显示上传界面

/*图片上传处理*/
//把图片传到服务器
//初始化变量
$date = date('Y-m-d',time());
$uploaded=0;
$unuploaded=0;

//图片目录
$img_dir="Uploads/Picture/".$date."/";

//上传文件路径
$img_url=WEBSITE."Uploads/Picture/".$date."/";

if (!is_dir($img_dir)){
    mkdir($img_dir);
}

//如果当前图片不为空
if(!empty($uplad_name))
{
    //判断上传的图片的类型是不是jpg,gif,png,bmp中的一种，同时判断是否上传成功
    $uptype = explode(".",$uplad_name);
    $file_end = end($uptype);
    $newname = md5(uniqid(microtime(),true)).'.'.$file_end;
    $uplad_name= $newname;
    //如果上传的文件没有在服务器上存在
    if(!file_exists($img_dir.$uplad_name))
    {
        //把图片文件从临时文件夹中转移到我们指定上传的目录中
        $file=$img_dir.$uplad_name;
        move_uploaded_file($uplad_tmp_name,$file);
            $img_url1 = $img_url.$uplad_name;
            $uploaded++;
            Response::json(1,'success',$img_url1);
    }
}else{
    $img_url1 = null;
    Response::json(0,'success',$img_url1);
}
errorReturn($img_url1);
