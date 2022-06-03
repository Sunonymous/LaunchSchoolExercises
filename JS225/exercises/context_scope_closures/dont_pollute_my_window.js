'use strict';

const log = (v) => console.log(v);

// This looks like a job for... The IIFE Kid!
// He desperately needs a new name.

// Also let's pretend Naveed is Australian or loves Australia for some reason.
// ... also also, his grammar improves very slightly.

(function gday() {
  const name = 'Naveed';
  const greeting = 'G\'day';

  const message = `${greeting}, ${name}!`;
  console.log(message);
})();

// Hey, their solution still has globals. What if there's a global `greeter` in usage already??
