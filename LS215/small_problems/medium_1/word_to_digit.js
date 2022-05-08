'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  -- Given a string sentence, return a new string with all number words
  ---- converted to their numerical versions.
  IO~
  -- Input  -> A string sentence.
  -- Output -> A string sentence with any number words replaced with their digit.
  -- Edges  -> Empty string, non-string input.
               Empty string shouldn't affect results.
  Rules~
  -- Sentences are words delimited by spaces.
  -- Number words are the English equivalent of digits 0 - 9.
  Questions~
  -- Case sensitivity? Only one example suggests no, though why not?
  Notes~
  -- Will need to account for spaces! Ie. 'fivesix' is not a number word, nor is 'sixth'.
  ---- (at least, not in this exercise)
Examples-->
  -- Template
  -- Tests for Invalid Input
    -- '' <= ''
    -- undefined <= 42
    -- undefined <= []
  -- Tests for Normal Operation
    t.addTest(wordToDigit, expected, sentence);
    t.addTest(wordToDigit, "Please call me at 5 5 5 1 2 3 4. Thanks." , 'Please call me at five five five one two three four. Thanks.');
    t.addTest(wordToDigit, '4 2', 'Four tWo');
    t.addTest(wordToDigit, '7 2 4', 'seven two four.');
    t.addTest(wordToDigit, 'Seventh place', 'Seventh place');
Data Structure-->
  -- Let's use an array of regular expressions for easy iteration!
Algorithm-->
  -- Create an array of regular expressions matching number words.
  -- Create another array holding the actual digits at the same indexes as their regular expression counterparts.
  -- Loop over such an array and replace all instances of the matches with their respective digits.
*/

// Helpers
const range = (len, from) => [...Array(len).keys()].map((n) => n + from);

// Edges
const edgeCheck = (sentence) => {
  if (typeof sentence !== 'string') return undefined;
  return null;
}

// Primary
function wordToDigit(sentence) {
  const isEdge = edgeCheck(sentence);
  if (isEdge !== null) return isEdge;

  const numberWords = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
  const regexes     = numberWords.map((word) => new RegExp(`\\b${word}\\b`, 'gi'));
  const digits      = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map(String);

  regexes.forEach((exp, idx) => sentence = sentence.replaceAll(exp, digits[idx]));
  return sentence;
}

// Tests
t.addTest(wordToDigit, "Please call me at 5 5 5 1 2 3 4. Thanks." , 'Please call me at five five five one two three four. Thanks.');
t.addTest(wordToDigit, '4 2', 'Four tWo');
t.addTest(wordToDigit, '7 2 4.', 'seven two four.');
t.addTest(wordToDigit, 'Seventh place', 'Seventh place');
t.runSuite();
