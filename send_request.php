<?php
/****
 *  no recoreds:1 insert successufully
 *
 *  has recored
 *
 * **/
include "constants.php";
$result_code=-1;

$user_one_name=$_POST["user_one_name"];
$user_two_name=$_POST["user_two_name"];
$action_name=$user_one_name;

if($user_one_name==$user_two_name){

    die("two name the same");
}
$conn=new mysqli($server,$admin,$dbpasswd,$dbname);
if($conn->connect_error){
    die("Connection failed");
}

/******getId ***/
function getId($name){
    global $conn;
    $result=$conn->query("select id from usertest where Name='$name'");
    if($result->num_rows>0){
        $row=$result->fetch_assoc();
        $id=$row["id"];
}
return $id;
}

$user_one_id=getId($user_one_name,$conn);
$user_two_id=getId($user_two_name,$conn);
$action_id=$user_one_id;
if($user_one_id>$user_two_id){
  //  echo "into exchange";
    $tmp=$user_one_id;
    $user_one_id=$user_two_id;
    $user_two_id=$tmp;
    }
$check_str="select * from relationshiptest where user_one_id=? and user_two_id=?";

$stmt=$conn->prepare($check_str);
$stmt->bind_param("ii",$user_one_id,$user_two_id);
$stmt->execute();
$result=$stmt->get_result();
//$result=$conn->query($check_str);
if($result->num_rows>0){
    $row=$result->fetch_assoc();
    $status=$row["status"];
    //  echo "status:  "+$status;
    $action_id_recoreded=$row["action_id"];
 //   echo "action_id_recorded:".$action_id_recoreded;
  //  echo "<br>";
   // echo $row["action_id"];
    if($action_id_recoreded==$action_id){
        switch($status){
        case $pending:
            //            echo "already pending";
          //  echo 2;
            $result_code=2;
            break;
        case $blocked:
           // echo 3;
            $result_code=3;
            updateToPending($user_one_id,$user_two_id,$action_id);
            break;
        case $accepted:
//            echo 4;

            $result_code=4;
            break;
        case $declined:
            $result_code=5;
            updateToPending($user_one_id,$user_two_id,$action_id);
            break;
}
}else{
    switch($status){
    case $pending:
       $result_code=6;
        updateToAccepted($user_one_id,$user_two_id,$action_id);
        break;
    case $blocked:
       $result_code=7;
        break;
    case $accepted:
        $result_code=8;
        break;
    case $declined:
        $result_code=9;
        updateToPending($user_one_id,$user_two_id,$action_id);
        break;

}
}

}
else{
    $insert_str="insert into relationshiptest(user_one_id,user_two_id,status,action_id)values($user_one_id,$user_two_id,0,$action_id)";
    $conn->query($insert_str);
    if($conn->affected_rows>0){
        echo "successufully";

}
}

function updateToPending($user_one_id,$user_two_id,$action_id){
    global $conn;
    global $pending;
    $update_str="update relationshiptest set status=?,action_id=? where user_one_id=? and user_two_id=?";
    $stmt=$conn->prepare($update_str);
    $stmt->bind_param("iiii",$pending,$action_id,$user_one_id,$user_two_id);
    $stmt->execute();
   }



function updateToAccepted($user_one_id,$user_two_id,$action_id){
    global $conn;
    // global $pending;
    global $accepted;
    echo $user_one_id;
    echo $user_two_id;
    echo $action_id;
  //  echo
    $update_str="update relationshiptest set status=?,action_id=? where user_one_id=? and user_two_id=?";
    $stmt=$conn->prepare($update_str);
    $stmt->bind_param("iiii",$accepted,$action_id,$user_one_id,$user_two_id);
    $stmt->execute();

}

$conn->close();
echo json_encode(array("result_code"=>$result_code));

?>
