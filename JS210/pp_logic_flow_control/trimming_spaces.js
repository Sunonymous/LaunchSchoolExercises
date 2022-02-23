// Tests
const T = require('./test_suite.js');
let tester = T.testSuite('testSubstrings');

// Trimming Spaces
// Given a string, remove leading and trailing spaces from the string, without affecting inner spaceage.
// Procedural seems easier than functional here, though that just means it is a challenge, right?
// I read through the algorithm idea.
// For a functional approach, we can use ranges and string indexing to rebuild the string via filtering indexes.
// Let's be a bit more specific.
// We'll need to find the index of the first non-space character in the string.
//   A recursive function could serve to do this.
// Then we'll find the index of the last non-space character via performing the same operation on the reversed string.
// Then we'll filter a range of indexes in the string to be between the starting and ending indexes.
// Join that together and we're golden!

// let's try a recursive function with an inner function. haven't seen or tried this idea yet.
function firstNonSpaceCharIndex(str) {
  let idx = 0;
  function recur(str) {
    if (str === '') {
      return null;
    } else if (idx === str.length) {
      return -1;
    } else if (str[idx] !== ' ') {
      return idx;
    } else {
      idx += 1;
      return recur(str);
    }
  }
  return recur(str);
}
// works okay... though it's sort of weird, and doesn't look very intuitive

tester.makeTest('Recursive Non-Space Check Works on a Word',               0, () => firstNonSpaceCharIndex('hello'));
tester.makeTest('Recursive Non-Space Check Works on Blank Strings',     null, () => firstNonSpaceCharIndex(''));
tester.makeTest('Recursive Non-Space Check Works With Only Spaces',       -1, () => firstNonSpaceCharIndex('         '));
tester.makeTest('Recursive Non-Space Check Works With Leading Spaces',     4, () => firstNonSpaceCharIndex('    hello'));
tester.makeTest('Recursive Non-Space Check Works With Trailing Spaces',    0, () => firstNonSpaceCharIndex('hello    '));
tester.makeTest('Recursive Non-Space Check Works With Surrounding Spaces', 6, () => firstNonSpaceCharIndex('      hello    '));
tester.makeTest('Recursive Non-Space Check Works With Surrounding Spaces', 6, () => firstNonSpaceCharIndex('      hello    '));

// should work to find the last index too
// we'll need to find the first index of the reversed string and subtract it from the length of the string
// example:
//   'hello    '
//   first non-space index: 0
// reversed:
//   '    olleh'
//   first non-space index: 4
// length of string:
//   9
// last non-space index
//   (length - 1 - first from reversed)

// uh... cheating to use array reverse method?
// hacky reverse string method

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function reverseString(str) {
  if (str.length === 0 || str.length === 1) {
    return str;
  } else {
    return range(str.length, 0).slice().reverse().map(idx => str[idx]).join('');
  }
}

tester.makeTest('Test Reverse on Empty String',    '',                        () => reverseString(''));
tester.makeTest('Test Reverse on One-Char String', 'x',                       () => reverseString('x'));
tester.makeTest('Test Reverse on Two-Char String', 'yx',                      () => reverseString('xy'));
tester.makeTest('Test Reverse on Full Word',       'odnum',                   () => reverseString('mundo'));
tester.makeTest('Test Reverse on Full Sentence',   '!klofedoc ,snoitatulaS',  () => reverseString('Salutations, codefolk!'));

function lastNonSpaceCharIndex(str) {
  if (str === '') {
    return -1;
  } else {
    const reversedIndex = firstNonSpaceCharIndex(reverseString(str));
    return reversedIndex === -1 ? reversedIndex : str.length - 1 - reversedIndex;
  }
}

tester.makeTest('Last Non-Space Char Index Works on a Word',                8, () => lastNonSpaceCharIndex('gratitude'));
tester.makeTest('Last Non-Space Char Index Works on a Phrase',             15, () => lastNonSpaceCharIndex('oh, gracious me!'));
tester.makeTest('Last Non-Space Char Index Works With Leading Spaces',     22, () => lastNonSpaceCharIndex('       oh, gracious me!'));
tester.makeTest('Last Non-Space Char Index Works With Trailing Spaces',    15, () => lastNonSpaceCharIndex('oh, gracious me!         '));
tester.makeTest('Last Non-Space Char Index Works With Surrounding Spaces', 25, () => lastNonSpaceCharIndex('          oh, gracious me!            '));
tester.makeTest('Last Non-Space Char Index Works With Only Spaces',        -1, () => lastNonSpaceCharIndex('                      '));

// now to put it all together

function trim(str) {
  const firstCharIndex = firstNonSpaceCharIndex(str);
  if (firstCharIndex === -1) {
    return '';
  } else {
    const lastCharIndex = lastNonSpaceCharIndex(str);
    return range(str.length, 0)
      .filter(idx => idx >= firstCharIndex && idx <= lastCharIndex)
      .map(idx => str[idx]).join('');
  }
}

tester.makeTest('Trim Works on Blank String',         '',                     () => trim(''));
tester.makeTest('Trim Works on One-Char String',      'i',                    () => trim('i'));
tester.makeTest('Trim Works on One-Word String',      'howdy',                () => trim('howdy'));
tester.makeTest('Trim Works With Leading Spaces',     'how about that?',      () => trim('      how about that?'));
tester.makeTest('Trim Works With Trailing Spaces',    'how about this?',      () => trim('how about this?        '));
tester.makeTest('Trim Works With Surrounding Spaces', 'even this?',           () => trim('             even this?        '));
tester.makeTest('Trim Works With Spaceless String',   'turtlesallthewaydown', () => trim('turtlesallthewaydown'));

tester.makeTest('LS Test 1', 'abc',    () => trim('  abc  '));  // "abc"
tester.makeTest('LS Test 2', 'abc',    () => trim('abc   '));   // "abc"
tester.makeTest('LS Test 3', 'ab c',   () => trim(' ab c'));    // "ab c"
tester.makeTest('LS Test 4', 'a b  c', () => trim(' a b  c'));  // "a b  c"
tester.makeTest('LS Test 5', '',       () => trim('      '));   // ""
tester.makeTest('LS Test 6', '',       () => trim(''));         // ""

tester.analyzeResults();
