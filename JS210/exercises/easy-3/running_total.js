// Running Total

function runningTotal(array) {
  if (array.length === 0) return [];
  let result = [array[0]];
  for (let i = 1; i < array.length; i++) {
    const val = result[result.length - 1];
    result.push(val + array[i]);
  }
  return result;
}

console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
console.log(runningTotal([3]));                    // [3]
console.log(runningTotal([]));                     // []
