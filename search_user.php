<?php

include 'constants.php';
$name=$_POST["name"];
//$name="mike";
$conn=new mysqli($server,$admin,$dbpasswd,$dbname);
if($conn->connect_error){
    die("DBConnection failed");

}



$pattern=array();
$pattern[]="%".$name."%";
$pattern[]=$name;
$pattern[]=$name."%";
$pattern[]="%%".$name."%%";
$pattern[]="%".$name;

$search_str="select Name,Login from usertest where Name like ? order by(case when Name=? then 0
    when Name like ? then 1
    when Name like ? then 2
    when Name like ? then 3
else 4
end),Name";


$stmt=$conn->prepare($search_str);
$stmt->bind_param("sssss",$pattern[0],$pattern[1],$pattern[2],$pattern[3],$pattern[4]);
$stmt->execute();
$result=$stmt->get_result();
$user=array();
if($result->num_rows>0){
    while($row=$result->fetch_assoc()){
       // echo  $row["Name"]."<br>";
        array_push($user,array("name"=>$row["Name"],"login"=>$row["Login"]));
}
}
else echo "No record";


echo json_encode(array("data"=>$user));

$stmt->close();
$conn->close();






?>
