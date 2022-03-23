// Basic Array Uses

const firstElementOf = arr => arr[0];
// console.log(firstElementOf([1, 2, 3]) === 1);
// console.log(firstElementOf([]) === undefined);

const lastElementOf = arr => arr.length > 0 ? arr[arr.length - 1] : undefined; // i guess this check was not necessary; silly me--thinking JS would throw an error
// console.log(lastElementOf([1, 2, 3]) === 3);
// console.log(lastElementOf([]) === undefined);

const nthElementOf = (arr, n) => {
  if (n < 0 || n >= arr.length) {
    return undefined; // lol, can't get it through my head, can i? new slogan: "there are no edges in javascript"
  } else {
    return arr[n];
  }
}
// console.log(nthElementOf([1, 2, 3], 1) === 2);
// console.log(nthElementOf([], 7) === undefined);

let test = [1, 2, 3, 4, 5];
test[-1] = 42;
// console.log(test[-1]);
// console.log(test['-1']); // even coercing from strings?

const firstNOf = (array, n) => {
  let result = [];
  for (let idx = 0; idx < n && idx < array.length; idx++) {
    result.push(array[idx]);
  }
  return result;
}
// console.log(firstNOf([3, 33, 333, 2, 22, 222, 1, 11, 111], 7));
// console.log(firstNOf([1, 42, 1], 7));
// outsmart me once, shame on me. outsmart me twice, double shame on me.

const reverse = arr => {
  let result = [];
  for (let idx = arr.length - 1; idx > -1; idx--) {
    result.push(arr[idx]);
  }
  return result;
}
const lastNOf = (array, n) => reverse(array).slice(0, n);
// console.log(lastNOf([3, 33, 333, 2, 22, 222, 1, 11, 111], 7));
// console.log(lastNOf([1, 42, 1], 7));

const endsOf = (array1, array2) => {
  return [array1[0], array2[array2.length - 1]];
}
// console.log(endsOf([0, 1, 2], [3, 4, 5, 0]));
// console.log(endsOf([77777777, 5, 1], [1, 5, 77777777]));
