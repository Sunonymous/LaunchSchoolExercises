// Sum or Product of Consecutive Integers (that's a mouthful)

const rlSync = require('readline-sync');

// sigh... back to range
function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

const sum     = (n, memo) => n + memo;
const product = (n, memo) => n * memo;

let response = Number(rlSync.question('Please enter an integer greater than 0: '));
const endingInt = response < 1 || isNaN(response) ? 1 : response

response = rlSync.question('Enter "s" to calculate the sum or "p" to calculate the product. ');
if (!['s', 'p'].includes(response)) {
  console.log('Invalid entry. Defaulting to sum.');
  response = 's';
}

const func = response === 's' ? sum : product;
const names = {
  s: 'sum',
  p: 'product',
}

const integers = range(endingInt, 1);
const result = integers.reduce(func);
console.log(`The ${names[response]} of the integers from 1 to ${endingInt} is ${result}.`)

// further exploration
// i used reduce in my original response
