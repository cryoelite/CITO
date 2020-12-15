const foo= () => console.log("foo");

const bar= () => console.log("bar");

function coll () {
    setTimeout(foo,0);
    bar();

}

process.nextTick(()=>console.log("tick"));

coll();