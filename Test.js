//A "Tag" function returns a custom string literal.
//In this example, greet calls timeGreet() to append Good //Morning/Afternoon/Evening depending on the time of the day.

function greet(hardCodedPartsArray, ...replacementPartsArray) {
    console.log(hardCodedPartsArray); //[ 'Hello ', '!' ]
    console.log(replacementPartsArray); //[ 'Raja' ]
       
   let str = '';
    hardCodedPartsArray.forEach((string, i) => {
     if (i < replacementPartsArray.length) {
      str += `${string} ${replacementPartsArray[i] || ''}`;
      
     } else {
      str += `${string} ${timeGreet()}`; //<-- append Good morning/afternoon/evening here
     }
    });
    return str;
   }
   
   //?Usage:
   const firstName = 'Raja';
   const greetings = greet`Hello ${firstName}!`; //??<-- Tagged literal
   
   console.log(greetings); //'Hello  Raja! Good Morning!' ?
   
   function timeGreet() {
    const hr = new Date().getHours();
    return hr < 12
     ? 'Good Morning!'
     : hr < 18 ? 'Good Afternoon!' : 'Good Evening!';
   }