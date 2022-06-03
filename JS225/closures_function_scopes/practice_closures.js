'use strict';

const log = (v) => console.log(v);

// 1
const inc = (n) => n + 1;
const dec = (n) => n - 1;
const makeCounterLogger = (x) => {
  return (y) => {
    for (let i = x; i !== y;) {
      log(i);
      i = i < y ? inc(i) : dec(i);
    }
    log(y);
  }
}

let countLog = makeCounterLogger(10);
// countLog(5);
// log('---');
// countLog(15);

// 2
const inform      = (task, action) => log(`Task '${task}' ${action}!`);
const processTask = (coll, task) => {
  if (task === undefined) {
    coll.length === 0 ? log('The list is empty.') : coll.map(log);
  } else if (coll.includes(task)) {
    coll.splice(coll.indexOf(task), 1);
    inform(task, 'added');
  } else {
    coll.push(task);
    inform(task, 'added');
  }
}

const makeList = () => {
  const tasks = [];
  return (task) => processTask(tasks, task);
}

/*
let list = makeList();
list();
// The list is empty.
list('make breakfast');
// make breakfast added!
list('read book');
// read book added!
list();
// make breakfast
// read book
list('make breakfast');
// make breakfast removed!
list();
// read book
*/

// FULL PRACTICE PROBLEMS

// 1
// inclusive limit?
const MAX_MULTIPLE = 100;
const multiplesUpTo = (n) => {
  const multiples = [];
  for (let i = n; i < MAX_MULTIPLE; i += n) {
    multiples.push(i);
  }
  return multiples;
}

const makeMultipleLister = (val) => {
  const multiples = multiplesUpTo(val);
  return () => multiples.map(log);
};

let lister = makeMultipleLister(13);
// lister();


// 2
let total = 0;
const add = (n) => {
  total += n;
  log(total);
}
const subtract = (n) => {
  total -= n;
  log(total);
}

add(1);
add(41);
subtract(37);
subtract(5);

// 3
function startup() {
  let status = 'ready';
  return function() {
    console.log('The system is ready.');
  };
}

let ready = startup();
let systemStatus = 'inaccessible';
// uh...
