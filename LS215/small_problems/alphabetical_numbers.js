"use strict";

// Given an array of numbers between 0 and 19, return a new array sorted by their english equivalents.

const NUMBER_WORDS = {
  0: 'zero',
  1: 'one',
  2: 'two',
  3: 'three',
  4: 'four',
  5: 'five',
  6: 'six',
  7: 'seven',
  8: 'eight',
  9: 'nine',
  10: 'ten',
  11: 'eleven',
  12: 'twelve',
  13: 'thirteen',
  14: 'fourteen',
  15: 'fifteen',
  16: 'sixteen',
  17: 'seventeen',
  18: 'eighteen',
  19: 'nineteen',
};

const sortByNumWord = (num1, num2) => {
  num1 = NUMBER_WORDS[num1];
  num2 = NUMBER_WORDS[num2];
  if (num1 === num2) {
    return 0;
  } else {
    return num1 < num2 ? -1 : 1;
  }
}
// console.log(sortByNumWord(5, 7));

const alphabeticNumberSort = (numbers) => numbers.slice().sort(sortByNumWord);

console.log(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

// seems to work!
// huh, I like their spread version instead of the slice. looks cleaner.

// fe
const feAlphabeticNumberSort = (numbers) => [...numbers].sort((num1, num2) => {
  num1 = NUMBER_WORDS[num1];
  num2 = NUMBER_WORDS[num2];
  if (num1 === num2) {
    return 0;
  } else {
    return num1 < num2 ? -1 : 1;
  }
});

console.log(feAlphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
