'use strict';

// 1
// Line 15 invokes the `logReturnVal` function, which requires a function argument.
// The function argument provided is the function at the `getDescription` property of the `turk` object.
// Because this function is referenced and invoked outside of the `turk` object, and without setting an explicit context,
//   JavaScript assigns the context to the global object. Because the `getDescription` function uses `this` to reference properties,
//   the properties `firstName`, `lastName`, and `occupation` of the global object are referenced, each returning `undefined`, as they do not exist.
// It seems as though the `getDescription` method would reference the `turk` object using `this`, though because the position of invocation differs, this behaves otherwise.
// To account for the loss of context, one method we may use is explicitly binding the `getDescription` function to the `turk` object.

// 2
let turk = {
  self: this,
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon',
  getDescription: function () {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  },
};

function logReturnVal(func, context) {
  // tried with both for practice
  let returnVal = func.apply(context);
  console.log(returnVal);
}

// logReturnVal(turk.getDescription, turk);

// 3
// logReturnVal(turk.getDescription.bind(turk));

// 4
// Without having run the code, it seems like it is close to producing the desired output.
// The part which seems likely to fail is that `this` is being used at two levels here.
// `listGames`, called as a method on the `TESgames` object, should have access to the `titles` property.
// However, `this` is also being used inside the `forEach` callback, which I have learned will not function as expected.
let TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames() {
    this.titles.forEach(function(title) {
      console.log(this.seriesTitle + ' ' + title);
    }, this);
  }
};

// TESgames.listGames();

// I ran the code to verify what I expected. Then I added a `this` keyword as the context argument of the `forEach` function.
// This allowed the code to work as desired.

// 4
// Now arrow function:
let TESgames2 = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames() {
    this.titles.forEach((title) => console.log(this.seriesTitle + ' ' + title));
  },
};

// TESgames2.listGames();

// 6
let TESgames3 = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames() {
    const self = this;
    self.titles.forEach(function(title) {
      console.log(self.seriesTitle + ' ' + title);
    });
  }
};

// TESgames3.listGames();

// 7
// This was the first solution I tried in question 4.

// 8
// What is the motivation for someone to write code like that??
// Like I get that these examples are contrived for educational purposes, though why would someone write something like that?
// It's a level of nesting that is completely unnecessary for its intended purpose.
// Because of all the redirection, `this` loses its original meaning/context and can't change `foo.a`, leaving it at 0.

// 9
let foo = {
  a: 0,
  incrementA() {
    function increment() {
      this.a += 1;
    }

    increment.call(this);
  }
};

foo.incrementA();
foo.incrementA();
foo.incrementA();
console.log(foo.a);

// 10
let foo2 = {
  a: 0,
  incrementA() {
    let increment = () => this.a += 1;

    increment();
    increment();
    increment();
  }
};
foo2.incrementA();
console.log(foo2.a);
