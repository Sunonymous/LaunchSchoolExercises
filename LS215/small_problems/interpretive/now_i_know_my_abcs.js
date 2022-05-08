'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  -- Given a set of two-sided spelling blocks (as defined below), write a function which takes a single word
  -- as a string and returns true or false depending on whether or not the given word may be spelled
  -- with the blocks provided.
  IO~
  -- Input  -> String word
  -- Output -> Boolean denoting possibility of spelling the word
  -- Edges  -> non-word input, non-string input
  Rules~
  -- Spelling blocks:
  -- B:O   X:K   D:Q   C:P   N:A
  -- G:T   R:E   F:S   J:W   H:U
  -- V:I   L:Y   Z:M
  -- Blocks may only be used once, meaning that if a letter from one side of a block is used, the letter on
  -- the opposing face may not be used. This also prohibits the spelling of words with letters occuring more
  -- than a single time.
  -- Consider letters as case-insensitive.
  Notes~
  --
Examples-->
  -- Template
  -- Tests for
    -- <test>
  -- Tests for Improper Input
    -- isBlockWord('') => false
    -- isBlockWord('$#@$@') => false
  -- Tests for Normal Functioning
    -- isBlockWord('BATCH')
    -- isBlockWord('BUTCH')
    -- isBlockWord('jest') // case insensitivity
    -- isBlockWord('kid')
    -- isBlockWord('MAKE')
    -- isBlockWord('MAKER')
Data Structure-->
  -- An array of blocks with both letters together in string elements makes more sense,
  --  as this allows us to check for inclusion and add both letters simultaneously.
Algorithm-->
  -- Neutralize the case of the word. We'll use uppercase for this example.
  -- Return false if the word contains any non-letters.
  -- Split the uppercased word into characters.
  -- Create a string to act as a faux 'set' by tracking which letters/blocks have been used.
  -- Iterate through the characters of the neutralized word:
  -- -> if the character is not present in the set of used blocks, add it and its counterfacing letter to the set.
  --    if the character is present in the set of used blocks, return false.
  -- After the iteration, return true.
Functions-->
  -- [✓] range(len, from)
  ---- Generates range of `len` integers starting with `from` and incrementing by one.
  -- [✓] onlyLetters(word)
  ---- Returns true if given a string of a single word without any non-alphabetic chars.
  -- [✓] getBlock(c)
  ---- Given a character `x`, return the combination of letters on the block containing the given letter.

*/

const BLOCKS = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM'];

// Helpers
const range = (len, from) => [...Array(len).keys()].map((n) => n + from);
const onlyLetters = (word) => !!word.match(/^[\w]+$/);
const getBlock = (c) => BLOCKS.filter((block) => block.includes(c))[0] || null;

// Edges
const edgeCheck = (word) => {
  if (typeof word !== 'string' || !onlyLetters(word)) return false;
  return null;
};

// Primary
function isBlockWord(word) {
  const isEdge = edgeCheck(word);
  if (isEdge !== null) return isEdge;

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

t.addTest(isBlockWord, false, '');
t.addTest(isBlockWord, false, '#$#%&%&');
t.addTest(isBlockWord, true, 'BATCH');
t.addTest(isBlockWord, false, 'BUTCH');
t.addTest(isBlockWord, true, 'jest');
t.addTest(isBlockWord, true, 'kid');
t.addTest(isBlockWord, true, 'MAKE');
t.addTest(isBlockWord, false, 'MAKER');
t.addTest(isBlockWord, true, 'fLoW');
t.addTest(isBlockWord, false, 'Apple');
t.addTest(isBlockWord, false, 'box');

t.runSuite();
