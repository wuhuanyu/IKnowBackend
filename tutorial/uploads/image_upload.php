<?php
/**
 * Created by PhpStorm.
 * User: stack
 * Date: 10/9/16
 * Time: 8:20 PM
 */

require_once "imageUploadHelper.php";


$file=$_FILES["fileToUpload"];
//echo isset($file);
//print_r($file);
$helper=new imageUploadHelper($file);

$helper->uplaod();