'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  -- Given a string to encrypt, `msg`, and an integer, `key`, shift each character `key`
  --   characters forward or backward in the alphabet, wrapping front to back if needed.
  IO~
  -- Input  -> String to encrypt or decrypt, `msg` and Integer `key`
  -- Output -> Encrypted string via Caesar Cipher
  -- Edges  -> Because this will work with any character, there aren't really edges.
  ----         We will, however, need to cast our input to string. Just in case!
  Rules~
  -- Character case is preserved, as well as non alphabetical characters.
  -- The order of characters is also preserved.
  Notes~
  -- The SHIFT_INDEX function takes a character and an amount to shift. Because we're using it
  ---- in a map function, rather than being given the index of the character, we need to take
  ---- advantage of partial application to give it the proper shift amount.
Examples-->
  -- Tests for Word with no Letters
    -- caesarEncrypt('', 5) => ''
    -- caesarEncrypt('!@#$%', 5) => '!@#$%'
    -- caesarDecrypt('', 5) => ''
    -- caesarDecrypt('!@#$%', 5) => '!@#$%'
  -- Tests for Normal Operation
    -- caesarEncrypt('abc', 3) => 'def'
    -- caesarDecrypt('def', 3) => 'abc'
    -- caesarEncrypt('hello', 26) => 'hello'
    -- caesarDecrypt('hello', 26) => 'hello'
    -- caesarEncrypt('howdy, partner!', 5) => 'qxfmh, yjacwna!'
    -- caesarDecrypt('qxfmh, yjacwna', 5) => 'howdy, partner!'
    -- caesarEncrypt('no comment', 2) => 'pq eqoogpv'
    -- caesarDecrypt('pq eqoogpv', 2) => 'no comment'
Data Structure-->
  -- Arrays are used to contain the alphabet.
Algorithm-->
  -- Cast input to String.
  -- If key is 0 or number of chars in alphabet, return the original message.
  -- Otherwise, map over the characters with the SHIFT_INDEX function as noted above.
  -- SHIFT_INDEX
  ---- Reference an array of character codes for upper and lowercase characters,
  ---- grab the index of the current character and return the index of the character
  ---- at a position higher or lower than that current index. Use modulo to wrap.
*/

const DEBUG = true;
const CHARS_IN_ALPHABET = 26;
const FIRST_UPPERCASE_CHAR = 'A';
const FIRST_LOWERCASE_CHAR = 'a';

// Common Helpers
const range = (len, from) => [...Array(len).keys()].map((n) => n + from);
const mapOverChars = (str, f) => str.split('').map(f).join('');
const makeCipherFunction = (amountToShift) => (c) => shiftIndex(c, amountToShift);

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

// Primary
function caesarEncrypt(msg, key) {
  if (key === 0 || key === CHARS_IN_ALPHABET) return msg;
  msg = String(msg);
  return mapOverChars(msg, makeCipherFunction(key));
}

function caesarDecrypt(msg, key) {
  if (key === 0 || key === CHARS_IN_ALPHABET) return msg;
  msg = String(msg);
  return mapOverChars(msg, makeCipherFunction(key * -1));
}

t.addTest(caesarEncrypt, 'def', 'abc', 3)
t.addTest(caesarDecrypt, 'abc', 'def', 3);
t.addTest(caesarEncrypt, '', '', 3);
t.addTest(caesarDecrypt, '', '', 3);
t.addTest(caesarEncrypt, '5', 5, 3);
t.addTest(caesarDecrypt, '5', 5, 3);
t.addTest(caesarEncrypt, '!@#$%', '!@#$%', 3);
t.addTest(caesarDecrypt, '!@#$%', '!@#$%', 3);
t.addTest(caesarEncrypt, 'hello', 'hello', 26);
t.addTest(caesarDecrypt, 'hello', 'hello', 26);
t.addTest(caesarEncrypt, 'qxfmh, yjacwna!', 'howdy, partner!', 9);
t.addTest(caesarDecrypt, 'howdy, partner!', 'qxfmh, yjacwna!', 9);
t.addTest(caesarEncrypt, 'pq eqoogpv', 'no comment', 2);
t.addTest(caesarDecrypt, 'no comment', 'pq eqoogpv', 2);
const wisdom           = 'Teachers open the door, but you must enter by yourself.';
const obfuscatedWisdom = 'Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.';
t.addTest(caesarEncrypt, obfuscatedWisdom, wisdom, 13);
t.addTest(caesarDecrypt, wisdom, obfuscatedWisdom, 13);

t.runSuite();
