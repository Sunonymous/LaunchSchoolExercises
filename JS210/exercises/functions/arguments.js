// Arguments, Part 1
// response:
// the addition towards the function parameter `b` should /not/ affect the value of a,
//   as primitive values are immutable and b does not maintain an attachment to a in
//   any manner. `a` should still log as 7. Sorry for the inconsistent variable surroundings.
// result:
// correct

// Arguments, Part 2
// response:
// this is the exact same. `a` is a function parameter which shadows a global variable.
// the outer should remain unchanged and 7 logs again
// result:
// got it

// Arguments, Part 3
// response:
// here we are passing an array into a function, and because arrays are mutable objects,
//   the function is able to alter the value given to it, so this time a logs as
//   '1, 2, 10'. I can't remember for sure if it omits the brackets when casting to String.
// result:
// correct values, incorrect formatting. brackets and all!
