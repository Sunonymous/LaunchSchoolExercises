'use strict';

// 1
// In "sloppy" mode, the implicit execution context is the global object. When strict mode is enabled, it sets the implicit execution context to undefined. This can prevent certain unwanted behavior, such as creating unnecessary properties of the global object.
// Oh, I guess the global object is only Node. Right. `window` is the browser's implicit-context.

// 2
// I think it should log true. Because `a` is not declared, JS sets the property on the implicit context object (in this case, window) to the value 10.

// 3
// This code will raise an exception, as window is no longer available as the implicit execution context.

// 4
// This will also raise a reference error, because `b` is declared with block scope from within a function and is therefore inaccessible from outside of the function.

// 5
// This one I am not entirely sure about. Is the implicit execution context always the `window` object, even from within a function? If so, then `b` should be accessible.
// It seems like that should return 1.

// 6
// Implicit execution context is no longer allowed in strict mode, so here we get another"use strict"

function func() {
  b = 1;
}

func();

console.log(b);
