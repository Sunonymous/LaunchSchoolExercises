// Array Comparison

// only a slight tweak needed from the last one
// i'll rewrite it anyway

function areArraysEqual(firstArray, secondArray) {
  if (firstArray.length !== secondArray.length) {
    return false;
  } else {
    let sortedFirst = firstArray.slice().sort();
    let sortedSecond = secondArray.slice().sort();
    for (let idx = 0; idx < sortedFirst.length; idx++) {
      if (sortedFirst[idx] !== sortedSecond[idx]) return false;
    }

    return true;
  }
}

console.log('Test Results');
console.log(!!areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
console.log(!!areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
console.log(!!areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
console.log(!areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
console.log(!!areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
console.log(!areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
console.log(!areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
console.log(!areArraysEqual([1, 1, 2], [1, 2, 2]));                  // false
console.log(!areArraysEqual([1, 1, 1], [1, 1]));                     // false
console.log(!!areArraysEqual([1, 1], [1, 1]));                        // true
