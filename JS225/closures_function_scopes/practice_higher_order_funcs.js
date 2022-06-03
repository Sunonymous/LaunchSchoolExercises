'use strict';

const log = (v) => console.log(v);

// 1
// Higher order functions are function which accept a function as a parameter for use, and/or return a function.
// These are generally only possible within programming languages which have functions as first class objects.

// 2
// Only `filter` is higher order because it accepts a function, in this case, `checkEven` as an argument.
// `checkEven` returns the result of a simple calculation and neither requires a function parameter nor returns any function.

// 3
let numbers = [1, 2, 3, 4];
function makeCheckEven() {
  return (em) => em % 2 === 0;
}

let checkEven = makeCheckEven();

log(numbers.filter(checkEven)); // [2, 4]


// 4
const execute = (func, operand) => func(operand);

log(execute(function(number) {
  return number * 2;
}, 10)); // 20

log(execute(function(string) {
  return string.toUpperCase();
}, 'hey there buddy')); // "HEY THERE BUDDY"


// 5
function makeListTransformer(func) {
  return (arr) => arr.map(func);
}

let timesTwo = makeListTransformer(function(number) {
  return number * 2;
});

log(timesTwo([1, 2, 3, 4])); // [2, 4, 6, 8]
