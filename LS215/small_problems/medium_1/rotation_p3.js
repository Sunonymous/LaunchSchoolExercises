'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  --
  --
  IO~
  -- Input  -> Positive Integer `num`
  -- Output -> Positive Integer `result`
  -- Edges  -> Single digit numbers.
  Rules~
  --
  Questions~
  -- How do zeroes affect the result?
    -- There is an example that leading zeroes alter the process of rotation. The example
       given has a three digit number with a zero in the middle. There is a zero in the
       last example as well.
    -- They seem to only matter when they are not moved to the back of the number.
  Notes~
  -- Given example of maximum rotation:
     735291 => 352917 => 329175 => 321759 => 321597 => 321579
     x          x          x          x          x
     Example 2 (saving digits from 0 to 7):
     I can't get this example right, and I can't figure out why...
     8703529146 => 7035291468 => 7352914680 => 7329146805 => 7321468059 => 7321680594 => 7321605948 => 7321609485 => 7321609854
     x (0)      =>  x (1)    =>    x (2)   =>     x (3)  =>      x (4) =>   (5) x    =>    (6) x   =>     (7) x
     What is changing is the number of digits we save at the front. Kind of obtuse.
     Starts at 0, then increments by one until two less than the length of the num.
     Could make a function, MOVE_TO_END, which takes an array and an index and moves
       the element at the given index to the end of the array, via subarrays.
     So how can we derive the list of indexes?
     Because the last function counts from the right, we'll need from number of digits down to 2.
Examples-->
  -- Tests for Improper Input
    -- undefined
  -- Tests for Improper Input
    -- 321579 <= maxRotation(735291);          // 321579
    -- 3, maxRotation(3);               // 3
    -- 53, maxRotation(35);              // 53
    -- 15, maxRotation(105);             // 15 -- the leading zero gets dropped
    -- 7321609845, maxRotation(8703529146);      // 7321609845
Data Structure-->
  -- We're using the function from the last exercise using the function from the previous previous exercise, so... arrays.
Algorithm-->
  -- Generate a list of indexes to rotate via number of digits minus two.
  -- Invoke the previous exercise's function passing the last index in the range.
  -- Return final result.
*/

// Helpers
const range = (len, from) => [...Array(len).keys()].map((n) => n + from);

function rotateArray(arr) {
  if (!Array.isArray(arr)) return undefined;
  if (arr.length === 0)    return [];
  if (arr.length === 1)    return arr;

  return arr.slice(1).concat(arr[0]);
}

function rotateRightmostDigits(num, pos) {
  if (typeof num !== 'number' ||
      typeof pos !== 'number' ||
      pos > String(num).length) return undefined;
  if (num < 10) return num;

  num = String(num);
  const beforeRotation = num.slice(0, num.length - pos);
  const toRotate       = num.slice(beforeRotation.length);
  return Number(beforeRotation.concat(rotateArray(toRotate.split('')).join('')));
}

// Edges
const edgeCheck = (num) => {
  if (num < 0) return undefined;
  if (num < 10) return num;
  return null;
}

// Primary
function maxRotation(num) {
  const isEdge = edgeCheck(num);
  if (isEdge !== null) return isEdge;
  
  const indexes = range(String(num).length - 1, 2).reverse();
  indexes.forEach((i) => num = rotateRightmostDigits(num, i));

  return num;
}

t.addTest(maxRotation, undefined, -74);
t.addTest(maxRotation, 7, 7);
t.addTest(maxRotation, 321579, 735291);
t.addTest(maxRotation, 3, 3);
t.addTest(maxRotation, 35, 53);
t.addTest(maxRotation, 15, 105);
t.addTest(maxRotation, 7321609845, 8703529146);

// Tests
t.runSuite();
