'use strict';

// Events Tracker

let tracker;

document.addEventListener('DOMContentLoaded', () => {
  // Tracker Data
  let   eventList = [];
  let elementList = [];

  function track(callback) {
    return (e) => {
      if (!eventList.includes(e)) {
        eventList.push(e);
        elementList.push(e.target);
      }
      callback(e);
    };
  }

  tracker = {
        list: () => eventList.slice(),
    elements: () => elementList.slice(),
       clear: () => {
         eventList.length = 0;
         elementList.length = 0;
         return 0;
       },
  };

  const    divRed = document.querySelector('div#red');
  const   divBlue = document.querySelector('div#blue');
  const divOrange = document.querySelector('div#orange');
  const  divGreen = document.querySelector('div#green');

  divRed.addEventListener('click', track(event => {
    document.body.style.background = 'red';
  }));

  divBlue.addEventListener('click', track(event => {
    event.stopPropagation();
    document.body.style.background = 'blue';
  }));

  divOrange.addEventListener('click', track(event => {
    document.body.style.background = 'orange';
  }));

  divGreen.addEventListener('click', track(event => {
    document.body.style.background = 'green';
  }));


});

/* Tests
tracker.list().length;
tracker.elements()
tracker.elements()[0] === document.querySelector('#blue')  // true
tracker.elements()[3] === document.querySelector('#green') // true
tracker.list()[0] // eventdata
tracker.clear()
tracker.list() // []
tracker.list()[0] = 'abc'
tracker.list().length // 0
 */
