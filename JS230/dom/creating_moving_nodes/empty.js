'use strict';

const log = (v) => console.log(v);

let parg = document.createElement('p');
let extraText = document.createTextNode('How art thou?');
parg.textContent = 'Hello and good day to you.';
parg.appendChild(extraText);
let parg2 = parg.cloneNode(true);
document.body.appendChild(parg);
document.body.appendChild(parg2);

// 1
function toggleHiddenDiv(event) {
  event.preventDefault;
  let obj = document.getElementById('notice');
  const setTo = obj.getAttribute('class') === 'visible' ? 'hidden' : 'visible';
  obj.setAttribute('class', setTo);
}
