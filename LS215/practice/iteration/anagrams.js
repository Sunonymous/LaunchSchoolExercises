"use strict";

const DEBUG = false;

// okay, so matching for anagrams of a given word
// easiest check is for length first

// ugh, gotta rewrite that array equality function

const arraysEqual = (array1, array2) => {
  if (array1.length !== array2.length) return false;
  for (let i = 0; i < array1.length; i += 1) {
    if (array1[i] !== array2[i]) return false;
  }

  return true;
}
// tests
if (DEBUG) {
  console.log(!arraysEqual([1, 2, 3], [1, 2]));
  console.log(!!arraysEqual([1, 2, 3], [1, 2, 3]));
  console.log(!arraysEqual([1, 3, 2], [1, 2, 3]));
}

const anagram = (query, words) => {
  return words.filter((word) => {
    const queryChars = query.split('').sort();
    return word.length === query.length && arraysEqual(queryChars, word.split('').sort());
  })
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]
