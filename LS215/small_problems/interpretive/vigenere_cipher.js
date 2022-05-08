'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  -- Given a string, `msg`, and a string, `key` return an encrypted version of the message
  -- using the vigenere cipher.
  IO~
  -- Input  -> String `msg`, message to encrypt
  -- Output -> String `result`, encrypted message
  -- Edges  -> Because any character may be processed, the only real edge is if a non-string is given.
               This may be addressed by casting the `msg` to string.
               To save time, we could check if the key string is only a's.
               Or, actually, the key string could contain no alphabetic characters.
  Rules~
  -- The Vigenere Cipher is a variation of the Caesar Cipher. It uses a different key to shift
  -- its character based on the position of the alphabet of the next character in the key sequence.
  -- Order of characters and character case are preserved.
  -- Non-alphabetic characters are not altered.
  -- If the key is shorter than the length of the message, the key is repeated until it reaches the length of `msg`
  Questions~
  --
  Notes~
  -- The description implies that the character 'A' in the keyword does not shift the char in the plaintext.
Examples-->
  -- Tests for Improper Input
    -- vignereEncrypt('', 'any') => ''
    -- vignereDecrypt('', 'any') => ''
    -- vignereEncrypt('!@#$%', 'any') => '!@#$%'
    -- vignereDecrypt('!@#$%', 'any') => '!@#$%'
    -- vignereEncrypt(9, 'any') => '9'
    -- vignereDecrypt(9, 'any') => '9'
    -- vignereEncrypt(null, 'b') => 'null'
    -- vignereDecrypt(null, 'b') => 'mvkk'
  -- Tests for Normal Operation
    -- vignereEncrypt('Take me home!', 'plz') => 'Iljt lt gdxd!'
    -- vignereDecrypt('Iljt lt gdxd!', 'plz') => 'Take me home!'
    -- vignereEncrypt('no change', 'A') => 'no change'
    -- vignereDecrypt('no change', 'A') => 'no change'
    -- vignereEncrypt('ducklING', 'ugly') => 'xaniOYE'
    -- vignereDecrypt('xaniOYE', 'ugly') => 'duckling'
Data Structure-->
  -- Arrays for indexing of character codes, as used in the previous exercise.
Algorithm-->
-- Strip the key string of any non-letters.
-- All we're doing is a modified version of the last exercise.
-- Instead of shifting the characters with the same index each time,
---- it will be programmatically calculated based on the index of the keyword.
-- My original thought was to multiply the key string to match the length of the msg string.
---- This may not be necessary. Couldn't we just mod-wrap over that one just like the alphabet?
-- The functions that will be needed are GET_ALPHABET_INDEX of the current character.
---- Note that this also needs to return 0 if the character is not a letter.
-- So we'll map over the characters, each time using a new cipher function with the shift
---- amount of the alphabetic position of the character, or 0.
Functions-->
  -- [✓] Signature
  ---- Description
  -- [✓] GET_ALPHABET_INDEX(c)
  ---- Given a character `c`, neutralize case and return its index in the alphabet from 0 to 25.
  -- [✓] WRAPPED_INDEX(loop, idx)
  ---- Given an array or string, return the character at idx. Idx may be higher or lower than the length of loop.
  ---- Should only be given a positive index! Not using a full modulo operation.
*/

// Helpers
const range = (len, from) => [...Array(len).keys()].map((n) => n + from);

// slightly altered this one to offer me the current index
const mapOverChars = (str, f) => str.split('').map((c, idx) => f(c)).join('');
const wrappedIndex = (loop, idx) => {
  if (loop === '') return '';
  if (!Array.isArray(loop)) loop = loop.split('');
  return loop[idx % loop.length];
}

// FROM PREVIOUS EXERCISE
const CHARS_IN_ALPHABET = 26;
const FIRST_UPPERCASE_CHAR = 'A';
const FIRST_LOWERCASE_CHAR = 'a';

const START_INDEXES = {
  upper: FIRST_UPPERCASE_CHAR.charCodeAt(0),
  lower: FIRST_LOWERCASE_CHAR.charCodeAt(0),
}

