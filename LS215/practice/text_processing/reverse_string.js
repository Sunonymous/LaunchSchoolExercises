"use strict";

// Reverse a String!

const range = (len, from = 0) => [...Array(len).keys()].map(n => n + from);
const reverse = (string) => {
  const getFromString = (idx) => string.charAt(idx);
  return range(string.length, 0).reverse().map(getFromString).join('');
};


console.log(reverse('hello') === "olleh");
console.log(reverse('The quick brown fox') === "xof nworb kciuq ehT");
