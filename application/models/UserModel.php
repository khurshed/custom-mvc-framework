<?php

class UserModel extends Model{
    
    public function insertRow($data) {
        
        $data = [
            "name"=> $data['name'],
            "email"=> $data['email'],
            "mobile"=> $data['mobile'],
            "created" => date("Y-m-d H:i:s"),
            "updated" => date("Y-m-d H:i:s"),
            "status" => 1];
        return $this->insert($data);
    }

}