const CHAR_CODES = {
  upper: range(CHARS_IN_ALPHABET, START_INDEXES['upper']),
  lower: range(CHARS_IN_ALPHABET, START_INDEXES['lower']),
}

const uppercaseAlphabet = range(CHARS_IN_ALPHABET, START_INDEXES['upper']).map(c => String.fromCharCode(c));
const lowercaseAlphabet = range(CHARS_IN_ALPHABET, START_INDEXES['lower']).map(c => String.fromCharCode(c));

const alphabetIndex = (c) => {
  const  idx = uppercaseAlphabet.indexOf(c.toUpperCase());
  return idx !== -1 ? idx : 0;
}

function charCase(char) {
  if (uppercaseAlphabet.includes(char)) {
    return 'upper';
  } else if (lowercaseAlphabet.includes(char)) {
    return 'lower';
  } else {
    return 'non-letter';
  }
}

function shiftIndex(char, amount) {
  const cse = charCase(char);
  if (cse === 'non-letter') {
    return char;
  } else {
    const codes = CHAR_CODES[cse]; // cacheing to make more readable
    const currentIdx   = codes.indexOf(char.charCodeAt(0));
    const adjustedIdx  = (((currentIdx + amount) % codes.length) + codes.length) % codes.length;
    return String.fromCharCode(codes[adjustedIdx]);
  }
}

const makeCipherFunction = (amountToShift) => (c) => shiftIndex(c, amountToShift);

// BACK TO VIGENERE
const DEBUG = false;

// Edges
const edgeCheck = (msg, key) => {
  if (key === '') return msg;
  return null;
}

// Primary
function vigenereEncrypt(msg, key) {
  const isEdge = edgeCheck();
  if (isEdge !== null) return isEdge;
  msg = String(msg); // "por aquello"

  return msg.split('').map((c, idx) => {
    const keyLetter = wrappedIndex(key, idx);
    const keyIndex  = alphabetIndex(keyLetter);
    return shiftIndex(c, keyIndex);
  }).join('');
}

function vigenereDecrypt(msg, key) {
  const isEdge = edgeCheck();
  if (isEdge !== null) return isEdge;
  msg = String(msg); // "por aquello"

  return msg.split('').map((c, idx) => {
    const keyLetter = wrappedIndex(key, idx);
    const keyIndex  = alphabetIndex(keyLetter);
    return shiftIndex(c, -1 * keyIndex);
  }).join('');
}

if (DEBUG) {
  t.addTest(wrappedIndex, '', '', 55);
  t.addTest(wrappedIndex, 'y', 'hey', 5);
  t.addTest(wrappedIndex, 'T', 'oleToday', 3);
  t.addTest(wrappedIndex, 'g', 'anything goes', 22);
  t.addTest(alphabetIndex, 0, 'a');
  t.addTest(alphabetIndex, 25, 'Z');
  t.addTest(alphabetIndex, 18, 's');
  t.addTest(alphabetIndex, 0, '$');
  t.addTest(alphabetIndex, 0, '');
} else {
  t.addTest(vigenereEncrypt, '', '', 'any');
  t.addTest(vigenereDecrypt, '', '', 'any');
  t.addTest(vigenereEncrypt, '!@#$%', '!@#$%', 'any');
  t.addTest(vigenereDecrypt, '!@#$%', '!@#$%', 'any');
  t.addTest(vigenereEncrypt, '9', 9, 'any');
  t.addTest(vigenereDecrypt, '9', 9, 'any');
  t.addTest(vigenereEncrypt, 'ovmm', null, 'b');
  t.addTest(vigenereDecrypt, 'mtkk', null, 'b');
  t.addTest(vigenereEncrypt, 'Iljt lt gdxd!', 'Take me home!', 'plz');
  t.addTest(vigenereDecrypt, 'Take me home!', 'Iljt lt gdxd!', 'plz');
  t.addTest(vigenereEncrypt, 'no change', 'no change', 'a');
  t.addTest(vigenereDecrypt, 'no change', 'no change', 'a');
  t.addTest(vigenereEncrypt, 'xanifOYE', 'ducklING', 'ugly');
  t.addTest(vigenereDecrypt, 'ducklING', 'xanifOYE', 'ugly');
}

// Tests
t.runSuite();
