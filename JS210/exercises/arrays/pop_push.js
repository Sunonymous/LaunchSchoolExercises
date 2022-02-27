// Pop and Push
// sounds like names of cartoon characters

// we didn't do this already?

const pop = arr => {
  let chosenOne;
  if (arr.length === 0) {
    return undefined;
  } else {
    chosenOne = arr[arr.length - 1];
    arr.length--;
  }
  return chosenOne;
}

const push = (arr, ...vals) => {
  for (let idx = 0; idx < vals.length; idx++) {
    arr[arr.length] = vals[idx];
  }
  return arr.length;
}

// LS examples
// pop
const array1 = [1, 2, 3];
console.log(pop(array1));                        // 3
console.log(array1);                // [1, 2]
console.log(pop([]));                           // undefined
console.log(pop([1, 2, ['a', 'b', 'c']]));      // ["a", "b", "c"]

// push
const array2 = [1, 2, 3];
console.log(push(array2, 4, 5, 6));              // 6
console.log(array2);                // [1, 2, 3, 4, 5, 6]
console.log(push([1, 2], ['a', 'b']));          // 3
console.log(push([], 1));                       // 1
console.log(push([]));                          // 0
