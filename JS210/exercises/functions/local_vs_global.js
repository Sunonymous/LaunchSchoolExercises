// Local vs Global Part 1

// response:
// var has function scope, so I'm thinking 'This is local' will be logged after the invocation.
// result:
// I was wrong! Partially right, though. I think I didn't consider that myVar within the function was
//   being declared (as opposed to re-assigned). dumb brain fog.

// Local vs Global Part 2

// response:
// okay, this one is similar, and more straightforward.
// because the logging takes place from within the function itself, JS reaches for the
//   first or closest matching identifier, which in this case is the local scope.
// 'This is local'
// result:
// nailed it!

// Local vs Global Part 3

// response:
// this is what I thought the first one was doing (because I didn't catch the var keyword)
// will reassign the global scope's myVar and log 'This is local'
// result:
// got it!
