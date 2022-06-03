'use strict';

// the location may have to be altered within each distinct folder
const TESTER = require('../../tester');
const t = TESTER.makeTestSuite();

/*
Problem-->

-- IO
---- Input  ->
---- Output ->
---- Edges  ->

-- Rules

-- Questions

-- Notes

Examples-->
---- Tests for Invalid Input
t.addTest(func, expected, args);
---- Tests for Normal Operation
t.addTest(func, expected, args);

Data Structure-->

Algorithm-->

✓Functions-->
[] Signature
----- Description
*/

const DEBUG = true;

// Helpers
const range = (len, from) => [...Array(len).keys()].map((n) => n + from);
const log   =       (val) => console.log(val);

// Edges
const edgeCheck = (args) => {
  return null;
}

// Primary
function <fixMe>(args) {
  const isEdge = edgeCheck(args);
  if (isEdge !== null) return isEdge;
  
  // function here
}

if (DEBUG) {
  // interim testing
} else {
  // full tests
}

// Tests
t.runSuite();
