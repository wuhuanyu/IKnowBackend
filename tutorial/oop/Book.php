<?php

interface NameInterface{
    function getName();
}

interface PriceInterface{
    function getPrice();
}


class Book implements NameInterface{
    private $name;
    public function __construct($n){
$this->name=$n;

}

function getName(){
    return $this->name;
}

function __toString(){
    return $this->name."book";
}


}

$interfaces=class_implements('Book');
if(isset($interfaces["NameInterface"])){
    echo "Book implements NameInterface";
}

abstract class EducationEquipment implements NameInterface{
    abstract public function getName();
}
//print new Book('Java');

class Projector extends EducationEquipment{
    public function getName(){
        return "Projector";
    }
}
$projector=new Projector;
echo $projector->getName();

$java=new Book("java");

$effective_java=clone $java;
echo $effective_java->getName();



echo "<br>";
echo $java->getName();

?>
