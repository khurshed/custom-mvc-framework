<?php

class Model {

    protected $db;
    protected $table;
    protected $fields = array();

    public function __construct($table = null) {
        $dbconfig['host'] = $GLOBALS['config']['host'];

        $dbconfig['user'] = $GLOBALS['config']['user'];

        $dbconfig['password'] = $GLOBALS['config']['password'];

        $dbconfig['dbname'] = $GLOBALS['config']['dbname'];

        $dbconfig['port'] = $GLOBALS['config']['port'];

        $dbconfig['charset'] = $GLOBALS['config']['charset'];

        $this->db = new Mysql($dbconfig);

        $this->table = $GLOBALS['config']['table_prefix'] . $table != NULL ? $table : (str_replace("Model", "", get_class($this)));
        $this->getFields();
    }

    private function getFields() {

        $sql = "DESC " . $this->table;
        $result = $this->db->query($sql);
        while ($res = $result->fetch(PDO::FETCH_ASSOC)) {
            $this->fields[] = $res['Field'];
            if ($res['Key'] == 'PRI') {
                $pk = $res['Field'];
            }
        }
        if (isset($pk)) {
            $this->fields['pk'] = $pk;
        }
    }

    public function insert($list) {

        $field_list = '';

        $value_list = '';

        foreach ($list as $k => $v) {

            if (in_array($k, $this->fields)) {

                $field_list .= "`" . $k . "`" . ',';

                $value_list .= "'" . $v . "'" . ',';
            }
        }

        $field_list = rtrim($field_list, ',');

        $value_list = rtrim($value_list, ',');

        $sql = "INSERT INTO `{$this->table}` ({$field_list}) VALUES ($value_list)";
        if ($this->db->query($sql)) {

            return $this->db->getInsertId();
        } else {

            return false;
        }
    }

    public function selectByPk($pk) {

        $sql = "select * from `{$this->table}` where `{$this->fields['pk']}`=$pk";

        return $this->db->query($sql)->fetch(PDO::FETCH_OBJ);
    }

}
