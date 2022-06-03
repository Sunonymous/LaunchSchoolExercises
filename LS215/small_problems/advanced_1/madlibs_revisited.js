'use strict';

// the location may have to be altered within each distinct folder
const TESTER = require('../../tester');
const t = TESTER.makeTestSuite();

/*
Problem-->
Given a specific template, return a string of the template with random nouns, adjectives, verbs, and adverbs inserted into the template.
-- IO
---- Input  -> Template string, string containing placeholders to be replaced with random occurrences of the parts of speech they require.
---- Output -> String containing all placeholders replaced by valid English words.
---- Edges  ->
  - Template doesn't contain placeholders?
  - Non-string input
  - Empty string input

-- Rules
I am allowed to define the structure of the templates... So much power!
Return all template words replaced by real words!

-- Questions


-- Notes
Could use recursive check!

Examples-->
---- Tests for Invalid Input
t.addTest(madlibs, undefined, '');
t.addTest(madlibs, undefined, 42);
t.addTest(madlibs, undefined, {});
t.addTest(madlibs, undefined, [1, 2, 3]);
---- Tests for Normal Operation
t.addTest(madlibs, expected, args);

Data Structure-->
I think we can stick with string. It has everything we need!

Algorithm-->
Create an object containing the random words to insert.
Check for edges.
Using a regular expression to match for template words, recursively check for the presence of a filler word.
If found, return the function called again with that word replaced by a random instance of the part of speech requested.

✓Functions-->
[] Signature
----- Description
[] Signature
----- Description
*/

const DEBUG = true;

// Helpers
const range = (len, from) => [...Array(len).keys()].map((n) => n + from);
const log   =       (val) => console.log(val);

// Edges
const edgeCheck = (template) => {
  if (!template || typeof template !== 'string') return undefined;
  return null;
}

// Primary
function madlibs(template) {
  const isEdge = edgeCheck(template);
  if (isEdge !== null) return isEdge;
  
  // function here
}

if (DEBUG) {
  let regex = /\$(noun|verb|adve|adje)/;
  let test = 'I am a $noun and I feel $adje today. Have you ever felt $adje?';
  log(test.match(regex));
} else {
t.addTest(madlibs, undefined, '');
t.addTest(madlibs, undefined, 42);
t.addTest(madlibs, undefined, {});
t.addTest(madlibs, undefined, [1, 2, 3]);
}

// Tests
t.runSuite();
