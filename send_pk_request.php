<?php
require_once('constants');
require_once('iknow_backend_api.php');
require_once('push/XingeApp.php');
$table_name="";

$conn=new mysqli($server,$admin,$dbpasswd,$dbname);
$utility=new getInfoUtility($conn);

$sender_name=$_POST["sender_name"];
$receiver_name=$_POST["receiver_name"];
$sender_id=$utility->getId($sender_name);
$receiver_id=$utility->getId($receiver_name);

$insert_str="insert into ? (Sender,Receiver,Status,action)values(?,?,?,?)";
$stmt=$conn->prepare($insert_str);
$stmt->bind_param('siiii',$sender_id,$receiver_name,0,$sender_id);
$stmt->execute();
if($stmt->affected_rows>0){

    $message=$sender_name." has sent you a PK invitation";
    $title="PK invitation";
    XingeApp::PushAccountAndroid(2100218678,"-1",$title,$message,'mike');
}

?>
