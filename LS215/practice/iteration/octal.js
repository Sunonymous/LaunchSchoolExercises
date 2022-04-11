"use strict";

// let's break down some logic first
// we can use reduce to accumulate a total
// since reduce also gets passed the index, we can take advantage of that to get the power of 8
//   though we will need to reverse the string first

// what??? no built-in string reverse function????? JavaScript, why??
const reverseString = (str) => str.split('').reverse().join('');

const octalToDecimal = (octStr) => {
  octStr = reverseString(octStr);
  return octStr.split('').map(Number).reduce((total, currentDigit, index) => total + (8**index * currentDigit));
}

octalToDecimal('10');
console.log('Tests!');
console.log(octalToDecimal('1') === 1);
console.log(octalToDecimal('10') === 8);
console.log(octalToDecimal('130') === 88);
console.log(octalToDecimal('17') === 15);
console.log(octalToDecimal('2047') === 1063);
console.log(octalToDecimal('011') === 9);

// that was actually a lot easier than I expected
