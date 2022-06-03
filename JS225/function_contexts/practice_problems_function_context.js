'use strict';

// 1
// The window object is logged since the function is invoked without explicitly setting the context, which indicates the JS will implicitly set the context to the global/window object.

// 2
// Implicit context becomes undefined in strict mode.

// 3
// This should log something like [object Object]. Because the `foo` method inside the `obj` object is invoked with `obj` as its explicit receiver, JS sets the context to the `obj` object.
// Despite the alignment with lexical scoping rules, the execution context is set here because of the explicit receiver, and the fact that the function was not invoked outside of the context in which it was originally initialized.

// 4
// Line `7` invokes the `deliverMessage` function, which logs the value at the `message` property of the execution context object. Because the function is invoked without a explicit receiver, JS sets the execution context to the global object.
// Because the global object contains a string at the property `message`, as assigned on line `1`, 'Hello from the global scope!' is logged.
// Line `13` sets the property `deliverMessage` of the newly initialized `bar` object to the same function as declared on line `3`. Because line `15` invokes `deliverMessage` as a method on the bar object, it logs, 'Hello from the function scope!' instead,
//   as the execution context is now the `bar` object.

// 5
// Line `14` logs the return value of the `add` function from the global scope. That version of the function has access to the property `a` on the global object, though it does not have access to `b`, because `b` was declared as a variable with local scope.
// Because of lexical scope, the `add` function can reference `b` so it adds 10 + 10 to return (and log) 20.
// Changing the declaration from line `1` from `var` to `let` will cause `a` to become a variable with local scope, and when `this` is used to reference it, the property is no longer present. JS coerces them to `NaN` and returns/logs `NaN` as a result of the operation.
// Line `15` invokes the method `add` on the `c` object, which localizes its execution context and adds the values at the local property `a` and the global `b` to return and log 0.

// 6
// We learned about `call` and `apply` to explicitly set the execution context of a function.

// 7
// console.log(bar.add.call(foo)); // logs 3 because it is referencing foo's properties in that context

// 8
// outputList.apply(fruitsObj, fruitsObj.list);
// seems like it could also be
// outputList.call(fruitsObj, ...fruitsObj.list);
//
// Either will work. Because `apply` requires an array implicitly, its simpler to use because we can set the context to the appropriate object (whose properties are referenced within the function), and provide the needed arguments as the array at the `list` property.
// The function references the built-in/old style `arguments` object, which indicates that the arguments to `outputList` need to be multiple, ie. they must be individual arguments. Apply assists us with this functionality.
// Call works as well, though we have to spread the elements inside `fruitsObj.list` in order to achieve the same effect.

// 9
// Since `slice` is a prototype method on arrays, it is referenced by calling it on an empty array. Setting the execution context explicitly to the `arguments` object should allow us to access the elements inside that "array".
