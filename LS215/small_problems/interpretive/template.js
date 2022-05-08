'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  --
  IO~
  -- Input  ->
  -- Output ->
  -- Edges  ->
  Rules~
  --
  Questions~
  --
  Notes~
  --
Examples-->
  -- Template
  -- Tests for
    -- <test>
Data Structure-->
  --
Algorithm-->
  --
Functions-->
  -- [✓] Signature
  ---- Description
*/

const DEBUG = true;

// Helpers
const range = (len, from) => [...Array(len).keys()].map((n) => n + from);

// Edges
const edgeCheck = () => null;

// Primary
function fixMe() {
  const isEdge = edgeCheck();
  if (isEdge !== null) return isEdge;
}

if (DEBUG) {
  // interim testing
} else {
  // full tests
}

// Tests
t.runSuite();
