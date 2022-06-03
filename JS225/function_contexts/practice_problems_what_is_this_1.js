'use strict';
// force of habit now


// 1
// Because the function must be invoked without an explicit receiver, `this` implicitly refers to the `window` object.
// Hmm... guess my thinking was a little forward. It is understood that context is set via the manner of execution, eg. function vs method.
// It seems that the question was read as, 'should the method be invoked as is declared here, what would `this` be?'
// The situation is understood.

// 2
// The original answer to the first question is the answer to this question.

// 3
// It does not matter the level of nesting, function invocation implicitly sets `this` to the global object, in this case, `window`.
// Unless we're in responsib—erm, strict mode.

// 4
// Because `method` is called as a method, the receiver is set to `this`, so here it shall be the `obj` object.

// 5
// Since `a` is declared as a block scoped variable and not a property/var of the global object, the function `foo` has no access to it.
// Even though the context of `foo` is implicitly set to the global object, it has no property of `a` with which to reference.
// It therefore throws a ReferenceError because of Strict Mode.

// 6
// This time is different. Though the `bar` function remains the equivalent as the `foo` function in the previous question,
//   the manner of execution of the function differs.
// The `bar` function is set to the value of the `foo` property of the `obj` object.
// Because the `foo` property is executed as a method on the `obj` object, that same `obj` is set as the execution context, and it is able to access the `a` property.
// Should log `2`, as that is the value that the `a` property of the `obj` object references.

// 7
// Line `12` invokes the `bar` method on the `foo` object. This has the execution context set to the `foo` object.
//   Inside that function, the value of the method invocation of `foo.baz()` is logged, which simply returns the context itself.
// The first log should log the `foo` object.
// Line `13` strips the function `bar` from the `foo` object of its context and assigns it to the variable `qux`.
// Line `14` invokes the `qux` function. Because this function no longer has the context of the `foo` object,
//   it is unable to find a value at the property of `baz` on the new context of the global object, and logs `undefined`
// Oh, I had the general idea right, though I was slightly incorrect in that JS returns a TypeError when it tries to "invoke" undefined as a function.
