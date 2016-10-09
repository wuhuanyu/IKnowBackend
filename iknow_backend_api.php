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



    public function getIsLogin($id){
        $result=$this->conn-query("select Login from usertest where id='$id'");
        if($result->num_rows>0){
            $row=$result->fetch_assoc();
            $isLogin=$row["Login"];
            if($isLogin==1)
                return true;
            else return false;
        }
        else return false;
    }
    }



class Question{
    private $content;
    private $ans_a;
    private $ans_b;
    private $ans_c;
    private $ans_d;
    private $right_index;

    public function __construct($co,$a,$b,$c,$d,$r){
    $this->content=$co;
    $this->ans_a=$a;
    $this->ans_b=$b;
    $this->ans_c=$c;
    $this->ans_d=$d;
    $this->right_index=$r;
}

    public function getAns_a(){return $this->ans_a;}
    public function getAns_b(){return $this->ans_b;}
    public function getAns_c(){return $this->ans_c;}
    public function getAns_d(){return $this->ans_d;}
    public function getContent(){return $this->content;}
    public function getRightIndex(){return $this->right_index;}

}
?>
