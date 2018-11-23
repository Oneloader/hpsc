<?php
/**
 * 非法请求，禁止访问
 */
function forbidden(){
    header("HTTP/1.1 404 Not Found");
    header("Status: 404 Not Found");
    exit;
}

/**
 * 非post请求，禁止访问
 */
function checkPost(){
    if(IS_POST){
        return true;
    }else{
        errorReturn('非法访问');
    }
}

/**
 * 非get请求，禁止访问
 */
function checkGet(){
    if(IS_GET){
        return true;
    }else{
        errorReturn('非法访问');
    }
}

function ajaxReturn($data){
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($data));
}

function errorReturn($msg){
    ajaxReturn(['status'=>0,'msg'=>$msg]);
}

function successReturn($data=[],$msg='success'){
    ajaxReturn(['status'=>1,'msg'=>$msg,'data'=>$data]);
}

/**
 *
 * 清除XSS
 * @param $string
 */
function clean_xss(&$string, $simple = False,$QT=True){
    if (!is_array( $string )) {
        $string = trim ( $string );
        $string = $QT ? htmlspecialchars ( $string,ENT_QUOTES) : htmlspecialchars($string);
        if ($simple) {
            return True;
        }
        $string = strip_tags ( $string );
        $string = str_replace ( array (
            '"',
            "\\",
            "'",
            "/",
            "..",
            "../",
            "./",
            "//"
        ), '', $string );
        $no = '/%0[0-8bcef]/';
        $string = preg_replace ( $no, '', $string );
        $no = '/%1[0-9a-f]/';
        $string = preg_replace ( $no, '', $string );
        $no = '/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]+/S';
        $string = preg_replace ( $no, '', $string );
        return True;
    }
    $keys = array_keys ( $string );
    foreach ( $keys as $key ) {
        clean_xss( $string [$key], $simple,$QT);
    }
}

/**
 * 获取图片绝对路径
 * @param $img_url
 * @return mixed
 */
function getImgAbsAddress($img_url){
    $image_file_path = str_replace(SITE_URL.'/',ROOT_PATH,$img_url);
    return $image_file_path;
}

/**
 * 保存base_64图片上传
 * @param $base64_image_content
 * @param $path
 * @return bool|string
 */
function saveBase64Img($base64_image_content,$pathName='images'){
    if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64_image_content, $result)){
        $type = $result[2];
        $new_file = UPLOAD_PATH . $pathName.'/'.date('Ymd',time()).'/';
        if(!file_exists($new_file))
        {
            //检查是否有该文件夹，如果没有就创建，并给予最高权限
            $r = mkdir($new_file, 0755);
            if(!$r){
                return false;   //创建文件夹失败
            }
        }
        $new_file = $new_file.time().mt_rand(100,999).".{$type}";
        if (file_put_contents($new_file, base64_decode(str_replace($result[1], '', $base64_image_content)))){
            $url = SITE_URL .'/'.$new_file;
            return $url;
        }else{
            return false;
        }
    }else{
        return false;
    }
}