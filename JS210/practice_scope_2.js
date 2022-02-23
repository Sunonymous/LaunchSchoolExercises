// 1
// analysis:
// say assigned to function
//   (remembering that source code determines scope, so even though the if statement is never executed, a should still filter into scope...)
//   so the question is whether or not it will raise an exception, because it will never be assigned to that string. since it is a var, i will guess that it will log 'undefined'
// results:
//   correct!

// 2
// analysis:
// say assigned to function
// a hoisted to top of block (doesn't really move it)
// because of that, a can't be referenced anywhere else and should raise an exception
// results:
//   correct!

// 3
// analysis:
// hello assigned to function
//   later in the function a is declared via var, so it's hoisted to the top of function hello
//   logs 'hello' because of reassignment
//   it is never reassigned to 'hello again'
// the log outside of the function should raise an exception because var within a function cannot leave the function
// results:
// correct! (lazy about indentation now)

// 4
// analysis:
// hello assigned to function
//   a declared with block scope inside statement which will not execute
//   i think because of that declaration, the first reassignment is considered invalid/out of scope
//   so nothing should be logged besides two exceptions.
//
// results:
//   ugh, i was wrong. so does that mean that after hoisting the function, a is still not seen as an identifier within the if statement?

// 5
// analysis:
// a is assigned 'hello' under global scope
// for loop shadows a and basically does nothing
// 'hello' is logged
// results:
//   wrong!
// man, no wonder people hate var now. should we swear an oath?
// i guess i confused the for statement for a function in my mind, so it isn't in a lower scope.
// still seems strange to me that a var declaration could be made twice with the same identifier

// 6
// analysis:
// a is assigned 'hello' at top scope
// ... this one should result like i expected the last one too, because of logical scoping rules
// logs 'hello'
// results:
//  correct!

// 7
// analysis:
// a is assigned 1 at top scope
// foo is assigned function
//   a is reassigned to 2
//   bar is assigned to a function
//     a is reassigned to 3
//     4 is returned
//   the value of invoking bar is returned (4)
// the value of invoking foo is logged (the value of invoking bar aka 4)
// a is logged as 3
// results:
// correct!

// 8
// analysis:
// a is assigned 'global' at top scope
// checkScope is assigned function
//   a is shadowed and assigned 'local'
//   nested is assigned a constant function
//     a is shadowed AGAIN as 'nested'
//     OMG
//     superNested is assigned a function within nested function scope
//       a reaches outward to `nested`'s shadow and reassigned 'superNested'
//       a ('superNested') is returned
//     the value returned by invoking superNested is returned ('superNested')
//   the value returned by invoked nested is returned (also 'superNested'?)
// this code is horrible
// we log the return value of checkScope, which is the return value of nested, which is the return value of superNested, which is 'superNested'
// those reassignments of a are all occurring within functions which redeclare a underneath the global, which i don't think has changed.
// so i think the answer is 'superNested', 'global'
// results:
// surprisingly, correct!

// 9
// analysis:
// a is assigned 'outer' at top scope
// b is assigned 'outer' at top scope
// a is logged
// b is logged
// setScope is invoked, passing a 'outer'
// it's a function parameter, so 'a' is not altered
// b, however, seems to be altered, so the second time it should output 'inner'
// logged:
// 'outer'
// 'outer'
// 'outer'
// 'inner'
// results:
// correct!

// 10
// analysis:
// total assigned to 50 at top scope
// increment assigned to 15 at top scope
// incrementBy assigned to function
//   (noting that incrementBy returns undefined)
//   total is reassigned to add value passed to function
// logs:
//   50
//   60
//   15
// results:
// correct!

// 11
// analysis:
// a assigned to 'outer' at top scope
// setScope assigned to function
//   reassigns a to 'inner'
// logs:
// 'outer'
// 'inner'
// results:
// wrong!
// Oh! because setScope is a var, it's hoisted and referenced as undefined when invoked!
// I didn't catch that...
