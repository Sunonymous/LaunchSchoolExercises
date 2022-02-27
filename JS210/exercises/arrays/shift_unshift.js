// Shift and Unshift

function shift(array) {
  let chosenOne = array[0]
  if (chosenOne !== undefined) {
    for (let idx = 0; idx < array.length - 1; idx++) {
      array[idx] = array[idx + 1];
    }
    array.length = array.length - 1;
  }
  return chosenOne;
}

// easier with a helper function to handle one
const placeInFront = (arr, val) => {
  for (let idx = arr.length; idx > 0; idx--) {
    arr[idx] = arr[idx - 1]
  }
  arr[0] = val;
}

function unshift(array, ...vals) {
  for (let idx = 0; idx < vals.length; idx++) {
    placeInFront(array, vals[idx]);
  }
  return array.length;
}

// LS Examples
console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]
console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3
const testArray = [1, 2, 3];
console.log(shift(testArray));                1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           3
console.log(testArray);                       [5, 2, 3]

// after reviewing solutions,
// could practice splicing more to remove elements
