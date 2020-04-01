<?php

class IndexController extends Controller{

    

    public function indexAction(){
        
        include  CURR_VIEW_PATH . "index.html";

    }
    
    public function uploadAction(){
        $file_name = CommonHelpers::upload($_FILES);
        if($file_name){
            $file_model = new FilesModel("tbl_files");
            $id = $file_model->insertRow(["name" => $file_name]);
        }
        CommonHelpers::Redirect('c=Index&a=preview&id=' . base64_encode($id));
    }
    
    
    public function previewAction(){
        $id = isset($_REQUEST['id'])?base64_decode($_REQUEST['id']):'';
        $file_model = new FilesModel("tbl_files");
        $data = $file_model->getRowPk($id);
        $docx_parse = new DocxParseHelpers(UPLOAD_PATH.'files/' .$data->name);
        $datas = $docx_parse->convertToText();
        $datas = explode("\r\n", $datas);
        $list = [];
        foreach ($datas as $data){
            if ($data == '')
            continue;
            $data = explode(":", $data);
            $list[]= ["filed" => isset($data[0])? trim($data[0]):'', "value" => isset($data[1])?$data[1]:''];
        }
        include  CURR_VIEW_PATH . "preview.php";

    }

    public function saveAction(){
        if($_POST){
            $user_model = new UserModel("tbl_usersinfo");
            $user_model->insertRow($_POST);
            CommonHelpers::Redirect('c=Index&a=index&message=data inserted successfully');
        }
        CommonHelpers::Redirect('c=Index&a=index&message=permission denied');
    }

}