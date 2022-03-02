// The Red Pill

// Let's step through it.
//
// Function one is invoked without arguments.
//   Function anotherAnotherOne is invoked without arguments.
//     A string is built from character codes (87, 101, 108, 99, 111, 109, 101), translating to Welcome
//     Function anotherOne is invoked with the arguments 116 and 111, logging the string concatenation of t and o
//   Function anotherOne is invoked with the arguments 116, 104, 101.
//     This creates a concatenation of t, h, and e and logs it.
//   Function one returns anotherOne and invokes it with the following arguments: (77, 97, 116, 114, 105, 120, 33)
//     This creates a concatenation of M, a, t, r, i, x, and !, and logs it
//
// Logged:
// Welcome
// to
// the
// Matrix!
