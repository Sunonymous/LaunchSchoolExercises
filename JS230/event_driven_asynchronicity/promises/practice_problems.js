'use strict';

// 1
const prom = new Promise((resolve) => {
  return setTimeout(() => resolve('Launch School'), 2000);
}).then((n) => console.log(n));

// 2
const promi = new Promise((resolve, reject) => {
  return setTimeout(() => reject('Error: Not Launch School'), 2000);
}).catch((e) => console.log(e));

// 3
// I thought this example was about not returning the resolution, though I guess it's about code execution order.
// 'I am NOT a Promise'
// 'I am a Promise'

// 4
// I misunderstood this one and got it wrong.
// Correct answer is:
// 'foo'
// 'bar'
// 'qux'
// 'baz'

// 5
// 'foo'
// 'bar'
// 'abc'
// 'qux'

// 6
// Got this one wrong too.
// '1'
// '3'
// '6'
// undefined

// 7
// This depends on whether the state of the promise can change.
// If it must stay the same after a result, then it should log 'Got it!'
// If it may change, it would log 'Again!'
// Turns out it was the first one.

// 8
// Very tricky... I think after two seconds it will log 18.

// 9
// I think this is the same thing as the last. Awaiting an expression which is just a value should immediately fulfill.

// 10
// Function `test1` will log 12 after approximately four seconds, and `test2` will log 18 approximately six seconds (4 + 2) after the program starts.
// Ha, right. Inverted results here. Asynchronous code may fulfill in orders different than lexical order of the code. That's kind of the point!

// 11
// Neither function has a return statement... Does it log the obvious, or am I missing something?
// Ah, `test1` runs the synchronous bit first. Right.
// '2'
// '1'
// '1'
// '2'
// What I am unsure of is whether the first '1' that is logged came from `test1` or `test2`.

// 12
// IIFE awaits `test` which fulfills to 'A', logs it, then logs 'B' via finally.

// 13
// This takes the other branch and logs 'E', then 'B' via finally.
