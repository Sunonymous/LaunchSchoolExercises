// 1
// analysis:
//   a assigned to 'outer'
//   testScope assigned to function
//   within testScope a is shadowed and declared as 'inner'
//   'outer' is logged
//   testScope is invoked and 'inner' is logged again
//   'outer' is logged
// result:
//   correct!

// 2
// analysis:
//   a assigned to 'outer'
//   testScope assigned to function
//     a is reassigned to 'inner' within testScope due to outward reach of scope
//     a is logged within function
//   'outer' is logged
//   'inner' is logged
//   'inner' is logged
// result:
//   correct!

// 3
// analysis:
//   basket assigned to 'empty'
//   goShopping assigned to function
//     shop1 assigned to function within goShopping
//       basket reassigned to 'tv' within shop1 function
//     value of basket is logged (at this point, it is 'empty' because the shop1 function has not been invoked)
//     shop2 assigned to function within goShopping
//       basket reassigned to 'computer' within shop2 function
//     shop3 assigned to function within goShopping
//       local shadow of basket is assigned 'play station'
//       'play station' is logged
//     goShopping invokes shop1, mutating basket to 'tv'
//     goShopping invokes shop2, mutating basket to 'computer'
//     goShopping invokes shop3, logging 'play station'
//     value of basket is logged (since mutated by shop2, should log 'computer')
// logs:
//   'empty'
//   'play station'
//   'computer'
// result:
//   correct!

// 4
// analysis:
// hello assigned to function
// a assigned to 'hi' (because a was not declared, JS creates a global var a)
// logs:
//   'hi'
// results:
//   correct!

// 5
// analysis:
// hello assigned to function
//   a assigned to 'hello' within hello
// hello function invoked
// logs nothing because a is not in scope
// results:
//   correct!

// 6
// analysis:
// during the creation phase, JS finds identifier a and places it in global scope
// because a is logged before declaration, 'undefined' is logged because a is declared using var.
// results:
//   correct!

// 7
// analysis:
// similar to last problem, though because let was used in the declaration instead of var, an exception should be raised
//   because the variable is not set yet
// results:
//   correct!

// 8
// analysis:
// tricky one...
// hello is assigned to function
//   a is not previously declared and is assigned, becoming a global object
// not sure about referencing it before declaration, because it was never declared...
// i'll guess that it works.
// logs:
//   1
// results:
//   wrong!
// Okay, it's an error, then. Not like I'll write code like this intentionally, anyway.
// Oh, didn't catch that hello was not invoked. That would have made the answer more obvious.
// need a break soon
