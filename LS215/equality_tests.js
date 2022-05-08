'use strict';

/* A mini testing function to quickly move through tests for challenge problems. */

const log  = (x) => console.log(x);
const test = require('./testerV2');
const t    = test.makeTestSuite();

const arraysEqual = (arr1, arr2) => {
  if (Array.isArray(arr1) && !Array.isArray(arr2)) return false;
  if (arr1.length !== arr2.length) return false;

  arr1 = arr1.slice().sort();
  arr2 = arr2.slice().sort();
  for (let i = 0; i < arr1.length; i += 1) {
    if (!areEqual(arr1[i], arr2[i])) return false;
  }

  return true;
}

const objsEqual = (obj1, obj2) => {
  if (obj1 === obj2) return true; // shortcut if true by ref
  if (typeof obj1 === "object" && typeof obj2 !== "object") return false;

  const keys1 = Object.keys(obj1);
  const keys2 = Object.keys(obj2);

  if (keys1.length !== keys2.length) return false;

  for (let i = 0; i < keys1.length; i += 1) {
    if (!areEqual(obj1[keys1[i]], obj2[keys1[i]])) return false;
  }

  return true;
}

const areEqual = (val1, val2) => {
  if (Array.isArray(val1)) {
    if (!arraysEqual(val1, val2)) return false;
  } else if (typeof val1 === 'object') {
    if (!objsEqual(val1, val2)) return false;
  } else {
    if (val1 !== val2) return false;
  }

  return true;
}

// Test for Array Equality
t.addTest(arraysEqual, false, [], [1]) // one empty array
t.addTest(arraysEqual, true,  [], []) // empty arrays
t.addTest(arraysEqual, false, [1, 2], [1, 2, 3]) // arrays with different lengths
t.addTest(arraysEqual, false, [1], [[1]]) // one nested array
t.addTest(arraysEqual, true,  [[1], [2]], [[1], [2]]) // nested arrays

// Test for Object Equality
t.addTest(objsEqual, true, {}, {})                                 // empty objects
t.addTest(objsEqual, false, {}, {a: 1})                            // one empty object
t.addTest(objsEqual, false, {a: 1}, {b: 2})                        // objects with different keys
t.addTest(objsEqual, false, {a: 1}, {a: 1, b: 2})                  // objects with different number of keys
t.addTest(objsEqual, false, {a: 1}, {a: 2})                        // objects with different val at key
t.addTest(objsEqual, true, {a: [1, 2, 3]}, {a: [1, 2, 3]})         // objects with array val at key
t.addTest(objsEqual, false, {a: {wow: 42}}, {a: ['lol']})          // object with nested object
t.addTest(objsEqual, true, {a: {such: 'obj'}}, {a: {such: 'obj'}}) // objects with nested object

t.runSuite();
