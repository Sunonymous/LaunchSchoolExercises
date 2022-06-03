'use strict';

const log =    (v) => console.log(v);

const PRD_IDS = [];
const generateID = () => {
  const next = PRD_IDS.length;
  PRD_IDS.push(next);
  return next;
}

// Validation
const validPrice = (price) => price >= 0;

// 3
// this function forces a design standard
const capitalize    =        (str) => `${str[0].toUpperCase()}${str.slice(1).toLowerCase()}`;
const strKeyVal     =   (obj, key) => `${capitalize(key)}: ${obj[key]}`;
const isNotFunction =        (val) => typeof val !== 'function';
const valAtKIsNotFunction = (o, k) => isNotFunction(o[k]);
const propsOfObj    =        (obj) => Object.keys(obj).filter((k) => valAtKIsNotFunction(obj, k)).map((k) => strKeyVal(obj, k));

const describeProduct = (product) => {
  propsOfObj(product).map(log);
}

// 1 and inadvertently 2 and eventually 5 ? they blended together
const makeProduct = (name, stock, price) => {
  // could validate input on type and other constraints
  return {
    id: generateID(),
    name,
    stock,
    price,

    // 4
    describe() {
      propsOfObj(this).map(log);
    },

    newPrice(nwPrc) {
      if (validPrice(nwPrc)) {
        this.price = nwPrc;
      } else {
        log('ERROR: NEGATIVE PRICE GIVEN. TOTAL ECONOMIC DISCOMBOBULATION IMMINENT.');
      }
    },
  };
}

// 6, which was done after 1... or 2? ah, forget it
let scissors = makeProduct('Scissors',        8, 10);
let drill    = makeProduct('Cordless Drill', 15, 45);
let bomb     = makeProduct('Bath Bomb',       99, 6);
let door     = makeProduct('Magic Door',     42, 33);
// scissors.newPrice(-42);

describeProduct(scissors);
describeProduct(door);

// 4

bar foo {a: 20 b: 10}
a 20
b 10
