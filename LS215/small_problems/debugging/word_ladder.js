'use strict';

// I am not going to write out the whole business for these, since the code is already written.
// The purpose of the exercises seems to be to parse others' code.

// Silly Gemma--don't you know that JavaScript needs ;s for peace??
// also... join much?

let ladder = '';

['head', 'heal', 'teal', 'tell', 'tall', 'tail'].forEach(word => {
  if (ladder !== '') {
    ladder += '-'
  }

  ladder += word
})

console.log(ladder)  // expect: head-heal-teal-tell-tall-tail
