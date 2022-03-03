// Counting Up

const inc = n => n + 1;
const sequence = n => [...Array(n).keys()].map(inc);

console.log(sequence(5));    // [1, 2, 3, 4, 5]
console.log(sequence(3));    // [1, 2, 3]
console.log(sequence(1));    // [1]
