"use strict";

// Given an array of numbers, return an accumulation of the series of sums with each additional number included.

// I had to reverse the array before using this strategy because it was removing
// items from the beginning rather than the end on each iteration.

const range = (len, from) => [...Array(len).keys()].map(n => n + from);
const sum   = (a, b) => a + b;

function sumOfSums(numArray) {
  let total = 0;
  numArray.forEach((n, idx, arr) => {
    const toAdd = [...numArray].reverse().slice(idx);
    total += toAdd.reduce(sum);
  });
  return total;
}

console.log('Test Results');
console.log(sumOfSums([3, 5, 2]) === 21);
console.log(sumOfSums([1, 5, 7, 3]) === 36);
console.log(sumOfSums([4]) === 4);
console.log(sumOfSums([1, 2, 3, 4, 5]) === 35);

// wow, the ls solution is very beautiful! I'd like to rewrite that.

function summerOfSummest(numbers) {
  return numbers.map((n, idx) => numbers.slice(0, idx + 1).reduce((a, b) => a + b))
                .reduce((a, b) => a + b);
}

console.log('Round 2 Results');
console.log(summerOfSummest([3, 5, 2]) === 21);
console.log(summerOfSummest([1, 5, 7, 3]) === 36);
console.log(summerOfSummest([4]) === 4);
console.log(summerOfSummest([1, 2, 3, 4, 5]) === 35);
