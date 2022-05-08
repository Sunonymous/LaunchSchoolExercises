'use strict';

// given a string, capitalize all its words exclusively by their first character

const capitalize = (str) => {
  if (!str) {
    return ''
  } else if (str.length === 1) {
    return str.toUpperCase();
  } else {
    return str[0].toUpperCase() + str.substring(1).toLowerCase();
  }
}

const mapOverWords = (sentence, func) => sentence.split(/\s/).map(func).join(' ');

const wordCap = (phrase) => mapOverWords(phrase, capitalize);

console.log('Test Results:');
console.log(wordCap('four score and seven') === "Four Score And Seven");
console.log(wordCap('the javaScript language') === "The Javascript Language");
console.log(wordCap('this is a "quoted" word') === 'This Is A "quoted" Word');
