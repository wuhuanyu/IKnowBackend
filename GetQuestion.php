<?php
//DEFINE($SERVER,"localhost");
//DEFINE($ADMIN,"why");
//DEFINE($PASSWORD,"why90951213");
//DEFINE($DB_NAME,"test");
//
$SERVER="localhost";
$ADMIN="why";
$PASSWORD="why90951213";
$DB_NAME="test";
$conn=new mysqli($SERVER,$ADMIN,$PASSWORD,$DB_NAME);
if($conn->connect_error){
    die("Connection Failed".$conn->connect_error);

}

$select_str="select * from Question";
$result=$conn->query($select_str);
$rows=$result->num_rows;


$row_to_select=rand(1,$rows);

$select_str="select * from Question where Id=?";
$stmt=$conn->prepare($select_str);

$stmt->bind_param("i",$row_to_select);
$stmt->execute();


$result=$stmt->get_result();
$question=array();
while($row=$result->fetch_assoc()){


    $content=$row["Content"];
    $ans_a=$row["A"];
    $ans_b=$row["B"];
    $ans_c=$row["C"];
    $ans_d=$row["D"];
    $right_index=$row["RightIndex"];
    array_push($question,array("content"=>$content,
        "ans_a"=>$ans_a,
        "ans_b"=>$ans_b,
        "ans_c"=>$ans_c,
        "ans_d"=>$ans_d,
        "right_index"=>$right_index));

}
//echo $question;
//print_r($question);

//echo "<br>";
echo json_encode(array("question"=>$question));

//echo "<br>";
//echo array("question"=>$question);
//$conn->close();


$conn->close();



?>
