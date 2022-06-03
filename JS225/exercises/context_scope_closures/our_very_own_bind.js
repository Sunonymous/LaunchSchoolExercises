'use strict';

const log = (v) => console.log(v);

const myBind = (func, context) => {
  return (...args) => {
    func.apply(context, args);
  }
}

function logFavoritePair() {
  log(`${this.first} + ${this.second} = match made in heaven!`);
}

const colors = {
  first: 'Blue',
  second: 'Magenta',
};

const solarBodies = {
  first: 'Sun',
  second: 'Moon',
}

const logBodies = myBind(logFavoritePair, solarBodies);
logBodies();
const logColors = myBind(logFavoritePair, colors);
logColors();

// improved! v2.0!
// now with flavor!

const myBind2 = (func, context, ...boundArgs) => (...args) => func.call(context, ...boundArgs, ...args);

// hope that works!
const add = (a, b) => a + b;
const inc = myBind2(add, null, 1);
log(inc(7));
