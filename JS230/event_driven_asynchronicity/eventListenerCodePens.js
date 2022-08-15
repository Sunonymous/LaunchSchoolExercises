'use strict';

const inPixels = (s) => s + 'px';
const COLORS = {
  b: 'blue',
  g: 'green',
  r: 'red',
}

let x = document.querySelector('.x');

document.addEventListener('mousemove', (e) => {
  x.style.left = inPixels(e.clientX);
  x.style.top  = inPixels(e.clientY);
});

document.addEventListener('keypress', (e) => {
  let xh = document.querySelector('.x .horizontal');
  let xv = document.querySelector('.x .vertical');

  let color = COLORS[e.key.toLowerCase()];
  if (!color) {
    return;
  } else {
    xh.style.background = color;
    xv.style.background = color;
  }
  //console.log(e.key);
});


// "Twitter TextArea"

const MAX_NUMBER_OF_CHARS = 140;

const textbox = document.querySelector('textarea');
const counter = document.querySelector('.counter');
const submit  = document.querySelector('button');

function updateCharCount(newCount) {
  const charsLeft = MAX_NUMBER_OF_CHARS - newCount;
  counter.textContent = `${charsLeft} characters remaining.`;
  charsLeft < 0 ? disableSubmission() : enableSubmission();
}

function disableSubmission() {
  submit.disabled = true;
  textbox.classList.add('invalid');
}

function enableSubmission() {
  submit.disabled = false;
  textbox.classList.remove('invalid');
}

textbox.addEventListener('keyup', (e) => {
  let charCount = textbox.value.length;
  updateCharCount(charCount);
});
