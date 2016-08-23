<?php

include 'constants.php';
$username=$_POST["name"];
$password=$POST["password"];
function getName($id){
    global $stmt;
    $stmt->bind_param("i",$id);
    $stmt->execute();
    $result=$stmt->get_result();
    if($result->num_rows>0){
        $row=$result->fetch_assoc();
        $name=$row["name"];

}else echo "no name ".$id;
//echo $name;
return $name;

};


function getIsLogin($id){
    global $get_islogin_stmt;

    $get_islogin_stmt->bind_param("i",$id);
    $get_islogin_stmt->execute();
    $result=$get_islogin_stmt->get_result();
    if($result->num_rows>0){
        $row=$result->fetch_assoc();
        $login=$row["Login"];
}else echo "no";
return $login;
 //return 1;
};


$conn=new mysqli($server,$admin,$dbpasswd,$dbname);
if($conn->connect_error){
    die("Connection failed");
}

$getId_str="select getId(?) as id limit 1";
$stmt=$conn->prepare($getId_str);

$stmt->bind_param("s",$username);
$stmt->execute();
$result=$stmt->get_result();
$stmt->close();

if($result->num_rows>0){
    $row=$result->fetch_assoc();
    $userId=$row["id"];

}


$getFriendId_str="select user_one_id,user_two_id  from relationshiptest where (user_one_id=? or user_two_id=?) and status=1 ";

$stmt=$conn->prepare($getFriendId_str);
$stmt->bind_param("ii",$userId,$userId);
$stmt->execute();

$friend_id_list=array();

$result=$stmt->get_result();

if($result->num_rows>0){
    while($row=$result->fetch_assoc()){
        $user_one_id=$row["user_one_id"];
       // echo $user_one_id;
        if($user_one_id==$userId){
            $friend_id=$row["user_two_id"];
}else $friend_id=$user_one_id;
$friend_id_list[]=$friend_id;

}
}else echo "No friends";

$stmt->close();

$stmt=$conn->prepare("select getName(?) as name");
$get_islogin_stmt=$conn->prepare("select Login from usertest where Id=?");
$friend_list=array();
foreach($friend_id_list as $id){
    $friend_list[]=array("name"=>getName($id),"login"=>getIsLogin($id));
}



$stmt->close();
$get_islogin_stmt->close();
$conn->close();


echo json_encode(array("data"=>$friend_list));





?>
