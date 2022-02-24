// Double Doubles

// Given a number, multiply it by two unless it is a double number, in which case, return it.
// Double numbers are numbers with an even number of digits, which, when split in half, have matching digits.

// Logic:
// reject numbers with odd number of digits
// map numbers to their characters (will need casting to string)
// return whether the first half matches the second half

const hasOddNumberOfDigits = n => String(n).split('').length % 2 !== 0;
// console.log(hasOddNumberOfDigits(5));
// console.log(hasOddNumberOfDigits(55));

const isDoubleNum = num => {
  const cast = String(num);
  const half = cast.length / 2;
  return cast.substring(0, half) === cast.substring(half);
}

function twice(num) {
  if (hasOddNumberOfDigits(num)) {
    return num * 2;
  } else {
    return isDoubleNum(num) ? num : num * 2;
  }
}

console.log('Test Results:');
console.log(twice(37) === 74);
console.log(twice(44) === 44);
console.log(twice(334433) === 668866);
console.log(twice(444) === 888);
console.log(twice(107) === 214);
console.log(twice(103103) === 103103);
console.log(twice(3333) === 3333);
console.log(twice(7676) === 7676);
