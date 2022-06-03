'use strict';

// the location may have to be altered within each distinct folder
const TESTER = require('../../tester');
const t = TESTER.makeTestSuite();

/*
Problem-->
Given a positive integer n,
-- IO
---- Input  -> Postive integer n
---- Output -> Next featured number greater than n.
---- Edges  -> It isn't specified whether negative numbers are allowed.
               n equal to or larger than largest featured number
               non-number/non-integer n

-- Rules
Featured numbers are odd and divible by seven with no repeated digits.
Largest featured number is 9876543201.

-- Questions
Negatives allowed as input?

-- Notes
I am noting to increment the loop index by numbers larger than one if looking for a
particular index, as shown in the LS solution. That's a habit to break!

Examples-->
---- Tests for Invalid Input
t.addTest(func, expected, args);
t.addTest(featured, undefined, []);
t.addTest(featured, undefined, {});
t.addTest(featured, undefined, '');
---- Tests for Normal Operation
t.addTest(func, expected, args);
featured, 21, 12);
featured, 21, 20);
featured, 35, 21);
featured, 1029, 997);
featured, 1043, 1029);
featured, 1023547, 999999);
featured, 1023456987, 999999987);
featured, 9876543201, 9876543186);
featured, 9876543201, 9876543200);
featured, NO_MORE_FNS, 9876543201);

Data Structure-->
We'll try making a recursive function for this one.

Algorithm-->
Filter out edge cases.
Initialize result to n + 1.
RECUR
  If n meets the conditions of the sub-functions, return it.
  Otherwise, return RECUR(n + 1);

✓Functions-->
[✓] isOdd(n)
----- Returns true if n is not evenly divisible by 2.
[✓] divisibleBy7(n)
----- Returns true if n is evenly divisible by 7.
[✓] unique(arr)
----- Given an array, returns a new array of all the unique elements in the given array.
[✓] noRepeatingDigits(n)
----- Returns true if every digit in n occurs only once.
*/

const DEBUG = false;

// Helpers
const LARGEST_FEATURED_NUMBER = 9876543201;
const NO_MORE_FNS      = 'There is no number that fulfills the requirements.';
const range            = (len, from) => [...Array(len).keys()].map((n) => n + from);
const log              =       (val) => console.log(val);
const isOdd            =         (n) => n % 2 !== 0;
const divisibleBy7     =         (n) => n % 7 === 0;
const isFeaturedNumber =         (n) => isOdd(n) && divisibleBy7(n) && noRepeatedDigits(n);

const unique = (arr) => {
  const result = [];
  arr.forEach((em) => {
    if (!result.includes(em)) result.push(em);
  });

  return result;
}

const noRepeatedDigits = (n) => {
  const digits = String(n).split('');
  return unique(digits).length === digits.length;
}

// Edges
const edgeCheck = (n) => {
  if (n < 0 || typeof n !== 'number') return undefined;
  if (n >= LARGEST_FEATURED_NUMBER) return NO_MORE_FNS;
  return null;
}

// Primary
function featured(n) {
  const isEdge = edgeCheck(n);
  if (isEdge !== null) return isEdge;
  
  for (let i = parseInt(n + 1); i <= LARGEST_FEATURED_NUMBER; i += 1) {
    if (isFeaturedNumber(i)) return i;
  }

  return NO_MORE_FNS;
}

// Tests
t.addTest(featured, undefined, []);
t.addTest(featured, undefined, {});
t.addTest(featured, undefined, '');
t.addTest(featured, 21, 12);
t.addTest(featured, 21, 20);
t.addTest(featured, 35, 21);
t.addTest(featured, 1029, 997);
t.addTest(featured, 1043, 1029);
t.addTest(featured, 1023547, 999999);
t.addTest(featured, 1023456987, 999999987);
t.addTest(featured, 9876543201, 9876543186);
t.addTest(featured, 9876543201, 9876543200);
t.addTest(featured, NO_MORE_FNS, 9876543201);
t.runSuite();
