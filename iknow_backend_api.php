<?php
require_once('constants.php');

$accessId=2100218678;
$secret_key=-1;
class DBHelper{
    private $server;
    private $admin;
    private $dbpasswd;
    private $dbname;

    //  function __construct($server_,$admin_,$dbpasswd_,$dbname_){


    //       $this->server=$server_;
    //       $this->admin=$admin_;
    //       $this->
    //  }
}


class getInfoUtility{
    private  $conn;
    function __construct($conn_){
        $this->conn=$conn_;
    }

    public  function getName($id){
        $stmt=$this->conn->prepare("select getName(?) as Name");
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
    public  function getId($name){
        $result=$this->conn->query("select id from usertest where Name='$name'");
        if($result->num_rows>0){
            $row=$result->fetch_assoc();
            $id=$row["id"];
        }
        return $id;
    }
    }



?>
