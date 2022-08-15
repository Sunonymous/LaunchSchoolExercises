'use strict';

// "Manual" Input Box

document.addEventListener('DOMContentLoaded', () => {
  const box     = document.querySelector('.text-field');
  const content = document.querySelector('.content');
  let   cursorIv;
  let   blinking = false;

  box.addEventListener('click', (e) => {
    e.stopPropagation();
    box.classList.add('focused');
    if (!blinking) {
      cursorIv = setInterval(() => box.classList.toggle('cursor'), 500);
      blinking = true;
    }
  });

  document.addEventListener('click', (e) => {
    box.classList.remove('focused');
    box.classList.remove('cursor');
    if (blinking) {
      clearInterval(cursorIv);
      blinking = false;
    }
  });

  document.addEventListener('keyup', (e) => {
    if (!box.classList.contains('focused')) {
      return;
    } else if (e.key === 'Backspace') {
      const len = content.textContent.length;
      content.textContent = content.textContent.slice(0, len - 1);
    } else if (e.key.length === 1) {
      content.textContent += e.key;
    }
  });
});

