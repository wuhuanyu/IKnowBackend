<?php
$server="localhost";
$admin="why";
$dbpasswd="why90951213";

$table="User";

$dbname="phpdata";


/*********
 *Reationship state code
 *
 *
 *
 *
 * **/
$pending=0;
$accepted=1;
$declined=2;
$blocked=3;





function getConnection(){
    $conn=mysqli($server,$admin,$dbpasswd,$dbname);
    return $conn;
}


//
//function getUserId($username,$conn){
//    $search_id="select Id from '$table' where Name=?";
//    $stmt=$conn->prepare($search_id);
//    $stmt->bind_param('s',$username);
//    $stmt->execute();
//
//    $result=$stmt->get_result();
//    if($result->num_rows>0){
//        while($row=$result->fetch_assoc()){
//            $id=$row["Id"];
//}
//}
//$stmt->close();
//return $id;
//
//
//
//}


?>
