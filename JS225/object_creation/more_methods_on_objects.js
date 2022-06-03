// 'use strict';
// disabled because program fails otherwise

const log = (v) => console.log(v);

// Read-only `log`
function newPerson(name) {
  let obj = {name: name};

  Object.defineProperties(obj, {
    log: {
      value: function() {
        log(this.name);
      },
      writable: false,
    }
  });

  return obj;
}


let me = newPerson('Shane Riley');
me.log();     // => Shane Riley
me.log = function() { console.log('Amanda Rose'); };
me.log();     // => Shane Riley

// FREEZE
let frozen = {
  integer: 4,
  string: 'String',
  array: [1, 2, 3],
  object: {
    foo: 'bar'
  },
  func() {
    console.log('I\'m frozen');
  },
};

Object.freeze(frozen);
frozen.integer = 8;         // surprising that this runs without notice!
frozen.string = 'Number';   // surprising that this runs without notice!
frozen.array.pop();
frozen.object.foo = 'baz';
frozen.func = function() {
  console.log('I\'m not really frozen');
};

/*
log(frozen.integer);      // => 4
log(frozen.string);       // => String
log(frozen.array);        // => [1, 2]
log(frozen.object.foo);   // => baz
frozen.func();                    // => I'm frozen
*/

// I get the distinction. We can't change primitive types, though since objects are composite values with reference we're able to mutate them.
// We can't reassign the reference themselves, though we can change the hell out of anything they contain, because that's mutability for ya.
// Noting here that freezing objects is permanent.

// Personal Testing
// Do constructors allow non-object returns?
function Test() {
  this.name  = 'hopeful';
  this.tests = true;
  return 42;        // doesn't do anything
  return 'sup';     // doesn't do anything
  // return [1, 2, 3]; // this actually does work, since arrays are objects
}
// this runs smoothly
const obj  = new Test();
const obj2 = Test();
log(obj);
log(obj2);
// strange! constructor functions, at least when used with the new operator, must return either this or an object.
// no other return types are permitted
// without the new operator it will return whatever, as it can't be distinguished as a constructor function

// next question! How easy is it to reference properties on "upstream" objects?
function makeBabyTest() {
  const baby = new Test();
  baby.name  = 'slobbery';
  baby.tests = 'not yet';
  return baby;
}
const obj3 = makeBabyTest();
log(Object.getPrototypeOf(obj));
log(obj3.name);

log(Object.getPrototypeOf(obj3).name);
