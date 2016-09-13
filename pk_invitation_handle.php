<?php
require_once('constants.php');
require_once('iknow_backend_api.php');
require_once('push/XingeApp.php');

$room=$_POST["room"];
$reactor=$_POST["reactor"];

$accept_or_not=$_POST["accepted_or_not"];


$conn=new mysqli($server,$admin,$dbpasswd,$dbname);
if($conn->connect_error){
    die("Connection failed");
}
$utility=new getInfoUtility($conn);
$reactor_id=$utility->getId($reactor);
switch($accept_or_not){
case 1:
    acceptInvitation($conn,$reactor_id);
    break;
case 2:
    declineInvitation($conn,$reactor_id);
    break;
}



function acceptInvitation($conn,$reactor_id,$room){
    global $accessId;
    global $secret_key;
    $sender_name=getSenderName($conn,$reactor_id,$room);
    $accept_str="update GameInvitation set Status=1,ActionId=$reactor_id where Receiver=$reactor_id and Room='$room'";
    $conn->query($accept_str);
    if($conn->affected_rows>0){
        var_dump(sendMesssage($accessId,$secret_key,1,$sender_name));
}
}

function declineInvitation(){
    global $accessId;
    global $secret_key;
    $sender_name=getSenderName($conn,$reactor_id,$room);
    $accept_str="update GameInvitation set Status=2,ActionId=$reactor_id where Receiver=$reactor_id and Room='$room'";
    $conn->query($accept_str);
    if($conn->affected_rows>0){
        var_dump(sendMesssage($accessId,$secret_key,2,$sender_name));
}
}
function getSenderName($conn,$reactor_id,$room){
    $utility=new getInfoUtility($conn);
    $search_str="select Sender from GameInvitation where Receiver=$reactor_id and Room='$room'";

    $result=$conn->query($search_str);
    if($result->num_rows>0){
        while($row=$result->fetch_assoc()){
            $sender_id=$row["Sender"];
}
}
$sender_name=$utility->getName($sender_id);
return $sender_name;
}


function sendMesssage($accessId,$secretKey,$accept_or_not,$reactor,$sender_name){
// global $room;
    $push=new XingeApp($accessId,$secretKey);
    $message=new Message();
    $message->setType(Message::TYPE_MESSAGE);
    if($accept_or_not==1){
        $content=" accepted your invitation";
}
else{
    $content=" declined your invitation";
}
    $message->setTitle("PK Invitation");
    $message->setContent($reactor.$content);
    $custom=array("result_code"=>$result_code,"room"=>$room,"sender"=>$sender_name);
    $message->setCustom($custom);
    $ret=$push->PushSingleAccount(0,$receiver_name,$message);
    return $ret;

}
?>
