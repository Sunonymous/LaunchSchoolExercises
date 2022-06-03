'use strict';

const log = (v) => console.log(v);

// Even though the `array` array is block-scoped, the `makeArrays` function returns a function which contains a closure of it.
// This effectively prevents it from being garbage collected until the end of the program's execution.
