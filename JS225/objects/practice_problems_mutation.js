'use strict';

const log =    (v) => console.log(v);

// 1
// Should log
// Hello from the function scope!
// Hello from the global scope!


// 2
// Greetings from the function scope!
// Greetings from the function scope!


// 3
// I recall that let has block scope, though message is outside of `func` so it should
// still be accessible for assignment.
// Should log
// Hello from the function scope!
// Hello from the function scope!


// 4
// Both newObj and obj are the same object, and both of their a's should change to 20.
// However, the variable a on the global scope is not mutable and will not.
// Should log
// false
// true


// 5
// The reference value of animal was changed on line `10`,
// so it is no longer referring to the same object as originally.
// The equality checks on lines `17` and `18` both compare to one object.
// How could two different objects be the same one object?
