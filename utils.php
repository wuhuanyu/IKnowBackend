<?php
function getName($id,$conn){
    $stmt=$conn->prepare("select getName(?) as Name");
    $stmt->bind_param('i',$id);
    $stmt->execute();
    $result=$stmt->get_result();
    if($result->num_rows>0){
        $row=$result->fetch_assoc();
        $name=$row["Name"];
    }
    $stmt->close();
    return $name;
}

function getId($name,$conn){
    $stmt=$conn->prepare("select getId(?) as Id");
    $stmt->bind_param('s',$name);
    $stmt->execute();
    $result=$stmt->get_result();
    if($result->num_rows>0){
       $row=$result->fetch_assoc();
       $id=$row['Id'];
    }
    $stmt->close();
    return $id;
}




?>
