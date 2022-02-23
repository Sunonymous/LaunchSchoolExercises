// wish it wasn't so annoying to get input in js

const rlSync = require('readline-sync');

firstInt = Number(rlSync.question('Please provide me the first integer.\n'));
secondInt = Number(rlSync.question('Please provide me the second integer.\n'));

console.log(`${firstInt} + ${secondInt} = ${firstInt + secondInt}`);
console.log(`${firstInt} - ${secondInt} = ${firstInt - secondInt}`);
console.log(`${firstInt} * ${secondInt} = ${firstInt * secondInt}`);
console.log(`${firstInt} / ${secondInt} = ${firstInt / secondInt}`);
console.log(`${firstInt} % ${secondInt} = ${firstInt % secondInt}`);
console.log(`${firstInt} ** ${secondInt} = ${firstInt ** secondInt}`);
