'use strict';

// the location may have to be altered within each distinct folder
const TESTER = require('../../tester');
const t = TESTER.makeTestSuite();

/*
Problem-->
Given a positive integer `n`, return the difference between the square of the sum
of the series of numbers from 1 to n and the sum of the squares of the same series.
-- IO
---- Input  -> Positive int `n`
---- Output -> Integer value from calculation.
---- Edges  -> Negative n or non-number n.

-- Rules

-- Notes

Examples-->
---- Tests for Invalid Input
t.addTest(sumSquareDifference, undefined, -5);
t.addTest(sumSquareDifference, undefined, 0);
t.addTest(sumSquareDifference, undefined, []);
---- Tests for Normal Operation
t.addTest(sumSquareDifference, expected, args);
sumSquareDifference, 22, 3);
sumSquareDifference, 2640, 10);
sumSquareDifference, 0, 1);
sumSquareDifference, 25164150, 100);
sumSquareDifference, x, 5);

Data Structure-->


Algorithm-->

*/

// Helpers
const range        = (len, from) => [...Array(len).keys()].map((n) => n + from);
const log          =       (val) => console.log(val);
const sum          =      (a, b) => a + b;
const square       =         (n) => n ** 2;
const sumOfSquares =        (ns) => ns.map(square).reduce(sum);
const squareOfSums =        (ns) => square(ns.reduce(sum));

// Edges
const edgeCheck = (n) => {
  if (n <= 0 || !Number.isInteger(n)) return undefined;
  return null;
}

// Primary
function sumSquareDifference(n) {
  const isEdge = edgeCheck(n);
  if (isEdge !== null) return isEdge;
  
  const ints = range(n, 1);
  return squareOfSums(ints) - sumOfSquares(ints);
}

// Tests
t.addTest(sumSquareDifference, undefined, -5);
t.addTest(sumSquareDifference, undefined, 0);
t.addTest(sumSquareDifference, undefined, []);
t.addTest(sumSquareDifference, 22, 3);
t.addTest(sumSquareDifference, 2640, 10);
t.addTest(sumSquareDifference, 0, 1);
t.addTest(sumSquareDifference, 25164150, 100);
t.addTest(sumSquareDifference, 170, 5);
t.runSuite();
