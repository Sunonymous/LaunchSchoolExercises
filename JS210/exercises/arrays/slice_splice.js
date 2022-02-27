// Slice and Splice (and everything nice)

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function slice(array, startIdx, endIdx) {
  if (startIdx < 0 || endIdx < 0) return undefined;
  if (startIdx >= array.length) startIdx = array.length;
  if (endIdx >= array.length)   endIdx = array.length;
  if (startIdx > endIdx) return [];
  let result = [];
  for (let idx = startIdx; idx < endIdx; idx++) {
    result.push(array[idx]);
  }
  return result;
}

// slice tests
// (were successful)
/*
console.log(slice([1, 2, 3], 1, 2));               // [2]
console.log(slice([1, 2, 3], 2, 0));               // []
console.log(slice([1, 2, 3], 5, 1));               // []
console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

const arr1 = [1, 2, 3];
console.log(slice(arr1, 1, 3));                     // [2, 3]
console.log(arr1);                                  // [1, 2, 3]
*/

function splice(array, startIdx, delCount, ...valsToAdd) {
  if (startIdx > array.length) startIdx = array.length;
  if (delCount > array.length - startIdx) delCount = array.length - startIdx;
  let newArray = [];
  let deletedItems = [];
  for (let idx = 0; idx < startIdx; idx++) {
    newArray.push(array[idx]); // add the items until the starting index
  }
  for (let idx = startIdx; idx < startIdx + delCount; idx++) {
    deletedItems.push(array[idx]); // record the fallen
  }
  for (let idx = 0; idx < valsToAdd.length; idx++) {
    newArray.push(valsToAdd[idx]); // if we are adding any more items, add them now
  }
  for (let idx = startIdx + delCount; idx < array.length; idx++) {
    newArray.push(array[idx]);  // if we are removing any items, factor them out and add the remaining
  }
  array.length = 0; // neutralize the array
  for (let idx = 0; idx < newArray.length; idx++) {
    array.push(newArray[idx]); // rebuild the town
  }

  return deletedItems;
}

// Splice Tests
console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

const arr2 = [1, 2, 3];
console.log(splice(arr2, 1, 1, 'two'));             // [2]
console.log(arr2);                                  // [1, "two", 3]

const arr3 = [1, 2, 3];
console.log(splice(arr3, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr3);                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
console.log(splice(arr4, 1, 0));                    // []
console.log(splice(arr4, 1, 0, 'a'));               // []
console.log(arr4);                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
console.log(splice(arr5, 0, 0, 'a'));               // []
console.log(arr5);                                  // ["a", 1, 2, 3]
