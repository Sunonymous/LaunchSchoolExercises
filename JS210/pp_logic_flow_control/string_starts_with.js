// String Starts With

// Given a string to search and a substring, return true or false based on whether
// or not the first string begins with the second.

// Because this is so similar to the substring problem from before (actually simpler),
// I am going to reuse those functions.

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function substring(str, start, length = -1) {
  if (str === '') {
    return '';
  } else if (start + length > str.length || length <= -1) { // slightly modified this for errors that won't happen in controlled environments. psh.
    length = str.length - start;
  }
  const stringIndexes = range(length, start);
  const stringCharacters = stringIndexes.map(c => str[c]);
  return stringCharacters.join('');
}

// This problem is very simple with the use of the substring function I wrote.
// Create an array of indexes from 0 to the length of the substring minus one,
//   and return true or false based on whether or not that index range matches
//   in both strings, when mapped to their respective characters and joined.
// Actually, even that is overcomplicated. Just return whether or not the substrings
//   match.

function startsWith(dataString, queryString) {
  if (queryString === '') {
    return true;
  } else if (dataString.length < queryString.length) {
    return false;
  } else {
    return substring(dataString, 0, queryString.length) === queryString;
  }
}

let str = 'We put comprehension and mastery above all else';
console.log(startsWith(str, 'We')) === true;              // true
console.log(startsWith(str, 'We put')) === true;          // true
console.log(startsWith(str, '')) === true;                // true (as weird edge case that doesn't make sense to me)
console.log(startsWith(str, 'put')) === false;             // false

let longerString = 'We put comprehension and mastery above all else!';
console.log(startsWith(str, longerString)) === false;      // false
