'use strict';

// the location may have to be altered within each distinct folder
const TESTER = require('../../testerV2');
const t = TESTER.makeTestSuite();

/*
Problem-->
Given an object and a string property name referencing a method it contains,
  assign the caller of this method a reference to the given function,
  and execute it in the environment of the given object.
-- I/O
---- Input  -> An object containing the desired method, the method property name, any arguments needed.
---- Output -> A new function bound to the passed object's method and execution context, with the given arguments.
---- Edges  -> Improper Input (invalid object/method, method missing)

-- Rules
The context of the method invocation should remain with the object referenced as the first object of the function.
Additional arguments are optional.

-- Questions
Should we extend the function by allowing the caller to pass varying arguments?
  This would bind simply the reference and context rather than the arguments as well.

-- Notes
These problems in particular are more about the language than the problem solving itself.
We must demonstrate our understanding of the construction of the language to get this right.
Firstly, because the property value is assigned the value of a function invocation,
  we'll need to return a function as the result of delegate in order to afford it multiple invocations.
Secondly, I'm noticing that because it binds its arguments, the function is not extensible.
Were it to simply bind a reference to a function within another object, the function may be called using other arguments at will.
  This seems superior in terms of design.


Examples-->
---- Tests for Invalid Input
t.addTest(func, expected, args);
---- Tests for Normal Operation
t.addTest(func, expected, args);

Data Structure-->

Algorithm-->
Again, we're doing very little other than configuring the setup of a method's context.


✓Functions-->
[] Signature
----- Description
*/

// Helpers
const log   =       (val) => console.log(val);

// Edges
const edgeCheck = (context, prop, ...args) => {
  if ([context, prop, context[prop]].map(e => typeof e).includes(undefined)) return undefined;
  if (typeof prop !== 'string')            return undefined;
  if (typeof context[prop] !== 'function') return undefined;
  return null;
}

// Primary
function delegate(context, prop, ...args) {
  const isEdge = edgeCheck(context, prop, args);
  if (isEdge !== null) return isEdge;
  
  return () => context[prop].call(context, ...args);
}

function delegateReference(context, prop) {
  const isEdge = edgeCheck(context, prop);
  if (isEdge !== null) return isEdge;

  return (...args) => context[prop].call(context, ...args);
}


// Tests
const    sun = {
  innerCircle: ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'],
  isBurning(obj) {
    const result = this.innerCircle.includes(obj) ? 'is' : 'is NOT';
    return `Sun says: "${obj} ${result} part of my inner planetary circle."`;
  },
}
const  earth = {
  orbit() {
    return 'Going around Sol!';
  },
}
const   moon = {
  orbit() {
    return 'Going around Earth!';
  },
}
const  human = {
  mingle: delegate(earth, 'orbit'),
  frolic: delegate(moon,  'orbit'),
}
const systemReader = {
  sol: delegateReference(sun, 'isBurning'),
}

log(human);
log('Test Results!'); // haven't written that in a while!
log(human.mingle() === 'Going around Sol!');
log(human.frolic() === 'Going around Earth!');
moon.orbit = () => 'Rerouting to Jupiter.';
// Test if reference is maintained.
log(human.frolic() === 'Rerouting to Jupiter.');
// Test ability to use new arguments.
log(sun.isBurning('Earth'));
log(systemReader.sol('Jupiter'));
log(systemReader.sol('Tatooine'));

// Improper Input
t.addTest(delegate, undefined, earth, 42);
t.addTest(delegate, undefined, earth, undefined);
t.addTest(delegate, undefined, undefined, 42);
t.addTest(delegate, undefined, earth, 'whirlygig');
// t.runSuite();
