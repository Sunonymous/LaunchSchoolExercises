"use strict";

//

const range             = (len, from) => [...Array(len).keys()].map(n => n + from);

const leadingSubstrings = (string)    => range(string.length, 1).map((idx) => string.slice(0, idx));
const allSubstrings     = (string)    => range(string.length, 0).map((idx) => leadingSubstrings(string.slice(idx))).flat();

const reverseString     = (string)    => string.split('').reverse().join('');
const sameReversed      = (string)    => string === reverseString(string);
const validPalindrome   = (string)    => (string.length > 1 && sameReversed(string));

const palindromes       = (string)    => allSubstrings(string).filter(validPalindrome);

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
[ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// returns
[ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]
