// the first functions worked before they were redefined--I swear!!
// 1
function average(a, b, c) {
  return (a + b + c) / 3;
}

console.log(average(42, 41, 47));

// 2
function sum(a, b, c) {
  return a + b + c;
}
function average(a, b, c) {
  return sum(a, b, c) / 3;
}
console.log(average(42, 41, 47));

// 3
// had some trickiness with this one in particular
function average(array) {
  return sum(array) / array.length;
}
console.log(average([42, 41, 47]));

// 4
function sum(array) {
  let total = 0;
  for (let index = 0; index < array.length; index++) {
    total += array[index];
  }
  return total;
}
console.log(average([42, 41, 47, 23, 55]));

// 5
let temperatures = [32, 59, 42, 17, 21, 90, 72]; // glad I don't live here
console.log(average(temperatures));
