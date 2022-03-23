// Find Missing Numbers

// Given a sorted array of integers, return an array including all the
// missing integers between the first and last integers of the given array

// Functional style is gonna shine again
// now where'd that range go...
function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

// Okay, so we'll make a range and filter it based on a negated inclusion of the range.

const missing = array => range(array[array.length - 1] - array[0] + 1, array[0]).filter(n => !array.includes(n));

console.log('Test Results');
console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []
