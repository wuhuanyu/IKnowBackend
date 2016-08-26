


<?php

include "constants.php";
include "utils.php";
$conn=new mysqli($server,$admin,$dbpasswd,$dbname);
if($conn->connect_error){
    die("Connection failed");
}

$user_name=$_POST["name"];
$user_id=getId($user_name,$conn);

$user_id=1;

$get_record_str="select * from relationshiptest where user_one_id=? or user_two_id=? order by time desc";
$stmt=$conn->prepare($get_record_str);
$stmt->bind_param('ii',$user_id,$user_id);
$stmt->execute();
$result=$stmt->get_result();
$result_1=array();
$result_4=array();
$result_5=array();
$result_6=array();
if($result->num_rows>0){
    while($row=$result->fetch_assoc()){
        //echo $row."<br>";
        if($row["action_id"]!=$user_id){
            if($row["user_one_id"]==$user_id){
                switch($row["status"]){
                case $pending:
                    array_push($result_1,$row["user_two_id"]);
                    break;
                case $accepted:
                    array_push($result_4,$row['user_two_id']);
                    break;
                default:break;
         }

           }else{
               switch($row["status"]){
               case $pending:
                   array_push($result_1,$row["user_one_id"]);
                   break;
               case $accepted:
                   array_push($result_4,$row['user_one_id']);
                   break;
               default:break;
         }
           }
  }


  else{
      if($row["user_one_id"]==$user_id){
          switch($row["status"]){
          case $pending:
              array_push($result_5,$row["user_two_id"]);
              break;
          case $accepted:
              array_push($result_6,$row['user_two_id']);
              break;
          default:break;
         }

  }else{
      switch($row["status"]){
      case $pending:
          array_push($result_5,$row["user_one_id"]);
          break;
      case $accepted:
          array_push($result_6,$row['user_one_id']);
          break;
      default:break;
         }

  }

        }
    }
}


//echo id_array_to_name($result_1);
//print_r(id_array_to_name($result_1));
$result=array();
array_push($result,array(1=>id_array_to_name($result_1)),array(4=>id_array_to_name($result_4)),array(5=>id_array_to_name($result_5)),array(6=>id_array_to_name($result_6)));

echo json_encode(array("result"=>$result));


function id_array_to_name($ids){
    global $conn;
    $name_array=array();
    foreach($ids as $id){
        array_push($name_array,getName($id,$conn));
}
return $name_array;
}


//print_r($result_1);
//echo $result_1->length;

//echo count($result_1);
//echo "<br>";
//
//
//print_r($result_4);
//echo "<br>";
//
//print_r($result_5);
//echo "<br>";
//
//
//print_r($result_6);
//echo "<br>";
//

?>
