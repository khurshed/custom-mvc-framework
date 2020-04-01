<?php

class Mysql{

    protected $conn = false; 

    protected $sql;

    public function __construct($config = array()){
        try {
            
            $mysql = isset($config['mysql'])? $config['mysql'] : 'mysql';
            
            $host = isset($config['host'])? $config['host'] : 'localhost';

            $user = isset($config['user'])? $config['user'] : 'root';

            $password = isset($config['password'])? $config['password'] : 'root';

            $dbname = isset($config['dbname'])? $config['dbname'] : 'myweb';

            $port = isset($config['port'])? $config['port'] : '3306';
            $charset = isset($config['charset'])? $config['charset'] : 'utf8';
            $options = array(
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES $charset",
            );
            
            $this->conn = new PDO("$mysql:host=$host;dbname=$dbname", $user, $password, $options);
            // set the PDO error mode to exception
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }

    public function query($sql) {
        return $this->conn->query($sql);
        
    }

    public function getAll($sql) {
        $query = $this->query($sql);
        $list = array();
        while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
            $list[] = $row;
        }
        return $list;
    }

    public function getInsertId(){

        return $this->conn->lastInsertId();

    }
}
