'use strict';

// Ancestors
// Erm, my testing module was not created to have functionality working with `this`!

/*
Problem-->
Implement a method to return an array of string values ("Names") of all of the objects in the given object's prototype chain.

-- I/O
---- Input  -> An object
---- Output -> An array of object "names" in the given object's prototype chains
---- Edges  -> Non-object input.

-- Rules
Because objects typically are nameless as requested by this exercise, we may name the objects ourselves.
All objects proto-chains end at `Object.prototype`

-- Questions
How should we reference the name of Object.prototype? Supposedly we may just name it ourselves.

-- Notes
The examples given creates a chain via `Object.create` method.
We must traverse the entire chain.

Examples Below-->

Data Structure-->
We're using objects here. Arrays will be returned by this function.

Algorithm-->
Let's start with an empty array and push references to the prototypes until we reach Object.prototype.
Then we can return mapping these object references to their name properties.
*/

// Helpers
const range = (len, from) => [...Array(len).keys()].map((n) => n + from);
const log   =       (val) => console.log(val);
const last  =       (arr) => arr[arr.length - 1];
const mapToProperty = (obj, property) => obj[property];
const toName        = (obj) => mapToProperty(obj, 'name');

// Preliminary Work
Object.prototype.name = 'Object.prototype';

// Primary
function ancestors() {
  // edge
  if (typeof this !== 'object') return undefined;
  
  let result = [];
  let nextObj = last(result) || this;
  do {
    result.push(Object.getPrototypeOf(nextObj));
    nextObj = last(result) || this;
  } while (last(result) !== Object.prototype);

  return result.map(toName);
}

// for my examples
const galactital    = {name: 'galactical', ancestors};
const milkyWayer    = Object.create(galactital);
milkyWayer.name     = 'milkyWayer';
const solarSystemer = Object.create(milkyWayer);
solarSystemer.name  = 'solarSystemer';
const earther       = Object.create(solarSystemer);
earther.name        = 'earther';
log(galactital.ancestors());
log(milkyWayer.ancestors());
log(solarSystemer.ancestors());
log(earther.ancestors());

log('---');

// for LS examples
const foo = {name: 'foo', ancestors};
const bar = Object.create(foo);
bar.name  = 'bar';
const baz = Object.create(bar);
baz.name  = 'baz';
const qux = Object.create(baz);
qux.name  = 'qux';

log(qux.ancestors());  // returns ['baz', 'bar', 'foo', 'Object.prototype']
log(baz.ancestors());  // returns ['bar', 'foo', 'Object.prototype']
log(bar.ancestors());  // returns ['foo', 'Object.prototype']
log(foo.ancestors());  // returns ['Object.prototype']

// ha! I love the recursion in the LS solution. I considered recursion at first too.
// Great solution.
