<?php
require_once('constants.php');
require_once('iknow_backend_api.php');
require_once('push/XingeApp.php');
$table_name="GameInvitation";

$conn=new mysqli($server,$admin,$dbpasswd,$dbname);
if($conn->connect_error){
    die("Connection failed");
}
$utility=new getInfoUtility($conn);

$sender_name=$_POST["sender_name"];
$receiver_name=$_POST["receiver_name"];

//echo "1";
//echo $sender_name;
//echo $receiver_name;
$sender_id=$utility->getId($sender_name);
$receiver_id=$utility->getId($receiver_name);

$time=time();
$room=md5($time.$sender_name.$receiver_name);
//echo $sender_id;
//echo $receiver_id;
$insert_str="insert into GameInvitation(Sender,Receiver,Room,Status,ActionId)values($sender_id,$receiver_id,'$room',0,$sender_id)";
//echo $insert_str;
$conn->query($insert_str);
if($conn->affected_rows>0){
  //  echo "success";
    var_dump( sendNotification($accessId,$secret_key,$sender_name,$receiver_name));
   // echo time();

//    XingeApp::PushAccountAndroid(2100218678,"-1",'0','0','mike');
  //  XingeApp::PushAccountAndroid($accessId,$secret_key,"Hello","this is push ",'mike');
}


function test($accessId,$secretKey,$server_name,$receiver_name){
    $push=new XingeApp($accessId,$secretKey);
    $message=new Message();
    $message->setType(Message::TYPE_MESSAGE);


}


function sendNotification($accessId,$secret_key,$sender_name,$receiver_name){
//    global $receiver_name;
//    global $accessId;
//    global $secret_key;
//
    $message=new Message();
    global $room;
    $push=new XingeApp($accessId,$secret_key);
   // echo $accessId;


    $message->setType(Message::TYPE_NOTIFICATION);
    $message->setTitle("PK Invitation");
    $message->setContent($sender_name." sent you a PK invitation");

    $action=new ClickAction();
    $action->setActionType(ClickAction::TYPE_INTENT);
    $intentUri="intent:#Intent;action=PK;S.sender=$sender_name;S.room=$room;end";

    $action->setIntent($intentUri);
 //   $action->setActivity("com.example.mrdreamer.iknow.Social.Friends.PKInvitation");
    $message->setAction($action);
    $ret=$push->PushSingleAccount(0,$receiver_name,$message);
    return $ret;
    //    $style=new Style(0,1,1,0,0);
    //   $action=new ClickAction();
    //  $action->setActionType(ClickAction::TYPE_ACTIVITY);
    //  $action->setActivity("com.example.mrdreamer.")




}

?>
