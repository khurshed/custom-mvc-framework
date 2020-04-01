<?php

class FilesModel extends Model{
    
    public function getRowPk($id){
        
        return $this->selectByPk($id);

    }
    
    public function insertRow($data) {
        
        $data = ["name"=> $data['name'], "created" => date("Y-m-d H:i:s"), "updated" => date("Y-m-d H:i:s"), "status" => 1];
        return $this->insert($data);
    }

}
