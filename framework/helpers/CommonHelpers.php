<?php

class CommonHelpers {

    public static function removeSpaceSpecialCharacterFromFile($data) {
        return preg_replace("/[^-_A-Za-z0-9]/", "", preg_replace('!\s+!', '_', preg_replace('/\\.[^.\\s]{3,4}$/', '', $data)));
    }

    public static function RandomString($length = 4) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $randstring = '';
        for ($i = 0; $i < $length; $i++) {
            $randstring .= $characters[rand(0, (strlen($characters) - 1))];
        }
        return $randstring;
    }
    
    public static function upload($file){
        $file_move_to = UPLOAD_PATH.'files/';
        if (!file_exists($file_move_to)) {
            mkdir($file_move_to, 0777, true);
        }
        $file = $_FILES;
        $file_name= self::removeSpaceSpecialCharacterFromFile($file["file"]["name"]).'_'.self::RandomString(10). '.' . pathinfo($file["file"]["name"], PATHINFO_EXTENSION);
        if(move_uploaded_file($file["file"]["tmp_name"], $file_move_to.$file_name)){
            return $file_name;
        }else{
            return null;
        }
    }
    
    public static function Redirect($url, $permanent = false) {
        $current_url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") ."://$_SERVER[HTTP_HOST]$_SERVER[PHP_SELF]";
        header('Location: ' . $current_url.'?'.$url, true, $permanent ? 301 : 302);
        exit();
    }

}
