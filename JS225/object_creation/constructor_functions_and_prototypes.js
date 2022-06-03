// 'use strict';

const log = (v) => console.log(v);

// SET 1
// 1
// local variable `a` is assigned the value of the number 1
let a = 1;
// local variables `foo` and `obj` are declared and unassigned, leaving them `undefined`
let foo;
let obj;

// Function `Foo` is created in the style of a constructor,
//   assigning a property `a` to the number `2`
//   and the `bar` property to a function logging the value at the property of `a`
//   upon construction of an object, the `bar` method is invoked
function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };
  this.bar();
}

// using the `new` operator, variable `foo` is assigned the value of calling the `Foo` constructor function
// this logs 2 during the construction, as `this` is bound to the created object using `new` to create it
foo = new Foo();

// this will also log `2`, because as a method invocation it implicitly sets the execution context to the `foo` object, whose value at property `a` is 2
foo.bar();
// the `Foo` function is invoked as a function, implicitly setting the execution context to the global object
// because `bar` is invoked within the function, and because the `a` assigned in the first line is a local variable and not a gloabl property, `Foo` sets
// the property `a` of the global object to `2` and logs it
Foo();

// local variable `obj` is assigned to an empty object
obj = {};
// `Foo` is invoked with the explicit context of `obj`, an empty object. this has a similar effect to the primary constructor
// this logs 2 as well as part of the normal function's operations
Foo.call(obj);
// the `Foo` function has set property `a` of `obj` to the number `2` during its invocation, and calling the `bar` method on `obj` will log `2` as a result
obj.bar();

// because `a` is a locally-scoped variable, it remains as `1`
// because invoking `Foo` as a function sets the global object's `a` property to `2`, this logs `2`
console.log(this.a);

// logged:
// 2
// 2
// 2
// 2
// 2
// 2

// 2, as in, "question 2"
// local variable `RECTANGLE` is declared and assigned the value of a new object with a method `area`, which returns the product of the local properties `width` and `height`,
//   and the method `perimeter`, which logs the product of 2 and the sum of the local properties `width` and `height`
let RECTANGLE = {
  area() {
    return this.width * this.height;
  },
  perimeter() {
    return 2 * (this.width + this.height);
  },
};

// function `Rectangle` is declared in the constructor style
//   setting the context property `width` and `height` to the given arguments of the same name
//   the `area` and `perimeter` properties of the context are set to the results of the invocations of their respective calls to the `RECTANGLE` object
function Rectangle(width, height) {
  this.width  = width;
  this.height = height;
  // original code
  this.area = RECTANGLE.area.call(this);
  this.perimeter = RECTANGLE.perimeter.call(this);
  // another solution
  // this.area      = (() =>      this.width * this.height)();
  // this.perimeter = (() => 2 * (this.width + this.height))();
}

// local variable `rect1` is declared and assigned the value of a "Rectangle" object created via the `new` operator with the `Rectangle` function
// it is given 2 for its width and 3 for its height
let rect1 = new Rectangle(2, 3);
// because the necessary properties are initialized immediately preceding the `area` and `perimeter` method invocations, JS is able to access the values at the appropriate properties
// what is unclear is whether the fact that these functions are invoked with implicit context overrides the context set by the `new` operator to the new object in process
// we will assume not for now
// because the context is the same as the forming object, the `area` property is set to `6` and the `perimeter` to `10` and both values are logged
console.log(rect1.area);
console.log(rect1.perimeter);
// ha! my suspicion was accurate. the direct function invocations override the implicit context given by the constructor function
// to fix this, we have many options
// for now, we'll need to move the functions inside `RECTANGLE` into the `Rectangle` constructor
// to keep them as functions, we'll immediately invoke them (IIFEs)
// we could have also explicitly set the execution context of `RECTANGLES` methods



// 3
function Circle(radius) {
  this.radius = radius;
  this.area   = () => (this.radius ** 2) * Math.PI; // forgot this formula for a minute! been a while since school
}

a = new Circle(3);
let b = new Circle(4);

console.log(a.area().toFixed(2) === '28.27'); // => 28.27
console.log(b.area().toFixed(2) === '50.27'); // => 50.27

// 4

// local variable `ninja` is declared and "assigned" `undefined`
let ninja;
// function `Ninja` is declared as a constructor which sets the context's property `swung` to `true`
function Ninja() {
  this.swung = true;
}

// `ninja` is set to the creation of a new object created by the `Ninja` constructor
// this assigns the `swung` property on the `ninja` object to `true`
ninja = new Ninja();

