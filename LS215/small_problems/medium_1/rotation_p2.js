'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  -- Given a number `num` and a positive integer `pos`, rotate the digit at position pos to the end of the string.
  IO~
  -- Input  -> Number `num`, Positive integer `pos`
  -- Output -> Number `result`
  -- Edges  -> Pos > number of digits in the string (length of String(num))
               Num.length === 1
               Num < 10 (only one digit)
                 <if negative numbers are to work with this, special handling is needed>
  Rules~
  -- The digit we rotate to the end is at position pos, which is counted starting with one from the right (end) of
       the number and moving towards the beginning.
  Questions~
  -- What happens if the number is not an integer? Undetermined. We'll see if the function works without it.
  --   We could write the function to work with any kind of number. To do so would require stripping the number of
  --   its sign and decimal, while retaining both for replacement after the shifting.
  -- For now let's just assume that it works only with integers.
  Notes~
  --
Examples-->
  -- Template
  -- Tests for Improper Input
  ---- f(123, 5)  // undefined
  ---- f(123, '') // undefined
  ---- f(6, 1)    // 6
  ---- f('34', 2) // 43
  ---- f('xk34y', 2) // null
  -- Tests for Normal Operation
  ---- f(735291, 1);      // 735291
  ---- f(735291, 2);      // 735219
  ---- f(735291, 3);      // 735912
  ---- f(735291, 4);      // 732915
  ---- f(735291, 5);      // 752913
  ---- f(735291, 6);      // 352917
  ---- f(12345, 2);       // 12354
  ---- f(12345, 3);       // 12453
  ---- f(12345, 4);       // 13452
Data Structure-->
  -- Because working with the digits of numbers is less wieldy, we'll cast it to a String, which may be split into characters
       and adjusted via index in that manner.
  --
Algorithm-->
  -- Honestly, if I remember right, we used the last function in this second function, which is fine.
  -- Just get another substring from the number up until the digit to rotate, split it to characters,
  --   and combine the previous digits/subarray with the result of the function.
  -- Join together, naturally.
Functions-->
  -- [✓] Signature
  ---- Description
*/

// Helpers
const range = (len, from) => [...Array(len).keys()].map((n) => n + from);
function rotateArray(arr) {
  if (!Array.isArray(arr)) return undefined;
  if (arr.length === 0)    return [];
  if (arr.length === 1)    return arr;

  return arr.slice(1).concat(arr[0]);
}

// Edges
const edgeCheck = (num, pos) => {
  if (typeof num !== 'number' ||
      typeof pos !== 'number' ||
      pos > String(num).length) return undefined;
  if (num < 10) return num;
  return null;
}

// Primary
function rotateRightmostDigits(num, pos) {
  const isEdge = edgeCheck(num, pos);
  if (isEdge !== null) return isEdge;

  num = String(num);
  const beforeRotation = num.slice(0, num.length - pos);
  const toRotate       = num.slice(beforeRotation.length);
  return Number(beforeRotation.concat(rotateArray(toRotate.split('')).join('')));
}

rotateRightmostDigits(12345, 2);

// Tests
// t.addTest(rotateRightmostDigits, result, num, pos);
t.addTest(rotateRightmostDigits, undefined, 123, 5);
t.addTest(rotateRightmostDigits, undefined, 123, '');
t.addTest(rotateRightmostDigits, undefined, '', 2);
t.addTest(rotateRightmostDigits, undefined, 'xk34y', 2);
t.addTest(rotateRightmostDigits, undefined, '43', 2);
t.addTest(rotateRightmostDigits, 6, 6, 1);
t.addTest(rotateRightmostDigits, 735291, 735291, 1);
t.addTest(rotateRightmostDigits, 735219, 735291, 2);
t.addTest(rotateRightmostDigits, 735912, 735291, 3);
t.addTest(rotateRightmostDigits, 732915, 735291, 4);
t.addTest(rotateRightmostDigits, 752913, 735291, 5);
t.addTest(rotateRightmostDigits, 352917, 735291, 6);
t.addTest(rotateRightmostDigits, 12354, 12345, 2);
t.addTest(rotateRightmostDigits, 12453, 12345, 3);
t.addTest(rotateRightmostDigits, 13452, 12345, 4);
t.runSuite();
