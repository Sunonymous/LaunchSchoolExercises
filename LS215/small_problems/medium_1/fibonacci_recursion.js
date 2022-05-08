'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  -- Given a positive integer `n`, recursively calculate the nth Fibonacci number.
  IO~
  -- Input  -> Positive int `n`
  -- Output -> nth Fibonacci number
  -- Edges  -> Negative n, non-integer n, non-number n.
  Rules~
  -- The first two Fibonacci numbers are 1 and 1.
  -- After the first two, determining the next is done via adding the last two together.
Examples-->
  -- Tests for Invalid Input
  ---- t.addTest(fibonacci, undefined, 0);
  ---- t.addTest(fibonacci, undefined, -4);
  ---- t.addTest(fibonacci, undefined, '');
  ---- t.addTest(fibonacci, undefined, []);
  -- Tests for Normal Operation
  ---- t.addTest(fibonacci, 1, 1);
  ---- t.addTest(fibonacci, 1, 2);
  ---- t.addTest(fibonacci, 2, 3);
  ---- t.addTest(fibonacci, 3, 4);
  ---- t.addTest(fibonacci, 5, 5);
  ---- t.addTest(fibonacci, 144, 12);
  ---- t.addTest(fibonacci, 6765, 20);
Data Structure-->
-- We will use an array for easy length checking to determine if the result has been achieved.
Algorithm-->
-- Validate input/edge cases.
-- Create an array of [1, 1] to hold the first two fibonacci numbers.
-- recursively add a new number until the length of the array matches n.
-- Return the last number in the array.
*/

// Helpers
const lastEm         = (arr) => arr[arr.length - 1];
const secondToLastEm = (arr) => arr[arr.length - 2];

// Edges
const edgeCheck = (n) => {
  if (n <= 0 || typeof n !== 'number') return undefined;
  return null;
}

// Primary
function fibonacci(n) {
  const isEdge = edgeCheck(n);
  if (isEdge !== null) return isEdge;
  
  // get rid of decimals
  n = Math.floor(n);

  let nums = [1, 1];

  function recur() {
    if (nums.length >= n) {
      return nums[nums.length - 1];
    } else {
      nums.push(lastEm(nums) + secondToLastEm(nums));
      return recur();
    }
  }

  return recur();
}

// Tests
t.addTest(fibonacci, undefined, 0);
t.addTest(fibonacci, undefined, -4);
t.addTest(fibonacci, undefined, '');
t.addTest(fibonacci, undefined, []);
t.addTest(fibonacci, 1, 1);
t.addTest(fibonacci, 1, 2);
t.addTest(fibonacci, 2, 3);
t.addTest(fibonacci, 3, 4);
t.addTest(fibonacci, 5, 5);
t.addTest(fibonacci, 144, 12);
t.addTest(fibonacci, 6765, 20);
t.runSuite();
