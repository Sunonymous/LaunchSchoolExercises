'use strict';
const log = (v) => console.log(v);

const inform      = (task, msg) => log(`Task '${task}' ${msg}!`);
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
  const add   = (task) => {
    const result = tasks.includes(task) ? false : tasks.push(task);
    result ? inform(task, 'added successfully') : inform(task, 'already present');
  }

  const list = () => {
    log('Task List:');
    tasks.length === 0 ? log('You have no tasks! Hooray!') : tasks.map(log);
  }

  const remove = (task) => {
    const result = tasks.includes(task) ? tasks.splice(tasks.indexOf(task)) : false;
    result ? inform(task, 'removed successfully') : inform(task, 'was not in the list');
  }

  return {
    add,
    list,
    remove,
  };
}

const taskList = makeList();
taskList.add('study in Launch School');
taskList.add('study in Launch School');
taskList.list();
log('---');
taskList.remove('save the world');
taskList.remove('study in Launch School');
taskList.list();
