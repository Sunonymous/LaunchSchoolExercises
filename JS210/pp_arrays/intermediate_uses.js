// Intermediate Array Usage

const oddElementsOf = arr => {
  let result = [];
  for (let idx = 1; idx < arr.length; idx += 2) {
    result.push(arr[idx]);
  }
  return result;
}
let digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
// console.log(oddElementsOf(digits));

// I've written this three times now, just to avoid mutation...
const reverse = arr => {
  let result = [];
  for (let idx = arr.length - 1; idx > -1; idx--) {
    result.push(arr[idx]);
  }
  return result;
}

const backToBack = arr => arr.concat(reverse(arr));
// console.log(backToBack([1, 2, 3, 4, 5]));
// ... and now I feel silly :)
// good to get used to slicing for copy pattern though

const sortDescending = arr => arr.slice().sort((em1, em2) => em2 - em1);
// console.log(sortDescending([1, 42, 33, 6, 99, 100000000]));
// wtf javascript??? casting to strings first??? who made that design decision???

const sum = (a, b) => a + b;
const matrixSums = nestedArr => {
  return nestedArr.map(subArr => subArr.reduce(sum));
}
// console.log(matrixSums([[0, 0, 1], [1, 1], [0, 1, 2], [3, 1], [1, 2, 1, 1]]));
// functional style shines here

const uniqueElements = arr => {
  let result = [];
  for (let idx = 0; idx < arr.length; idx++) {
    if (!result.includes(arr[idx])) result.push(arr[idx]);
  }

  return result;
}
console.log(uniqueElements([1, 1, 1, 2, 6, 3, 2, 6, 4, 2, 7, 3, 6, 9]));
