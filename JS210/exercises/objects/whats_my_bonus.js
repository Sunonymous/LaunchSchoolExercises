// What's My Bonus

function calculateBonus() {
  return arguments[1] ? arguments[0] / 2 : 0;
}

console.log('Test Results:');
console.log(calculateBonus(2800, true) === 1400);               // 1400
console.log(calculateBonus(1000, false) === 0);              // 0
console.log(calculateBonus(50000, true) === 25000);              // 25000

// Here we are making use of JavaScript's traditional functionality of using the arguments variable.
// It is a variable that is available inside of any function which is a wannabe-array used to sort of hold the arguments given to a function.
// It is not recommended for common usage because it is incredibly mysterious and vague.
// Why does the entirety of JavaScript have lenient arity, anyways?
