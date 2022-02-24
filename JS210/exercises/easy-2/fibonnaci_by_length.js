// Fibonacci Number By Length

function findFibonacciIndexByLength(len) {
  let index = 1;
  let next  = 1n;
  do {
    next = next + next;
    index += 1;
  } while (String(next).length < len);
  return index;
}

console.log('Test Results:');
console.log(findFibonacciIndexByLength(2n) === 7n);
console.log(findFibonacciIndexByLength(3n) === 12n);
console.log(findFibonacciIndexByLength(10n) === 45n);
console.log(findFibonacciIndexByLength(16n) === 74n);
console.log(findFibonacciIndexByLength(100n) === 476n);
console.log(findFibonacciIndexByLength(1000n) === 4782n);
console.log(findFibonacciIndexByLength(10000n) === 47847n);
