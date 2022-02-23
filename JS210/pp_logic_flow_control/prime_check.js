// Prime Check
// okay, this one /totally/ fits recursion

// seriously.

function isPrime(n) {
  if (n === 0 || n === 1) return false;
  for (let i = 2; i < n; i++) {
    if (n % i === 0) return false;
  }
  return true;
}

// if x is less than or equal to 1, return false
// if x divided by the index has no remainder, return false
// if x is greater than or equal to half of the number, return true

const oneOrLess                = x      => x <= 1;
const evenlyDivides            = (x, y) => x % y === 0;
const halfANumber              = x      => parseInt(x / 2);
const greaterThanOrEqualToHalf = x      => x >= halfANumber(x);

function isPrime(n, i = 2) {
  if (oneOrLess(n) || evenlyDivides(n, i)) {
    return false;
  } else if (greaterThanOrEqualToHalf(i, n)) {
    return true;
  } else {
    return isPrime(n, i + 1);
  }
}

console.log(isPrime(1));   // false
console.log(isPrime(2));   // true
console.log(isPrime(3));   // true
console.log(isPrime(43));  // true
console.log(isPrime(55));  // false
console.log(isPrime(0));   // false

