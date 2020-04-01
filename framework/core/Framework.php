<?php
namespace Framefork\Core;


class Framework {

    public static function run() {
        self::init();
        self::autoload();
        self::dispatch();
    }

    private static function init() {

        define("DS", DIRECTORY_SEPARATOR);

        define("ROOT", getcwd() . DS);

        define("APP_PATH", ROOT . 'application' . DS);

        define("FRAMEWORK_PATH", ROOT . "framework" . DS);

        define("PUBLIC_PATH", ROOT . "public" . DS);


        define("CONFIG_PATH", APP_PATH . "config" . DS);

        define("CONTROLLER_PATH", APP_PATH . "controllers" . DS);

        define("MODEL_PATH", APP_PATH . "models" . DS);

        define("VIEW_PATH", APP_PATH . "views");


        define("CORE_PATH", FRAMEWORK_PATH . "core" . DS);

        define('DB_PATH', FRAMEWORK_PATH . "database" . DS);

        define("UPLOAD_PATH", PUBLIC_PATH . "uploads" . DS);

        define("HELPERS_PATH", FRAMEWORK_PATH . "helpers" . DS);

        define("CONTROLLER", isset($_REQUEST['c']) ? $_REQUEST['c'] : 'Index');

        define("ACTION", isset($_REQUEST['a']) ? $_REQUEST['a'] : 'index');


        define("CURR_CONTROLLER_PATH", CONTROLLER_PATH);

        define("CURR_VIEW_PATH", VIEW_PATH . DS);

        require CORE_PATH . "Controller.php";
        
        require CORE_PATH . "Loader.php";
        
        require DB_PATH . "Mysql.php";

        require CORE_PATH . "Model.php";

        $GLOBALS['config'] = include CONFIG_PATH . "config.php";

        session_start();
    }

    private static function autoload() {
        spl_autoload_register(array(__CLASS__, 'load'));
    }

    private static function load($classname) {
        //echo $classname;die;
        if (substr($classname, -10) == "Controller") {
            require_once CURR_CONTROLLER_PATH . "$classname.php";
        } elseif (substr($classname, -5) == "Model") {
            require_once MODEL_PATH . "$classname.php";
        } elseif (substr($classname, -7) == "Helpers") {
            require_once HELPERS_PATH . "$classname.php";
        }
    }

    private static function dispatch() {

        $controller_name = CONTROLLER . "Controller";

        $action_name = ACTION . "Action";

        $controller = new $controller_name;

        $controller->$action_name();
    }

}

?>
