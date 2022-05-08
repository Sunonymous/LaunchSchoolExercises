'use strict';

// with some bits borrowed from the last episode of rot13

const CHARS_IN_ALPHABET = 26;
const FIRST_UPPERCASE_CHAR = 'A';
const FIRST_LOWERCASE_CHAR = 'a';

const START_INDEXES = {
  upper: FIRST_UPPERCASE_CHAR.charCodeAt(0),
  lower: FIRST_LOWERCASE_CHAR.charCodeAt(0),
}

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function upperCaseAlphabet() {
  return range(CHARS_IN_ALPHABET, START_INDEXES['upper']).map(c => String.fromCharCode(c));
}

function lowerCaseAlphabet() {
  return range(CHARS_IN_ALPHABET, START_INDEXES['lower']).map(c => String.fromCharCode(c));
}

// weird. all that resurrected code was to save me the bit of manual typing out the key

// including a new addition to the ragtag crew!

const zipmap = (col1, col2) => {
  let result = {};
  col1.forEach((key, idx) => {
    const val = col2[idx];
    result[val] = key;
    result[key] = val;
  });
  return result;
}

const key = zipmap(upperCaseAlphabet(), lowerCaseAlphabet());

const mapOverChars = (phrase, func) => phrase.split('').map(func).join('');
const swapCase = (phrase) => {
  return mapOverChars(phrase, (c) => {
    if (!!key[c]) {
      return key[c];
    } else {
      return c;
    }
  });
}

console.log('Test Results');
console.log(swapCase('CamelCase') === "cAMELcASE");
console.log(swapCase('Tonight on XYZ-TV') === "tONIGHT ON xyz-tv");
