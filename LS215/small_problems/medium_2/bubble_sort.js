'use strict';

// the location may have to be altered within each distinct folder
const TESTER = require('../../testerV2');
const t = TESTER.makeTestSuite();

/*
Problem-->
Implement a bubble sorting algorithm to sort a given array in place.
-- IO
---- Input  -> An array of homogenous elements.
---- Output -> The same (mutated) array, sorted.
---- Edges  -> Non-homogenous elements, empty array, non-array input.
               Rules say we can assume array has 2+ elements.

-- Rules
Array must be sorted using the bubble sort algorithm.
Array must be sorted in place.

-- Questions

-- Notes
Maybe having the array required as homogenous is a design decision rather than a hard limit.
I'll still go with it, just to be totally rebellious.

Examples-->
---- Tests for Invalid Input
t.addTest(bubbleSort, [], []);
t.addTest(bubbleSort, [], []);                   // empty arrays
t.addTest(bubbleSort, undefined, [1, 'two', 3]); // differing types

---- Tests for Normal Operation
t.addTest(bubbleSort, [], []);
t.addTest(bubbleSort, [3, 5], [5, 3]);
t.addTest(bubbleSort, [1, 2, 4, 6, 7], [6, 2, 7, 1, 4]);
t.addTest(bubbleSort, ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"], ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']);
t.addTest(bubbleSort, [9, 99, 999, 9999], [99, 9999, 9, 999]);
t.addTest(bubbleSort, ['A bird ', 'in the hand ', 'is better ', 'than ice cream. ', 'Preferably living! '], ['Preferably living! ', 'than ice cream. ', 'is better ', 'A bird ', 'in the hand ']);

Data Structure-->
Naturally, we are using arrays.

Algorithm-->
I want to try going at this with recursion, because I know I didn't do so last time.
Filter out edge cases and verify that the array is Homogenous.
Create a recursive function which checks whether the array only ascends.
If so, return it.
If not, swap the index provided by the ascension check function and the index before it.

✓Functions-->
[✓] ascendingTo(arr)
----- Returns -1 if all the elements in the array appear in ascending order, otherwise the first index where an element is lower than the previous.
[✓] swap(arr, i1, i2)
----- Returns the given array with the elements at index i1 and i2 swapped in position.
[✓] isHomogenous(arr)
----- Returns true if the elements in the given array are all of the same type.
*/

const DEBUG = false;

// Helpers
const swapElements = (arr, i1, i2) => {
  if (!arr[i1] || !arr[i2]) return false;

  const temp = arr[i1];
  arr[i1]    = arr[i2];
  arr[i2]    = temp;

  return true;
}

const isHomogenous = (arr) => {
  if (arr.length === 0) return true;
  const firstType = typeof arr[0];
  return arr.every((em) => typeof em === firstType);
}

const ascendingTo = (arr) => {
  if (arr.length < 2) return -1;

  let prevValue = arr[0];
  for (let idx = 1; idx < arr.length; idx += 1) {
    if (arr[idx] < prevValue) return idx;
    prevValue = arr[idx];
  }

  return -1;
}


// Edges
const edgeCheck = (arr) => {
  if (!Array.isArray(arr) || !isHomogenous(arr)) return undefined;
  if (arr.length <= 1) return arr;
  return null;
}

// Primary
function bubbleSort(arr) {
  const isEdge = edgeCheck(arr);
  if (isEdge !== null) return isEdge;

  function recur() {
    let ascendsTo = ascendingTo(arr);
    return ascendsTo === -1 ? arr : recur(swapElements(arr, ascendsTo, ascendsTo - 1));
  }

  return recur();
}

if (DEBUG) {
  let arr = [5, 9];
  t.addTest(isHomogenous, true,  []);             // normal functioning
  t.addTest(isHomogenous, true,  [1, 2, 3]);      // normal functioning
  t.addTest(isHomogenous, false, [1, 'two', 3]);  // normal functioning
  t.addTest(swapElements, false, [1], 5, 3);      // not enough elements
  t.addTest(swapElements, true, arr, 0, 1);       // normal functioning
  t.addTest(ascendingTo,  -1, []);                // empty array
  t.addTest(ascendingTo,  -1, [7]);               // array too short
  t.addTest(ascendingTo,   1, [5, 4]);            // second element smaller
  t.addTest(ascendingTo,   4, [1, 2, 3, 5, 4]);   // normal operation -- last em smaller
  t.addTest(ascendingTo,  -1, [1, 2, 3, 4, 5]);   // normal operation -- all ascending
} else {
  t.addTest(bubbleSort, [], []);                   // empty arrays
  t.addTest(bubbleSort, undefined, [1, 'two', 3]); // differing types
  t.addTest(bubbleSort, undefined, {});            // non-array
  t.addTest(bubbleSort, undefined, 12);            // non-array
  t.addTest(bubbleSort, undefined, '');            // non-array
  t.addTest(bubbleSort, [3, 5], [5, 3]);
  t.addTest(bubbleSort, [1, 2, 4, 6, 7], [6, 2, 7, 1, 4]);
  t.addTest(bubbleSort, ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"], ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']);
  t.addTest(bubbleSort, [9, 99, 999, 9999], [99, 9999, 9, 999]);
  t.addTest(bubbleSort, ['A bird ', 'Preferably living! ', 'in the hand ', 'is better ', 'than ice cream. '], ['Preferably living! ', 'than ice cream. ', 'is better ', 'A bird ', 'in the hand ']);
}

// Tests
t.runSuite();
console.log(bubbleSort(['Preferably living! ', 'than ice cream. ', 'is better ', 'A bird ', 'in the hand ']));
