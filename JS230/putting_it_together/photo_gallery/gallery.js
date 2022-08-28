'use strict';

// Fluid Photo Gallery

document.addEventListener('DOMContentLoaded', () => {
  // Elements
  const thumbnails = Array.from(document.querySelectorAll('ul li'));
  const thumbIMGs  = Array.from(document.querySelectorAll('ul li img'));
  const figures = Array.from(document.querySelectorAll('figure'));

  // Functions
  function showImage(dataIMG) {
    figures.forEach((f) => {
      f.dataset.img === dataIMG ? f.classList.remove('hidden') : f.classList.add('hidden');
    });
  }

  // Events
  thumbnails.forEach((t) => {
    t.addEventListener('click', (e) => {
      thumbIMGs.forEach((i) => e.target === i ? i.classList.add('selected') : i.classList.remove('selected'));
      console.info(`e.target: ${e.target}`);
      showImage(e.target.dataset.img);
    });
  });
});
