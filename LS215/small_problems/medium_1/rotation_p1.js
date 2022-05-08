'use strict';

// the location may have to be altered within each distinct folder
const test = require('../../tester');
const t = test.makeTestSuite();

/*
Problem-->
  Description~
  -- Given an array, return a new array with the first element of the original array
  ---- after all of the other elements in the original array.
  IO~
  -- Input  -> Array
  -- Output -> Rotated Array
  -- Edges  -> Not given array (-> undefined)
               Empty array (-> [])
  Rules~
  -- No mutating the input array.
  -- Rotation is moving the first element in the array to the end.
  --
  Notes~
  --
Examples-->
  -- Tests for Improper Input
    -- rotateArray('') => undefined
    -- rotateArray(64) => undefined
    -- rotateArray([]) => []
  -- Tests for Normal Operation
    -- rotateArray([7, 3, 5, 2, 9, 1]) => [3, 5, 2, 9, 1, 7]
    -- rotateArray(['a', 'b', 'c']) => ['b', 'c', 'a']
    -- rotateArray(['a']) => ['a']
    -- rotateArray([1, 'a', '3', 'c']) => ['a', 3, 'c', 1]
    -- rotateArray([{ a: 2 }, [1, 2], 3]) => [[1, 2], 3, { a: 2 }]
    -- rotateArray([555, 444, 222]) => [444, 222, 555]
Data Structure-->
  -- Not much change here. Just using arrays...
Algorithm-->
  -- Should be able to accomplish this with a simple slice.
*/

// Edges
const edgeCheck = (arr) => {
  if (!Array.isArray(arr)) return undefined;
  if (arr.length === 0)    return [];
  if (arr.length === 1)    return arr;

  return null;
}

// Primary
function rotateArray(arr) {
  const isEdge = edgeCheck(arr);
  if (isEdge !== null) return isEdge;
  
  return arr.slice(1).concat(arr[0]);
}

// Tests
t.addTest(rotateArray, undefined, '');
t.addTest(rotateArray, undefined, 64);
t.addTest(rotateArray, [], []);
t.addTest(rotateArray, [3, 5, 2, 9, 1, 7], [7, 3, 5, 2, 9, 1]);
t.addTest(rotateArray, ['b', 'c', 'a'], ['a', 'b', 'c']);
t.addTest(rotateArray, ['a'], ['a']);
t.addTest(rotateArray, [1, 'a', 3, 'c'], ['a', 3, 'c', 1]);
t.addTest(rotateArray, [444, 222, 555], [555, 444, 222]);
t.runSuite();
