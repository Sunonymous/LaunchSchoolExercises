// Copy Part One

// myArray is declared as an array
// myOtherArray is declared as a constant copy of myArray
// myArray is mutated, removing 4 at the end
// myOtherArray is still attached to myArray, and should log [1, 2, 3]
// myArray is reassigned while myOtherArray is still attached to the original array
// myOtherArray should still log [1, 2, 3]
//
// results:
// got it!


// Copy Part Two
let myArray = [1, 2, 3, 4];
// could be copied with
// const myOtherArray = myArray.slice();

// or--
const myOtherArray = myArray.concat();
myArray.pop();
console.log(myOtherArray);
// (thanks MDN!)
