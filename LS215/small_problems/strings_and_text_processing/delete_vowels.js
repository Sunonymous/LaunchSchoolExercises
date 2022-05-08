'use strict';

// given an array of strings return an array of the same strings without their vowels

const isNotVowel      = (string) => string.match(/[^AEIOUaeiou]/);
const filterString = (string, func) => string.split('').filter(func).join('');
const removeVowels = (strings) => strings.map((str) => filterString(str, isNotVowel));

console.log(removeVowels(['abcdefghijklmnopqrstuvwxyz']));         // ["bcdfghjklmnpqrstvwxyz"]
console.log(removeVowels(['green', 'YELLOW', 'black', 'white']));  // ["grn", "YLLW", "blck", "wht"]
console.log(removeVowels(['ABC', 'AEIOU', 'XYZ']));                // ["BC", "", "XYZ"]
