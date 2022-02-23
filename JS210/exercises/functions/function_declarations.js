// Function Declarations (why do I type these twice??)
// response:
// should log 'Hello, world!' (so friendly!) because functions are hoisted also, in completion
// result:
// got it

// further exploration:
// testing my memory here...
// I think functions have 'hoisting' priority, meaning they move to the top of the file.
// should it print the type of logValue, it would be either function or String, though I'm
//   not totally convinced it wouldn't error all over this. It's redeclaration of an existing identifier, no?
// result:
// i wasn't sure about it, though I was in error to suppose an error. Guess it's string.
// okay, i reviewed the lesson
// the difference is that this (redeclaration) is permitted with a var declaration.
// because logValue was originally declared to contain a function, the redundant redeclaration via
//   var is (apparently) perfectly acceptable (in terms of valid syntax). were this to have
//   been done with a let or const instead, JS would have cried me a binary river.
