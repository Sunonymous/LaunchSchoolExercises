'use strict';

let tasks      = 10;
let checkmarks = 0;
let sessions   = 0;
let minutes    = 0;

function pomodoro() {
  console.log('Work.');

  while (minutes < 25) {
    minutes += 1;
    console.log(`...${minutes}`);
  }

  console.log('PLING!');

  sessions   += 1;
  checkmarks += 1;

  if (checkmarks === tasks) {
    console.log('Done!');
    return;
  }

  let rest;
  if (sessions === 4) {
    sessions = 0;
    rest = 30;
  } else {
    rest = 5;
  }

  console.log('Rest for ' + rest + ' minutes.');

  // redeclaring variable using var within a function -- scope troubles
  minutes = 0;
  pomodoro();
}

pomodoro();
