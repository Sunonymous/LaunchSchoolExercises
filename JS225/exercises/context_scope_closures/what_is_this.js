'use strict';

// I am thinking that in "this" case, `this` refers to the global object, because we're not within a function... unless we're in Node? Weird.
// Because of that, there won't be any properties like the ones we are trying to access, so we get `undefined` + `undefined`. `NaN` party, anyone?

const person = {
  firstName: 'Rick ',
  lastName: 'Sanchez',
  fullName: this.firstName + this.lastName,
};

console.log(person.fullName);
