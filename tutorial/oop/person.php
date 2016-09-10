<?php

trait logger{
    public function log($log_string){
        $classs_name=__CLASS__;
        echo $class_name." ".$log_string."<br>";
}
}
class Person{
    use logger;
    const DESCRIPTION="this it person class";
    private $name="";

    public function getName()
    {
        return $this->name;
    }
    public function setName($name_parm){

        $this->name=$name_parm;
    }
    public function __construct($name_parm){
     $this->log("person");
        $this->name=$name_parm;
    }
    public function __destruct(){
//echo "function __destruct";
    }
}

class Student extends Person implements comparable{
    static $count=0;
    private  $id=0;
    public function __construct($name_parm){
        parent::__construct($name_parm);
        $this->id=self::$count++;
    }
    public function getId(){
        return $this->id;
    }
    public function __destruct(){
parent::__destruct();
    }

    function compareTo($another){

    }
}


interface comparable{
    function  compareTo($another);
}
$superClasses=get_parent_class(Student);
print_r($superClasses);
//$mike=new Person('mike');
//echo $mike->getName();
//
//echo Person::DESCRIPTION;
//$kitty=new Student('kitty');
//
//echo "<br>";
//echo $kitty->getId();
//$hellen=new Student('hellen');
//echo $hellen->getId();
//
?>
