'use strict';

const log = (v) => console.log(v);

// 1
let prot = {};

let foo  = Object.create(prot);

// 2
log(Object.getPrototypeOf(foo) === prot);

// 3
log(prot.isPrototypeOf(foo));

// 4
// prot is created as an empty object literal, which inherits the prototype of `Object.prototype`
prot = {};

// foo is created as a new object inheriting prot as a prototype
foo = Object.create(prot);

// this should return true because prot is the prototype of foo
log(prot.isPrototypeOf(foo));
// this should also return true, because JS traverses up the proto-chain and `Object.prototype` is the root of all probl--erm, prototypes.
log(Object.prototype.isPrototypeOf(foo));
