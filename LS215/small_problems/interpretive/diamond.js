'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');

/*
Problem-->
  Description~
  Given an odd integer n, display in the console a diamond where each side is n stars in length.
  IO~
  -- Input  -> Odd Integer n
  -- Output -> Unspecified, per problem suggests that there is no significant return value and that the function operates with the output side effect.
               To ease testing, the return value of the function will be the full diamond string.
  -- Edges  -> Even Integers, Non-number input. Explicitly told to assume odd integers are given, so edges will be ignored.
  Rules~
  -- Every character in the diamond is the same. Per the examples given, the character is an asterisk.
  -- We may assume that all non-diamond characters in the lines are spaces.
  --
  Notes~
  -- For ease of visualization during testing, the non-shape char will be set to something more visible.
  -- We don't have to calculate every row of the diamond. We only need to do up until the full row of characters,
       then join that with the reversal of the first half (minus the full line).
  -- The number of non-diamond chars is always the full size minus the number of diamond chars (divided by 2 for each side).
  --
Examples-->
  -- Tests for single char size
  ---- diamond(1) ; *
  -- Tests for regular operation
  ---- diamond(3)
  ---- diamond(5)
  ---- diamond(7)
  ---- diamond(9)
Data Structure-->
  -- We will make use of arrays to hold the lines of the diamond before finally outputting them via join.
Algorithm-->
  -- Let's make this a recursive function, just for fun.
  -- Instantiate a result array as empty.
  -- Create an array of odd numbers, from 1 up to the half of the length of the full size of the diamond.
  ---- This array will track how many diamond chars are needed per line.
  -- LOOP
  -- If the length of the result is less than (size - 1) / 2
  ----- ADD_ROW
  ----- RECUR(result)
  -- ELSE
  ----- ASSEMBLE
Functions-->
  -- [✓] Signature
  ---- Description
  -- [✓] MULTIPLY_CHAR(c, n)
  ---- Given a character `c` and an integer `n`, return a string of the c repeated n times.
  -- [✓] ADD_ROW
  ---- Adds a row to the diamond. Uses the odd numbers array to see how many diamond characters it needs.
  ---- Adds a line comprised of (size - diamondChars) / 2 non-diamond characters + the diamond characters
  -- [✓] ASSEMBLE
  ---- Return a joined string of the result concatenated with a full line of diamond characters and a reversal of result.
*/

const DEBUG = false;
const DIAMOND_CHAR = '*';
const NON_DIAMOND_CHAR = ' ';

// Helpers
const range        = (len, from) => [...Array(len).keys()].map((n) => n + from);
const isOdd        = (n) => n % 2 !== 0;
const onlyOdd      = (arr) => arr.filter(isOdd);
const multiplyChar = (c, n) => {
  if (c.length >= n) {
    return c.slice(0, n);
  } else {
    return multiplyChar(c + c, n);
  }
}

// Edges
// per specification, edge case of improper input is to be ignored
const edgeCheck = (size) => {
  if (size === 1) return DIAMOND_CHAR;
  return null;
};

// Primary
function diamond(size) {
  const isEdge = edgeCheck(size);
  if (isEdge !== null) return isEdge;

  const FULL_LINE    = multiplyChar(DIAMOND_CHAR, size);
  const charsPerLine = onlyOdd(range(size, 1));
  let result         = [];

  function nextRow() {
    const numOfDiamonds = charsPerLine[result.length];
    const spaces = multiplyChar(NON_DIAMOND_CHAR, (size - numOfDiamonds) / 2);
    const chars  = multiplyChar(DIAMOND_CHAR, numOfDiamonds);
    return spaces.concat(chars);
  }

  function assemble() {
    const first = result.join('\n');
    const half  = '\n' + multiplyChar(DIAMOND_CHAR, size) + '\n';
    const last  = result.reverse().join('\n')
    // console.log(first + half + last); // use this instead of return value if needed
    return first + half + last;
  }

  function recur() {
    if (result.length === (size - 1) / 2) {
      return assemble();
    } else {
      result = [...result, nextRow()];
      return recur();
    }
  }

  return recur();
}

const t = test.makeTestSuite();
if (DEBUG) {
  t.addTest(multiplyChar, 'xx', 'x', 2);
  t.addTest(multiplyChar, 'bbbbb', 'b', 5);
  t.addTest(multiplyChar, '', '', 0);
  t.addTest(multiplyChar, ' d  d  d ', ' d ', 9);
  t.addTest(onlyOdd, [], []);
  t.addTest(onlyOdd, [1, 3, 5], [8, 6, 1, 2, 12, 3, 5]);
  t.addTest(onlyOdd, [1, 3, 5, 7, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]);
} else {
  t.addTest(diamond, '*', 1);
  t.addTest(diamond, ' *\n***\n *', 3);
  t.addTest(diamond, '  *\n ***\n*****\n ***\n  *', 5);
  t.addTest(diamond, '   *\n  ***\n *****\n*******\n *****\n  ***\n   *', 7);
  t.addTest(diamond, '    *\n   ***\n  *****\n *******\n*********\n *******\n  *****\n   ***\n    *', 9);
}

t.runSuite();
