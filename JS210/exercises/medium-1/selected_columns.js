// Selected Columns

// This is the first time I've seen two variables being set within the for loop construction.
//   Not sure if that's allowed.
//   Tested and apparently it is.

// The conditional on line 6 is weird. Did they mean to check i[j]?
//   And why are they using ! instead of !!?
// Oh, okay. They are checking to see if an array exists for that particular row.
//   This won't work though, as the value at j is an index which may not align with
//     the indexes of the results array.

// This code is ugly. Letter parameters should only be used functionally.

// Hey, I guess I was totally wrong! Almost time to stop programming today.
// Making too many mistakes... though this code really is ugly.

// Let's fix it.
// Original
// function getSelectedColumns(numbers, cols) {
//   const result = [];

//   for (let outer = 0, length = numbers.length; outer < length; outer += 1) {
//     for (let column = 0, length = cols.length; column < length; column += 1) {
//       if (!result[column]) {
//         result[column] = [];
//       }

//       result[column][outer] = numbers[outer][cols[column]];
//     }
//   }

//   return result;
// }

const array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
const array2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]];

function getSelectedColumns(numbers, cols) {
  return cols.map(i => numbers.map(subArr => subArr[i]));
}

console.log(getSelectedColumns(array1, [0]));
console.log(getSelectedColumns(array1, [0, 2]));
console.log(getSelectedColumns(array2, [1, 2]));
