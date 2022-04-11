"use strict";

// Given two non-empty arrays of numbers, return a new, sorted array of every product possible between one element of each array.

const multiplyAllPairs = (nums1, nums2) => {
  let result = [];

  nums1.forEach(a => {
    nums2.forEach(b => {
      result.push(a * b);
    });
  });

  // thanks to MDN for this a - b shortcut
  return result.sort((a, b) => a - b);
}

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));    // [2, 4, 4, 6, 8, 8, 12, 16]
