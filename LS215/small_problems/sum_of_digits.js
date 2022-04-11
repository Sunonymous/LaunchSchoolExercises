"use strict";

// Given a positive integer, return the sum of its digits using higher-level abstractions.

const add = (a, b) => a + b;

const sum = (int) => String(int).split('').map(Number).reduce(add);

// Tests
console.log('Test Results:');
console.log(sum(23) === 5);
console.log(sum(496) === 19);
console.log(sum(123456789) === 45);
