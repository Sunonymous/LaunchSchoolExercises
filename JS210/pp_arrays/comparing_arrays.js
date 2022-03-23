// Array Comparison
// aka 'JS, why??'

function arraysEqual(array1, array2) {
  if (array1.length !== array2.length) return false;

  for (let idx = 0; idx < array1.length; idx++) {
    if (array1[idx] !== array2[idx]) return false;
  }

  return true;
}

console.log('Test Results:');
console.log(!!arraysEqual([1], [1]));                               // true
console.log(!arraysEqual([1], [2]));                               // false
console.log(!arraysEqual([1, 2], [1, 2, 3]));                      // false
console.log(!!arraysEqual([1, 'hi', true], [1, 'hi', true]));       // true
console.log(!arraysEqual([1, 'hi', true], [1, 'hi', false]));      // false
console.log(!arraysEqual([1, 'hi', true], [1, 'hello', true]));    // false
console.log(!arraysEqual([1, 'hi', true], [2, 'hi', true]));       // false
