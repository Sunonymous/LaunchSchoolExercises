'use strict';

// P
//   Given a set of two-sided spelling blocks, as defined below, write a function which takes a single word
//   as a string and returns true or false depending on whether or not the given word may be spelled
//   with the blocks provided.
//   Input  -> String word
//   Output -> Boolean
//   Rules:
//     Blocks may only be used once, meaning that if a letter from one side of a block is used, the letter on
//     the opposing face may not be used. This also prohibits the spelling of words with letters occuring more
//     than a single time.
//     Consider letters as case-insensitive.
//     Unclear whether or not an empty string should return true or false.
//       Regex matching defaulted me to false for this.

// Spelling blocks:
// B:O   X:K   D:Q   C:P   N:A
// G:T   R:E   F:S   J:W   H:U
// V:I   L:Y   Z:M

// D
//   Originally I felt like using a map, though that creates some extra steps to access every letter in a simple way.
//   An array of blocks with both letters together in string elements makes more sense,
//     as this allows us to check for inclusion and add both letters simultaneously.
// A
//   Neutralize the case of the word. We'll use uppercase for this example.
//   Return false if the word contains any non-letters.
//   Split the uppercased word into characters.
//   Create a string to act as a faux 'set' by tracking which letters/blocks have been used.
//   Iterate through the characters of the neutralized word:
//   -> if the character is not present in the set of used blocks, add it and its counterfacing letter to the set.
//      if the character is present in the set of used blocks, return false.
//   After the iteration, return true.
// C

const BLOCKS = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM'];
const onlyLetters = (word) => !!word.match(/^[\w]+$/);
const getBlock = (c) => BLOCKS.filter((block) => block.includes(c))[0] || null;

const isBlockWord = (word) => {
  if (!onlyLetters(word)) return false; // only letters are allowed!

  word = word.toUpperCase();
  const letters = word.split('');
  let usedLetters = '';

  for (let i = 0; i < letters.length; i += 1) {
    if (usedLetters.includes(letters[i])) {
      return false;
    } else {
      usedLetters += getBlock(letters[i]);
    }
  }

  return true;
}

console.log('Test Results');
console.log(isBlockWord('BATCH'));
console.log(!isBlockWord('BUTCH'));
console.log(isBlockWord('jest'));
console.log(isBlockWord('kid'));
console.log(isBlockWord('MAKE'));
console.log(!isBlockWord('MAKER'));
console.log(!isBlockWord('!@#$'));
console.log(!isBlockWord(''));
