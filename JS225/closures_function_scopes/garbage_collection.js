'use strict';

// 1
// `c` and `d` may both be dereferenced after the `run` function finishes.
// The only reference which lasts beyond the execution of the full program is `a`, which references `[1, 2]` at the end of it.

// 2
// JS cannot garbage collect that particular array until the program completes execution.
// Even though there are no references to it outside of the `makeHello` function,
//   `makeHello` returns another function which accesses the elements of its argument array.
// Because of that, the closure created via `makeHello` holds onto its `names` array.

// PRACTICE PROBLEMS Garbage Collection

// 1
// JS is a garbage-collected language. This means that it handles most of the details of memory management on its own, without
// explicit interference from the user. It means that one doesn't need to concern themselves to the degree as a non-garbage-collected language,
// though it is still useful to be aware of.

// 2
// Neither value is eligible for garbage collection on line five. Only the value at `myArr` is eligible to be garbage collected on line 10.

// 3
// The `foo` object is /not/ eligible for garbage collection because the closure created by the `makeGreeting` function retains a reference to it.

// 4
// The empty object will be eligible for garbage collection if `bash` is set to `null` or if the variable goes out of scope and no references exist for it.
