'use strict';

// given a string, return true on whether or not all its characters are uppercase

const filterString   = (string, func) => string.split('').filter(func).join('');
const uppercaseChars = (c) => c === c.toUpperCase();
const isUppercase    = (string) => string.length === filterString(string, uppercaseChars).length;

console.log('Test Results!');
console.log(!isUppercase('t'));
console.log(!!isUppercase('T'));
console.log(!isUppercase('Four Score'));
console.log(!!isUppercase('FOUR SCORE'));
console.log(!!isUppercase('4SCORE!'));
console.log(!!isUppercase(''));
