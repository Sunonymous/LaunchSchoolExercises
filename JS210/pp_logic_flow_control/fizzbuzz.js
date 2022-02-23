// ah, the ol' classic

// never tried recursion with this, though. let's see
// first we'll grab those functions we already wrote

let divisibleByThree = n => n % 3 === 0;
let divisibleByFive  = n => n % 5 === 0;
let divisibleByThreeAndFive = n => divisibleByThree(n) && divisibleByFive(n);
let divisibleByThreeOrFive  = n => divisibleByThree(n) || divisibleByFive(n);

// handy

function fizzbuzz(x = 0) {
  // recursion with side effects. super dangerous. i /am/ aware of this
  let result = '';
  if (divisibleByThree(x)) result += 'Fizz';
  if (divisibleByFive(x))  result += 'Buzz';
  console.log(result || x); // hadn't considered short-circuit here! much prettier
  // kill cases
  if (x >= 100) return;
  return fizzbuzz(x + 1);
}

fizzbuzz();
