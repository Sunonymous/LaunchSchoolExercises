// Converting Strings to Lower Case
//
// Given a string, return its representation after conversion of all its uppercase characters
// to their lowercased equivalents.

// Create an array containing all the uppercase letters.
//   (There was a way to do this via a range function, though I'll do it manually because I forgot how.)
//     (Actually it may not be so difficult. Get the char code of 'A' and map a range from that to 26 more?)
// Create a function to

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function upperCaseAlphabet() {
  return range(26, 'A'.charCodeAt(0)).map(c => String.fromCharCode(c));
}
// way easier than expected!
// console.log(upperCaseAlphabet());

function strToChars(str) {
  return range(str.length, 0).map(c => str[c]);
}
// console.log(strToChars('hey'));

function upperToLower(c) {
  return String.fromCharCode(c.charCodeAt(0) + 32);
}

// quick tests
// console.log(upperToLower('A') === 'a');
// console.log(upperToLower('G') === 'g');
// console.log(upperToLower('X') === 'x');
// successful

function toLowerCase(str) {
  const upperAlph = upperCaseAlphabet();
  return strToChars(str).map(c => upperAlph.includes(c) ? upperToLower(c) : c).join('');
}

console.log(toLowerCase('ALPHABET') === "alphabet");
console.log(toLowerCase('123') === "123");
console.log(toLowerCase('abcDEF') === "abcdef");
