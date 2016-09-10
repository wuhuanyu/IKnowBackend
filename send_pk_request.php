<?php
require_once('constants');
require_once('iknow_backend_api.php');

$conn=new mysqli($server,$admin,$dbpasswd,$dbname);
$utility=new getInfoUtility($conn);

$sender_name=$_POST["sender_name"];
$receiver_name=$_POST["receiver_name"];



?>
