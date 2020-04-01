<?php
use Framefork\Core\Framework;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require "framework/core/Framework.php";
Framework::run();
