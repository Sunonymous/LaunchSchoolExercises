"use strict";

const range = (len, from) => [...Array(len).keys()].map(n => n + from);

const leadingSubstrings = (string) => range(string.length, 1).map((idx) => string.slice(0, idx));

const allSubstrings = (string) => range(string.length, 0).map((idx) => leadingSubstrings(string.slice(idx))).flat();

console.log(allSubstrings('abcde'));

// returns
[ "a", "ab", "abc", "abcd", "abcde",
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e" ]
