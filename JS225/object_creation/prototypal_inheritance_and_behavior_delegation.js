'use strict';
// oh my goodness, what a title!

const log = (v) => console.log(v);

// Problems!

// 1
let foo = {};
let bar = Object.create(foo);

foo.a = 1;

// console.log(bar.a);
// should log 1, because bar reaches up the proto-chain and can access bar's property `a`

// 2
foo = {};
bar = Object.create(foo);

foo.a = 1;
bar.a = 2;
// console.log(bar.a);
// should log 2 because bar's `a` property will be referenced before `foo`'s `a` property

// 3
let boo = {};
boo.myProp = 1;

let far = Object.create(boo);

// lots of (ghost) code

far.myProp;       // 1
// log(Object.hasOwnProperty('myProp') === false);
// we may use Object.hasOwnProperty('myProp') to determine whether or not the property is present on the object `far` itself.




// REAL PRACTICE PROBLEMS

// 1
function getDefiningObject(object, propKey) {
  while (object !== Object.prototype) {
    if (object.hasOwnProperty(propKey)) {
      return object;
    } else {
      object = Object.getPrototypeOf(object);
    }
  }
  return null;
}

foo = {
  a: 1,
  b: 2,
};

bar = Object.create(foo);
let baz = Object.create(bar);
let qux = Object.create(baz);

bar.c = 3;

log(getDefiningObject(qux, 'c') === bar);     // => true
log(getDefiningObject(qux, 'e') === null);             // => null

// Didn't originally notice that `Object.getPrototypeOf()` returns null at the end of the chain.

// 2
function shallowCopy(object) {
  const result = Object.create(object);
  Object.keys(object).forEach((k) => result[k] = object[k]);
  return result;
}

foo = {
  a: 1,
  b: 2,
};

bar = Object.create(foo);

bar.c = 3;
bar.say = function() {
  console.log('c is ' + this.c);
};

baz = shallowCopy(bar);

log(Object.keys(baz));
log(baz.a === 1);       // => 1
baz.say();                // => c is 3
log(baz.hasOwnProperty('a') === false);  // false
log(baz.hasOwnProperty('b') === false);  // false

// 3
function extend(destination, ...sources) {
  if (!sources.every((em) => typeof em === 'object')) return undefined;
  sources.forEach((obj) => Object.keys(obj).forEach((k) => destination[k] = obj[k]));
  return destination;
}

foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

let joe = {
  name: 'Joe'
};

let funcs = {
  sayHello() {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye() {
    console.log('Goodbye, ' + this.name);
  },
};

let object = extend({}, foo, joe, funcs);

log(extend({}, 1, 2, 3) === undefined); // custom test!!
log(object.b.x === 1);                  // => 1
object.sayHello();                      // => Hello, Joe

// curious is `Object.keys` is inappropriate for use here, seeing as it was in none of the solutions.
// Perhaps because it only copies enumerable properties?
