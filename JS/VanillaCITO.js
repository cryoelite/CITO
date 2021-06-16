
'use strict';

class A{
    name="yo";
    nn(){
        console.log("ss");
    };
    constructor (value){
        if(value)
            console.log(this.name);
        else
            this.nn();
    }
}
class B extends A{
    name="popo";
    nn(){
        console.log("Yo");
    }
}

new B(1);
new A(1);