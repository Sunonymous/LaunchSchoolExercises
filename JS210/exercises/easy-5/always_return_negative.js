// Always Return Negative

const negative = n => n < 0 ? n : -n;

console.log('Test Results');
console.log(negative(5) === -5);     // -5
console.log(negative(-3) === -3);    // -3
console.log(negative(0) === -0);     // -0
