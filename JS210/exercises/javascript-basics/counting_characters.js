// Counting the Number of Characters

const rlSync = require('readline-sync');

const phrase = rlSync.question('Please enter a phrase: \n');
console.log(`There are ${phrase.length} total characters in "${phrase}".`);

// further exploration

const isSpace         =         (c) => c !== ' ';
const filterOverChars    = (str, func) => str.split('').filter(func).join('');
const phraseSinSpaces = filterOverChars(phrase, isSpace);

console.log(`There are ${phraseSinSpaces.length} characters in "${phrase}", not counting spaces.`);

const alphabeticRegExp  = /[A-Za-z]/;
const isAlphabetic      = c => c.match(alphabeticRegExp) !== null;
const phraseOnlyLetters = filterOverChars(phrase, isAlphabetic);

console.log(`There are ${phraseOnlyLetters.length} alphabetic characters in "${phrase}".`);