// the `swingSword` prototype of the `prototype` property of the `Ninja` objects is assigned a function returning the value at the `swung` property of the context
Ninja.prototype.swingSword = function() {
  return this.swung;
};

// this should log `true`
// because `swingSword` is a function existing on the prototype of the `ninja` objects, JS can access it during its quest to find the method on the `ninja` object
// because it is a method invocation, JS implicitly sets the context to the object caller, which in this case is `ninja`, whose `swung` property should be `true`
log(ninja.swingSword());
log(Object.getPrototypeOf(ninja));

// 5
// let ninja; // unneeded
function Ninja() {
  this.swung = true;
}
ninja = new Ninja();
// code up until this point is identical

// now here's something interesting... a new object for the prototype.
// this would destroy any existing prototype chain, as it's an object whose prototype is Object, right?
// it's also missing the `constructor` property reference back to `Ninja`, which would break `instanceof`... i think
// because i have question 4 still in the code, it was affecting the results of this question
// the reassignment of the prototype is interesting. seems the important takeaway is that reassignment of the constructor function's prototype does *NOT* change existing references... right?
Ninja.prototype = {
  swingSword: function() {
    return this.swung;
  },
};

console.log(ninja.swingSword());
log(Object.getPrototypeOf(ninja));

// 6
// moved to using code in snippets to prevent the previous issue
// i originally wrote the function with arrow syntax before recalling that this behaves oddly with implicit context. sigh, javascript. sigh.
Ninja.prototype.swing = function () {
  this.swung = true;
  return this;
};

// 7
// interesting. okay.
// const ninjaConstructor = Object.getPrototypeOf(ninjaA).constructor;
// ninjaB = new ninjaConstructor();

// PROBLEM SET 2
// 1
const shape = {
  getType: function () {
    return this.type;
  }
};

function Triangle2(a, b, c) {
  Object.setPrototypeOf(this, shape);
  this.a = a;
  this.b = b;
  this.c = c;
  this.type = 'triangle';
  this.getPerimeter = function () {
    return this.a + this.b + this.c;
  }
}

// That was my original solution. Reading the solution reminded me that this involved some unnecessary duplication by having `getPerimeter` in each object.
// Also I realized that by manually setting the prototype to the shape object, by adding the `getPerimeter` function to that prototype/object, we mutate shape permanently.
// I verified that someone else discovered this inside the lesson forum. Her solution was a bit more elegant than mine, by setting the prototype directly to a new object created via Object.create from shape.
// I checked it against my original solution, which appears to leave shape as it originally was. Still better to prevent duplication on `getPerimeter`

// 2
function User(first, last) {
  'use strict';
  // without new
  if (this === undefined) {
    return new User(first, last);
  } else { // with new
    this.firstName = first;
    this.lastName  = last;
    this.name      = first + ' ' + last;
  }
}
// that is my original solution. it demands that the user be running strict mode, which I've enforced at the top of the function
//   (first time doing that from inside a function so ideally it's right)
// actually i am almost curious to test whether it works outside of global strict mode
// it appears to
// yay

// 3
function createObject(obj) {
  const newObj = {};
  Object.setPrototypeOf(newObj, obj);
  return newObj;
}

// this was my original attempt, though it feels too simple, and wrong in some way
// i think this is wrong because it lacks all the shape of the prototype object
// sure, the test verifies that the prototype is set, though it isn't created with any properties of the object
// i will follow the hint as suggested

function createObject(obj) {
  const constructor = function() {};
  constructor.prototype = obj;
  return new constructor;
}

// hmm. the alternative solution provided is a more concise version of what was originally written here

// 4
// to invoke it from any object, we'll have to put it high up dat chain
Object.prototype.begetObject = function() {
  return Object.setPrototypeOf({}, this);
}

// 5
// this one was a little weird, though it went okay. probably.
function neww(constructor, args) {
  const self = Object.create(constructor.prototype);
  constructor.call(self, ...args);
  return self;
}
// hmmm... may be useful to consider the usefulness of returning values from a constructor function and whether returning the new object implicitly is convention or suggestion
// will add return value conditional
function neww(constructor, args) {
  const self     = Object.create(constructor.prototype);
  const returned = constructor.call(self, ...args);
  return typeof returned === 'object' ? returned : self;
}
// not sure I get this, actually. will do a bit of searching
// the conditional seems rather incomplete
// someone else had the same question and it was answered in the forums
// this allows for the case of returning "custom" objects to indicate improper input.
//   that's a very odd pattern, honestly
