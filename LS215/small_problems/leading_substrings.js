"use strict";

// Given a string, return an array of all its sequential substrings.

const range = (len, from) => [...Array(len).keys()].map(n => n + from);

const leadingSubstrings = (string) => range(string.length, 1).map((idx) => string.slice(0, idx));

console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]

// completely unrelated to this exercise, i decided to write my own recursive range function
// because i didn't fully understand the one i borrowed from SO

function recursiveRange(len, from, step=1) {
  if (len < 0) return []; // no sense in not
  let result = [from];

  function recurse(numbers) {
    if (numbers.length === len) {
      return numbers;
    } else {
      let last_item = numbers[numbers.length - 1];
      let next_item = last_item + step
      numbers.push(next_item);
      return recurse(numbers);
    }
  }

  return recurse(result);
}

console.log(recursiveRange(2, 0));
