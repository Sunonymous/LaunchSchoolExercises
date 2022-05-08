'use strict';

// the location may have to be altered within each distinct folder
const TESTER = require('../../tester');
const t = TESTER.makeTestSuite();

/*
Problem-->

-- IO
---- Input  -> Three numbers representing three sides of a theoretical triangle.
---- Output -> A string denoting the type of triangle formed by the numbers given, or 'invalid' if the triangle is not valid.
---- Edges  -> Not enough sides.

-- Rules
Valid triangles have:
- Sides greater than 0.
- The sum of the two shorter sides must exceed the longest side in length.

Triangle Types:
Equilateral - All sides are equal in length.
Isosceles   - Two sides are equal in length.
Scalene     - All sides differ in length.

-- Notes

Examples-->
---- Tests for Invalid Input
t.addTest(triangle, 'invalid', '', '', '');
t.addTest(triangle, 'invalid', 0, 4, 7);
t.addTest(triangle, 'invalid', 0, 0, 0);
t.addTest(triangle, 'invalid', 0);
---- Tests for Normal Operation
t.addTest(triangle, expected, args);
t.addTest(triangle, 'equilateral', 3, 3, 3);
t.addTest(triangle, 'isosceles', 3, 3, 1.5);
t.addTest(triangle, 'scalene', 3, 4, 5);
t.addTest(triangle, 'invalid', 0, 3, 3);
t.addTest(triangle, 'invalid', 3, 1, 1);
t.addTest(triangle, 'equilateral', 1, 1, 1);
t.addTest(triangle, 'scalene', 4, 7, 9);
t.addTest(triangle, 'isosceles', 9, 4, 9);

Data Structure-->
We will be using arrays at one point to calculate the number of unique values.

Algorithm-->
Create an object which holds the three return values mapped to the keys of the number of unique sides.
Filter out falsy values as edges.
If the sides do not combine in terms of length, return invalid.
Return the value at the String key value of the number of unique sides to the triangle.

✓Functions-->
[✓] unique(arr)
----- Returns a new array containing all of the unique values from the original array.
[✓] validLengthCombination(sides)
----- Returns true if the two smallest values in the sides array are greater than the largest value when summed.
*/

const DEBUG = false;

// Helpers
const trianglesByUniqueSideCount = {
  '1': 'equilateral',
  '2': 'isosceles',
  '3': 'scalene'
};

const sum = (a, b) => a + b;
const validLengthCombination = (sides) => {
  sides = sides.slice().sort();
  const shortestSum = sides.slice(0, 2).reduce(sum);
  return shortestSum > Math.max(...sides);
}

const unique = (arr) => {
  const result = [];
  arr.forEach((em) => {
    if (!result.includes(em)) result.push(em);
  });
  return result;
}

// Edges
const edgeCheck = (s1, s2, s3) => {
  if (!s1 || !s2 || !s3) return 'invalid';
  return null;
}

// Primary
function triangle(s1, s2, s3) {
  const isEdge = edgeCheck(s1, s2, s3);
  if (isEdge !== null) return isEdge;
  
  const sides = [s1, s2, s3];
  if (!validLengthCombination(sides)) return 'invalid';
  return trianglesByUniqueSideCount[unique(sides).length];
}

if (DEBUG) {
  t.addTest(unique, [], []);                     // empty array
  t.addTest(unique, [1], [1]);                   // non-empty array
  t.addTest(unique, [1], [1, 1]);                // duplicates removed
  t.addTest(unique, [1, 2, 3, 4, 5], [1, 2, 3, 4, 5, 4, 2]); // only one of each
  t.addTest(validLengthCombination, true,  [3, 3, 3]);
  t.addTest(validLengthCombination, false, [3, 2, 1]);
  t.addTest(validLengthCombination, true,  [3, 4, 5]);
  t.addTest(validLengthCombination, true,  [3, 3, 1.78]);
} else {
  t.addTest(triangle, 'invalid', '', '', '');
  t.addTest(triangle, 'invalid', 0, 4, 7);
  t.addTest(triangle, 'invalid', 0, 0, 0);
  t.addTest(triangle, 'invalid', 0);
  t.addTest(triangle, 'equilateral', 3, 3, 3);
  t.addTest(triangle, 'isosceles', 3, 3, 1.5);
  t.addTest(triangle, 'scalene', 3, 4, 5);
  t.addTest(triangle, 'invalid', 0, 3, 3);
  t.addTest(triangle, 'invalid', 3, 1, 1);
  t.addTest(triangle, 'equilateral', 1, 1, 1);
  t.addTest(triangle, 'scalene', 4, 7, 9);
  t.addTest(triangle, 'isosceles', 9, 4, 9);
}

// Tests
t.runSuite();
