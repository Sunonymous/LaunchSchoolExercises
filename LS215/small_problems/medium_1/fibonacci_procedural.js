'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  -- This is so similar to the last that I am not even going to write all this.
*/


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

  while (nums.length < n) {
    nums.push(nums[nums.length - 1] + nums[nums.length - 2]);
  }

  return nums[nums.length - 1];
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
