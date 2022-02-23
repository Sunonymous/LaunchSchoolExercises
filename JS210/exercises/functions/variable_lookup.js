// response:
// Shouldn't have any trouble reaching outwardly to grab that scrumptious var
// 'This is global'
// result:
// got it!

// (continued, but not a part two apparently)
// response:
// I remember reading in the assignments that when a variable is assigned before it is declared,
//   JS dubs it a global var in a feat of excited stupor.
// Should still log 'This is global'
// results:
// I was correct, though slightly off about the mannerisms of JS. The stupor results in
//   the addition of the value to be a /property/ of the global object. Not a var.
