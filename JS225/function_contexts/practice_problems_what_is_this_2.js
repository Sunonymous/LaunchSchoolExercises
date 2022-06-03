'use strict';
// can't... stop...


// 1
// Strange how some of these don't have line numbers and some do.
// Because `myMethod` is set as a property of a nested object, `myChildObject`, the `this` in `myMethod` refers to the nested `myChildObject`.
// The nested object is /not/ the object which contains the `count` property, so it should return `undefined`

// 2
let myObject = {
  count: 1,
  myChildObject: {
    myMethod: function () {
      return this.count;
    }.bind(myObject),
  },
};

myObject.myChildObject.myMethod(); // => 1

// 3
// Even though the `fullName` function is stripped from its original context when it is assigned to the `whoIsSpiderman` variable,
//   the fact that it is explicitly bound to the `person` object retains the proper context, so it should log 'Peter Parker is the Amazing Spiderman!' as expected.

// 4
// `specialDiscount` is invoked as a function without an explicit context, which means it will not have access to the `price` property as expected.
// `specialDiscount` will therefore return `0` always, and never discount anything... meaning the total price of the computer is `35000`
// To change it, assuming that `specialDiscount` will always be used in reference to the parent object:
let computer = {
  price: 30000,
  shipping: 2000,
  total() {
    let tax = 3000;
    const self = this;
    function specialDiscount() {
      if (self.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());
