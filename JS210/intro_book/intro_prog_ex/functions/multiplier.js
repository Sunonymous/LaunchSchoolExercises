let getNumber = function(prompt) {
  let rlSync = require('readline-sync');
  return Number(rlSync.question(prompt));
}

console.log('Let us multiply two numbers, for the sake of practice.')
let firstNumber = getNumber('Please enter the first number:\n');
let secondNumber = getNumber('Please enter the second number:\n');
let result = firstNumber * secondNumber;
console.log(`The result of the multiplication is ${result}.`);
