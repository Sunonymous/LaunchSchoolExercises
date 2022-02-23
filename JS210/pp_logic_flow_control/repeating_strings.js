// Repeating Strings
// this one seems easy enough so we won't include testing

// Given a string and a number of times to repeat it, return a string of the given string multiplied by the given argument.
//   If the number is 0, return an empty string.
//   If the number is 1, return the string unmodified.
//   If the number is not a number, return undefined.

// This is a perfect match for recursion, though I'll need some trackers again.

function repeat(string, times) {
  // edge cases
  if (times === 0) return '';
  if (times < 0)   return undefined;
  if (!Number.isInteger(times)) return undefined;

  let originalString = string;

  function recur(string, times) {
    if (string.length === originalString.length * times) {
      return string;
    } else {
      return recur(string + originalString, times);
    }
  }
  return recur(string, times);
}

console.log(repeat('abc', 1));       // "abc"
console.log(repeat('abc', 2));       // "abcabc"
console.log(repeat('abc', -1));      // undefined
console.log(repeat('abc', 0));       // ""
console.log(repeat('abc', 'a'));     // undefined
console.log(repeat('abc', false));   // undefined
console.log(repeat('abc', null));    // undefined
console.log(repeat('abc', '  '));    // undefined
