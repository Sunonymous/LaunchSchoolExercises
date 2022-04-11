"use strict";

// Given a string of words, return an acronym of the words.

const hyphensToSpaces  = (string) => string.replace(/\-/g, ' ');
const onlyLetters      = (string) => string.replace(/[^a-z ]/gi, '');
const adjustChars      = (string) => onlyLetters(hyphensToSpaces(string));
const upperFirstChar   = (string) => string.toUpperCase()[0];

const acronym = (string) => adjustChars(string).split(' ').map(upperFirstChar).join('');

console.log(acronym('Portable Network Graphics'));                  // "PNG"
console.log(acronym('First In, First Out'));                        // "FIFO"
console.log(acronym('PHP: HyperText Preprocessor'));                // "PHP"
console.log(acronym('Complementary metal-oxide semiconductor'));    // "CMOS"
console.log(acronym('Hyper-text Markup Language'));                 // "HTML"
