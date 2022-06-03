'use strict';

const log = (v) => console.log(v);

// constructor function
function Person(firstName, lastName = '') {
  this.firstName = firstName;
  this.lastName = lastName;
  this.fullName = function() {
    return (this.firstName + ' ' + this.lastName).trim();
  };
}

let john = new Person('John', 'Doe');
let jane = new Person('Jane');

john.fullName();              // "John Doe"
jane.fullName();              // "Jane"

john.constructor;             // function Person(..)
jane.constructor;             // function Person(..)

john instanceof Person;       // true
jane instanceof Person;       // true

// Mini Problems

// 1
// Constructor functions are distinguished by having their names in PascalCase.

// 2
function Lizard() {
  // this is adding a property to the global object
  this.scamper = function() {
    console.log("I'm scampering!");
  };
  // also no implicit return value
}

// let lizzy = Lizard(); // lizzy is an undefined lizard. how quaint
// lizzy.scamper();      // ? indeed

// because I am in strict mode, we cannot add properties to `undefined` (as the implicit context of the regular function invocation)
// it gives me a lovely error as a result

// 3
function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
  return this;
}

let lizzy = new Lizard();
lizzy.scamper(); // ?
// lo and behold -- the scampering commences!
