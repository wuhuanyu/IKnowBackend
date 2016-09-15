

<?php
include 'dbmanage.php';

$info="";
$result_bool=false;


$conn=new mysqli($server,$admin,$password,$dbname);

if($conn->connect_error){
    $info="Cannot connect to db";
}
$username=$_POST["name"];
$password=$_POST["password"];
$todo=$_POST["todo"];

switch($todo){
case "sign_up":
    if(isNameExits($username)){

       // echo "Name exits already";
        $info="Name exits already";
}else{
    //   $insert_str="insert into Use"
    $insert_str="insert into usertest (Name,Password)values(?,?)";
    $stmt=$conn->prepare($insert_str);
    $stmt->bind_param("ss",$username,$password);
    $stmt->execute();
    $stmt->close();

  //  global $info;
   // global $result_bool;
$info= "Account create successfully";
$result_bool=true;


//$array_to_send=array("info"=>$info,"result_bool"=>$result_bool);

//echo json_encode($array_to_send);

}




break;
case "login":
   // echo "into login";
    login($username,$password);
break;
case "logout":
//    if(!isNameExits($name)){
//        $info="Name not exits";
//}
    logout($username,$password);
    break;



}

function logout($name,$password){

    global $conn;
    global $result_bool;
    global $info;
   $search_str="select * from usertest where Name='$name' and Password='$password'";

 //   echo "<br>";
  //  echo $search_str;
    $result=$conn->query($search_str);
  //  echo $result->num_rows;
    if($result->num_rows==0){
        global $info;
        global $result_bool;
       // echo "Password or UserName wrong!";
      //  $result_bool=false;
        $info="Password or UserName wrong";


}
else {
    $update_str="update usertest set Login=0 where Name='$name'";
   // echo $update_str;
    $conn->query($update_str);

    $result_bool=true;
   $info="Logout  Succesfully";
}




}
function login($name,$password){
    global $conn;

    global $info;
    global $result_bool;
    if(!isNameExits($name)){
      //  echo "Name not exits please check your name";


        $info= "Name not exits please check your name";
}
else {
    $search_str="select * from usertest where Name='$name' and Password='$password'";
    $result=$conn->query($search_str);
    if($result->num_rows==0){
          $info=   "Password wrong!";

}
else{
    $search_str="select * from usertest where Name='$name' and Password='$password' and Login=0";
    $result=$conn->query($search_str);
    if($result->num_rows==0){
       $info="You have login somewhere already";
}else{
    $update_str="Update usertest set Login=1 where Name='$name'";
    $conn->query($update_str);
   $info= "Login Successfully";
    $result_bool=true;
}



}
}


}







function isNameExits($name){
    global $conn;
    $search_str="select * from usertest where Name=?";
    $stmt=$conn->prepare($search_str);
    $stmt->bind_param('s',$name);
    $stmt->execute();
    $result=$stmt->get_result();
    if($result->num_rows>0){
        $stmt->close();
      //  echo "Name exits";
        return true;
}
else {
    $stmt->close();
    return false;

}

}
$result_to_send=array();
$array_to_send=array("result_bool"=>$result_bool,"info"=>$info);

array_push($result_to_send,$array_to_send);
echo json_encode(array("result"=>$result_to_send));


$conn->close();


?>
