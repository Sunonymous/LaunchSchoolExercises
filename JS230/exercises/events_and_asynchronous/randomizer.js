'use strict';

// Randomizer

// Helper Functions
const        log =         (v) => console.log(v);
const      range = (len, from) => [...Array(len).keys()].map((n) => n + from);
const    randIdx =       (arr) => Math.floor(Math.random() * arr.length);
const     randEm =       (arr) => arr[randIdx(arr)];
const makeTestCB =      (name) => () => log(`This is callback ${name}.`);

function shuffle(arr) {
  let   copy = arr.slice();
  let result = [];

  while (copy.length > 0) {
    const i = randIdx(copy);
    result.push(copy[i]);
    copy.splice(i, 1);
  }

  return result;
}

// Constants and State
const    MS_IN_SEC = 1000;
let secondsElapsed = 0;

function randomizer(...fs) {
  const runtimeInSeconds = fs.length * 2;
  const allSeconds = range(runtimeInSeconds, 1);
  const schedule = Object.fromEntries(allSeconds.map((s) => [s, [s]]));

  for (let i = 0; i < fs.length; i += 1) {
    schedule[randEm(allSeconds)].push(fs[i]);
  }

  let timer = setInterval(() => {
    secondsElapsed += 1;
    if (secondsElapsed === runtimeInSeconds) clearInterval(timer);

    schedule[secondsElapsed].map((v) => typeof v === 'function' ? v() : log(v));
  }, MS_IN_SEC);
}

// randomizer(makeTestCB('alpha'), makeTestCB('johnny'), makeTestCB('bravo'));
randomizer(makeTestCB(1), makeTestCB(2), makeTestCB(3), makeTestCB(4), makeTestCB(5));
