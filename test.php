<?php

require_once('iknow_backend_api.php');
require_once('constants.php');

$conn=new mysqli($server,$admin,$dbpasswd,$dbname);

$utility=new getInfoUtility($conn);
echo $utility->getId('mike');
echo $utility->getName(1);









//$filename = "test.txt";
//$md5file = md5_file($filename);
//echo $md5file;
?>
