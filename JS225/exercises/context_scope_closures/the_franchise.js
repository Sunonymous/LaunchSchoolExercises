'use strict'; // is this necessary??

const log = (v) => console.log(v);

let franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    const self = this;
    return [1, 2, 3].map(function(number) {
      return `${self.name} ${number}`;
    });
  },
};

// log(franchise.allMovies());

// `this` from within the callback to `map` refers to the global object because of its "nestedness" and invocation
// so we have a couple of options here.
// i went ahead and assigned a reference to self to a variable for reference within the callback
// i will still need to practice to recall that arrow functions context themselves lexically... maybe not though, because I tend towards arrow function syntax more often

// including solution 2 here as well

franchise = {
  name: 'How to Train Your Dragon',
  allMovies: (function() {
    return [1, 2, 3].map((function(num) {
      return `${this.name} ${num}`
    }).bind(franchise))
  }),
};

log(franchise.allMovies());

// oh, guess the extra parentheses are not needed
// strange that you can't rebind arrow funcs either
