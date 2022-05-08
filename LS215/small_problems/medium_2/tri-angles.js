'use strict';

// the location may have to be altered within each distinct folder
const TESTER = require('../../tester');
const t = TESTER.makeTestSuite();

/*
Problem-->

-- IO
---- Input  -> Three integers of the degrees of each angle in a triangle.
---- Output -> String denoting the type of the triangle based on its angles.
               OR 'invalid' if the triangle is not valid.
---- Edges  -> May assume integer inputs of degrees.
               Edge of insufficient arguments.
               Edge of invalid types, ie. not numbers.

-- Rules
All angles in a triangle must be greater than 0 and sum to 180.

Triangle Types:
> Right  - One angle is 90 degrees.
> Acute  - All angles are less than 90 degrees.
> Obtuse - One angle is greater than 90 degrees.

-- Questions

-- Notes
Which conditionals do we have to check? There will be a certain order.
Sum of angles is 180
All angles < 90
One angle greater than 90
One angle equal to 90

Examples-->
---- Tests for Invalid Input
t.addTest(triangle, 'invalid', 0, 90, 90);
t.addTest(triangle, 'invalid', 0, 45);
t.addTest(triangle, 'invalid', '90', '45', '45');
---- Tests for Normal Operation
t.addTest(triangle, expected, args);
t.addTest(triangle, 'acute', 60, 70, 50);
t.addTest(triangle, 'right', 30, 90, 60);
t.addTest(triangle, 'obtuse', 120, 50, 10);
t.addTest(triangle, 'invalid', 0, 90, 90);
t.addTest(triangle, 'invalid', 50, 50, 50);
t.addTest(triangle, 'acute', 40, 55, 85);
t.addTest(triangle, 'right', 90, 55, 35);
t.addTest(triangle, 'obtuse', 111, 49, 20);

Data Structure-->
We'll use arrays for syntactical simplicity of checking values.
Algorithm-->
Filter out invalid triangles via falsiness, mapping to values, and sum.
If
✓Functions-->
[✓] sumsTo180(angles)
----- Given an array of angles, return true if they sum to 180, or false otherwise.
[✓] toTypes(vals)
----- Given an array of values, return them mapped to their type.
Quickly wrote a few more very simple functions.
*/

const DEBUG = false;

// Helpers
const log           =    (val) => console.log(val);
const sum           =   (a, b) => a + b;
const sumsTo180     = (angles) => angles.reduce(sum) === 180;
const lessThan90    =      (n) => n < 90;
const greaterThan90 =      (n) => n > 90;
const equalTo90     =      (n) => n === 90;
const mapToType     =   (vals) => vals.map((v) => typeof v);

// Edges
const edgeCheck = (a1, a2, a3) => {
  if (!a1 || !a2 || !a3) return 'invalid';
  const sides = [a1, a2, a3];
  if (!mapToType(sides).every((t) => t === 'number') ||
      !sumsTo180(sides)) return 'invalid';
  return null;
}

// Primary
function triangle(a1, a2, a3) {
  const isEdge = edgeCheck(a1, a2, a3);
  if (isEdge !== null) return isEdge;

  const sides = [a1, a2, a3];

  if (sides.every(lessThan90)) {
    return 'acute';
  } else if (sides.some(equalTo90)) {
    return 'right';
  } else if (sides.some(greaterThan90)) {
    return 'obtuse';
  }
}

if (DEBUG) {
  t.addTest(sumsTo180, true, [60, 60, 60]);
  t.addTest(sumsTo180, true, [0, 120, 60]);
  t.addTest(sumsTo180, true, [90, 30, 60]);
  t.addTest(sumsTo180, false, [91, 30, 60]);
  t.addTest(sumsTo180, false, [0, 0]);
  t.addTest(mapToType, [], []);
  t.addTest(mapToType, ['number', 'object'], [5, []]);
  t.addTest(mapToType, ['boolean', 'object'], [true, null]);
} else {
  // full tests
  t.addTest(triangle, 'invalid', 0, 90, 90);
  t.addTest(triangle, 'invalid', 0, 45);
  t.addTest(triangle, 'invalid', '90', '45', '45');
  t.addTest(triangle, 'acute', 60, 70, 50);
  t.addTest(triangle, 'right', 30, 90, 60);
  t.addTest(triangle, 'obtuse', 120, 50, 10);
  t.addTest(triangle, 'invalid', 0, 90, 90);
  t.addTest(triangle, 'invalid', 50, 50, 50);
  t.addTest(triangle, 'acute', 40, 55, 85);
  t.addTest(triangle, 'right', 90, 55, 35);
  t.addTest(triangle, 'obtuse', 111, 49, 20);
}

// Tests
t.runSuite();
