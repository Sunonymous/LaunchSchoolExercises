function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
} // oh how i missed you, range. never leave me

// Array Operation Practice

function push(array, elem) {
  array[array.length] = elem;
  return array.length;
}
let testArray = ['I', 'love', 'you'];
// console.log(push(testArray, 'mucho!'));
// console.log(testArray);

function pop(array) {
  let chosenOne = array[array.length - 1];
  array.length = array.length - 1;
  return chosenOne;
}
testArray = ['Remove', 'all', 'but', 'necessities.', ', yo.'];
// console.log(pop(testArray));
// console.log(testArray);
// Didn't account for the edge case of an empty array!

function unshift(array, element) {
  for (let idx = array.length; idx > 0; idx--) {
    array[idx] = array[idx - 1];
  }
  array[0] = element;
  return array.length;
}
testArray = ['things', 'first.'];
// console.log(unshift(testArray, 'First'));
// console.log(testArray);

function shift(array) {
  for (let idx = 0; idx <= array.length - 2; idx++) {
    array[idx] = array[idx + 1];
  }
  array.length = array.length - 1;
  return array.length;
}
testArray = ['Achoo!', 'Sorry--', 'allergies.'];
// console.log(shift(testArray));
// console.log(testArray);

function indexOf(array, value) {
  for (let idx = 0; idx < array.length; idx++) {
    if (array[idx] === value) return idx;
  }
  return -1;
}
testArray = [42, 42, 42, 42, 7, 42, 7];
// console.log(indexOf(testArray, 7) === 4);
// console.log(indexOf(testArray, 72) === -1);

function lastIndexOf(array, value) {
  let matches = [];
  for (let idx = 0; idx < array.length; idx++) {
    if (array[idx] === value) push(matches, idx); // look, ma! my own function!!
  }
  return matches.length > 0 ? matches[matches.length - 1] : -1;
}
// console.log(lastIndexOf(testArray, 42) === 5);
// console.log(lastIndexOf(testArray, 7) === 6);
// ha! backwards search is much simpler. must be tired today.

function slice(array, startIdx, endIdx) {
  // edges
  if (startIdx > array.length - 1 || endIdx > array.length - 1) return undefined;
  if (startIdx > endIdx) return undefined;
  let result = [];
  for (let idx = 0; idx < array.length; idx++) {
    if (idx >= startIdx && idx < endIdx) result.push(array[idx]);
  }
  return result;
}
// console.log(slice([1, 2, 3, 4, 5], 0, 2));                      // [ 1, 2 ]
// console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));  // [ 'b', 'c' ]
// ugh, I forgot -- no array comparison...
// man, I really need to up my for loop game. I'll rewrite it
function slice(array, startIdx, endIdx) {
  let result = [];
  for (let idx = startIdx; idx < endIdx; idx++) {
    result.push(array[idx]);
  }
  return result;
}
// console.log(slice([1, 2, 3, 4, 5], 0, 2));                      // [ 1, 2 ]
// console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));  // [ 'b', 'c' ]

// this one is kind of tricky
// ignoring edge cases for now
function splice(array, startIdx, length) {
  const totalElements   = array.length;
  const indexesToRemove = range(length, startIdx);
  const countToRemove   = indexesToRemove.length;
  const lastRemovedIdx  = startIdx + length;
  const removedValues   = slice(array, startIdx, startIdx + length);
  const trailingValues  = slice(array, lastRemovedIdx, array.length);
  for (let count = 0; count <= countToRemove; count++) {
    pop(array);
  }
  for (let idx = 0; idx < trailingValues.length; idx++) {
    push(array, trailingValues[idx]);
  }
  // console.log(removedValues);
  // console.log(trailingValues);
  return removedValues;
}
// mutation is so messy!!
testArray = [1, 2, 3, 4, 5, 6, 7, 8];
// console.log(splice(testArray, 2, 5));
// console.log(testArray);
// the LS splice function is a lot less messy, though it takes a lot of thought to process

function concat(array1, array2) {
  let result = slice(array1, 0, array1.length);
  for (let idx = 0; idx < array2.length; idx++) {
    push(result, array2[idx]);
  }
  return result;
}
testArray = ['Everything', 'is'];
// console.log(concat(testArray, ['Better', 'Together']));
// console.log(testArray);

function join(array, strJoiner) {
  let result = '';
  for (let idx = 0; idx < array.length; idx++) {
    result += String(array[idx]);
    if (idx !== array.length - 1) result += strJoiner;
  }
  return result;
}
testArray = [1, 2, 'skiddly-diddly-do'];
// console.log(join(testArray, ' and-a '))
testArray = ['Teenagers', 'tend to', 'speak a little bit', 'like this.'];
// console.log(join(testArray, ', uh, '));
