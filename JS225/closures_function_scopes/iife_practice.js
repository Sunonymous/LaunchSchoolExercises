'use strict';

const log = (v) => console.log(v);

// 1
// Noo... because it only works with function declarations if they are surrounded by parentheses.

// 2
(function() {
  console.log("Sometimes, syntax isn't intuitive!")
})();

// 3
var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

sum += (function sum(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
})(numbers);

// 4
((n) => {
  for (n; n > -1; n -= 1) {
    log(n);
  }
  log('Done!');
})(-3);
// it wasn't always -3. I set it to that to prevent this first one from running (to test the recursive version)

// 5
// No, because since it is a function expression, it was never assigned to any particular variables.
// It is invoked immediately and forever fades into oblivion, never to face the glory of invocation again...

// 6
(function cdown(n) {
  if (n <= -1) {
    log('Done!');
  } else {
    log(n);
    cdown(n - 1);
  }
})(11);
