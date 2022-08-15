'use strict';

const log = (v) => console.log(v);

const exampleCallback = ({target, currentTarget}) => {
  alert(`Target: ${target.tagName}\nCurrent Target: ${currentTarget.tagName}`);
};

// Sample Elements
let em1;
let em2;
let em3;


document.addEventListener('DOMContentLoaded', () => {
  em1 = document.querySelector('table');
  em2 = document.querySelector('main h1');
  em3 = document.querySelector('main');

  // Delegate Event Function
  function delegateEvent(parentElement, selector, eventType, callback) {
    // Return if No Parent Element
    if (parentElement === null) return undefined;

    parentElement.addEventListener(eventType, (e) => {
      const childTargets = parentElement.querySelectorAll(selector);
      if (childTargets === null) return;

      for (let i = 0; i < childTargets.length; i += 1) {
        if (e.target === childTargets[i]) {
          callback(e);
          return true;
        }
      }
    });

    return true;
  }

  // Tests
  log(delegateEvent(em1, 'p', 'click', exampleCallback));       // undefined
  log(delegateEvent(em2, 'p', 'click', exampleCallback));       // true
  log(delegateEvent(em2, 'h1', 'click', exampleCallback));      // true
  log(delegateEvent(em3, 'h1', 'click', exampleCallback));      // true
  log(delegateEvent(em3, 'aside p', 'click', exampleCallback)); // true
  log(delegateEvent(em2, 'p', 'click', exampleCallback));       // true
});

/*
const element2 = document.querySelector('main h1');
const newP = document.createElement('P');
const newContent = document.createTextNode('New Paragraph');
newP.appendChild(newContent);

element2.appendChild(newP);
*/
