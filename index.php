<?php

require __DIR__ . '/vendor/autoload.php';

date_default_timezone_set('Asia/Ho_Chi_Minh');
session_start();
error_reporting(E_ALL & ~E_WARNING & ~E_NOTICE & ~E_DEPRECATED);
// Turn off all warning, error
//error_reporting(0);
require_once("./helper/utils.php");
require_once("./core/Database.php");
require_once("./models/BaseModel.php");
require_once("./controllers/BaseController.php");


$controllerName = ucfirst(
    strtolower($_REQUEST['controller'] ? removeSpecialCharacter($_REQUEST['controller']) : 'Home') . 'Controller'
);

$actionName = $_REQUEST['action'] ?? 'index';

require "./controllers/$controllerName.php";

$controllerObject = new $controllerName;
$controllerObject->$actionName();