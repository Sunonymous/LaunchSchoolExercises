'use strict';

// this stuff is actually super cool

// 1
// uh, the `bind` function binds functions to contexts. permanently!

// 2
// trick question. you told me that `bind` merely returns the new function with the given context. it does not invoke it!

// 3
// logs: 5
// line `10` binds the `foo` function to the `obj` object, irrevocably tying them together like proverbial peanut butter and jelly.
// because of their inseparability, the `bar` function can access the `a` and `b` properties of the `obj` object via `this`

// 4
// What a strange example! I hope no one programs like that.
// The `foo` function, as declared on lines `9` to `11`, simply logs the value at the `message` property of the execution context.
// Line `13` binds the `foo` function to the execution context of the `positiveMentality` object.
// That particular "version" of the bound `foo` function is assigned to the `logMessage` property of the `negativeMentality` object.
// Even though the `negativeMentality` object invokes `logMessage` as a method, its execution context has been permanently assigned to the `positiveMentality` object,
//   which means that it will log, "JavaScript makes sense!"

// 5
// I'm imagining that this snippet exists to show us that bind is irrevocable. Even if `call` is used, as seen on line... erm, the last line, the execution context has already been bound to the `obj` object.
// 'Amazebulous!'
