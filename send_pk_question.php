<?php
require_once('push/XingeApp.php');
require_once('iknow_backend_api.php');
require_once('constants.php');


$conn=new mysqli($server,$admin,$dbpasswd,$dbname);
if($conn->connect_error){
    die("Connection failed");
}
$utility=new getInfoUtility($conn);

$room=$_POST["room"];
$player_one=$_POST["player_one"];

$player_two=$_POST["player_two"];

$player_one_id=$utility->getId($player_one);
$player_two_id=$utility->getId($player_two);

if(check($conn,$player_one_id,$player_two_id,$room)){

    $select_str="select * from Question order by Rand() limit 1";
    $result=$conn->query($select_str);
    if($result->num_rows>0){
        $row=$result->fetch_assoc();
        $question=new Question($row["Content"],$row["A"],$row["B"],$row["C"],$row["D"],$row["RightIndex"]);
       // var_dump($question);
      //  echo $accessId;
       // echo $secret_key;
        var_dump(sendQuestionToAndroid($accessId,$secret_key,$player_one,$question));
       // echo "<br>";
        var_dump(sendQuestionToAndroid($accessId,$secret_key,$player_two,$question));

}

}


function sendQuestionToAndroid($accessId,$secretKey,$receiver,$question){

    $push=new XingeApp($accessId,$secretKey);
    $message=new Message();
    $message->setType(Message::TYPE_MESSAGE);
  //  echo "message";
    $message->setTitle("Question");
    $message->setContent("Question");
   // echo $question->getAns_c();

    $custom=array("target_code"=>1,"content"=>$question->getContent(),"ans_a"=>$question->getAns_a(), "ans_b"=>$question->getAns_b(), "ans_c"=>$question->getAns_c(),"ans_d"=>$question->getAns_d(), "right_index"=>$question->getRightIndex());
   // var_dump($custom);

    $message->setCustom($custom);
    $ret=$push->PushSingleAccount(0,$receiver,$message);

    return $ret;


}

function check($conn,$player_one_id,$player_two_id,$room){
    $check_str="select count(*) from GameInvitation where Room='$room' and (Sender=$player_one_id or Sender=$player_two_id) and (Receiver=$player_one_id or Receiver=$player_two_id) and Status=1";
   // echo $check_str;
    $result=$conn->query($check_str);
    if($result->num_rows>0){
        $row=$result->fetch_assoc();
        $count=$row["count(*)"];
        //echo $count;
        if($count==1)
            return true;
        else return false;
}
return false;

}




?>
