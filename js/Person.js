
var john={
    firstName:"John",
    lastName:"Doe",
    age:50

};




var mike=new Object();
mike.firstName="Mike";
mike.lastName="Doe";
mike.age=54;

function person(first,last,age){
    this.firstName=first;
    this.lastName=last;
    this.age=age;

}


person.prototype={
    isYoung:function(){return this.age<25;},

    toString:function(){return "Name"+this.firstName+" "+this.lastName;}
};



console.log(person.prototype);

var kitty=new person("kitty","jackson",34);
console.log(kitty);


var why=Object.create(person.prototype);
why.firstName='why';
why.lastName="wu";
why.age=45;
console.log(why);


console.log(why instanceof person);
//console.log(why);
//
var func1=function(){};
console.log(func1.prototype);

var c=func1.prototype.constructor;
console.log(c===func1);

console.log("-------------------");



function f1(){

};
f1.prototype={

    toString:function(){return "this is first prototype";}
};


var f1_instance1=new f1;
console.log(f1_instance1.toString());
console.log(f1_instance1.constructor);
f1.prototype={

    constructor:f1,
    toString:function(){return "this is second prototype";}
}
var f1_instance2=new f1;

console.log(f1_instance2.toString());
console.log(f1_instance2.constructor);



function student(first,last,age,i){
    person.call(this,first,last,age);
    this.id=i;
}


student.prototype=new person();
delete student.prototype.firstName;
delete student.prototype.lastName;
delete student.prototype.age;

student.prototype.constructor=student;


var stu_mike=new student("mike","wu",14,1);

student.prototype.superclass=person;

console.log(stu_mike.toString());
student.prototype.toString=function(){

    return person.prototype.toString.apply(this)+" id:"+this.id;
}

console.log(stu_mike.toString());


console.log("----------------------------");


functionCounter.counter=0;

function functionCounter(){
  return functionCounter.counter++;
}

console.log(functionCounter());
console.log(functionCounter());

function counter(){
    var n=0;
    return {
        count:function(){return n++;},
        reset:function(){return n=0;}
    };
};


var c=counter();
var d=counter();

console.log(c.count());
console.log(d.reset());
console.log(c.count());


function newCounter(n){
  //  return {
  //      get:function(){return n++;},
  //      set:function(m){
  //          if(m>0)n=m;
  //          else
  //              throw Error("error");
  //      }
  //  }
    return {
        get count(){return n++;},
        set count(m){
            n=m;
        }
    }
}


var newC=newCounter(10);
//console.log(newC.set(100));
//console.log(newC.get());
//
//console.log(newC.)

console.log(newC.count);

newC.count=100;
console.log(newC.count);



var o={
    a:0,
    b:1
};

Object.defineProperty(o,"c",{
    get:function(){return this.a+1;}
});


console.log(o.c);


var arr1=[
    "java",
    "cpp",
    "c#",

];


var newarr1=arr1.map(s=>s.length);
console.log(newarr1);
