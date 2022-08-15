'use strict';

function walk(node, callback) {
  callback(node);

  for (let index = 0; index < node.childNodes.length; index += 1) {
    walk(node.childNodes[index], callback);
  }
}

const log = (v) => console.log(v);

log('Script loaded successfully!');

// 1
// change 'On the River' heading to 48 px and colored red
const heading = document.lastChild.lastChild.childNodes[1];
heading.style.color = 'red';
heading.style.fontSize = '48px';

// 2 & 3
// Count Paragraphs
// Log all first words

/*

  Commented out because was causing exception on wiki page.

let numberOfParagraphs = 0;
const firstWords = [];

walk(document, (node) => {
  if (node.nodeName === 'P') {
    numberOfParagraphs += 1;
    firstWords.push(node.firstChild.data.trim().split(/\s+/)[0]);
  }
});

log(`There are ${numberOfParagraphs} paragraph elements on this page.`);
log('The first words of the paragraphs are:');
log(firstWords);
 */

// 4
// This first part could be included in the walk invocation for 2/3, though I'll keep it separate because I wasn't reading ahead.
// The if conditional is slightly modified to be more convenient. Very flimsy in terms of code, however.

walk(document, (node) => {
  if (node.nodeName === 'P' && node.childNodes.length > 1) {
    node.classList.add('stanza');
  }
})

// 5
// Working with old Wikipedia now
let numberOfImages = 0;
let numberOfPNGs   = 0;

walk(document, (node) => {
  if (node.nodeName === 'IMG') {
    numberOfImages += 1;
    if (node.src.slice(-3) === 'png') numberOfPNGs += 1;
  }
});

log(`There are ${numberOfImages} images on this page, and ${numberOfPNGs} are PNG images.`);

// 6
walk(document, (node) => {
  if (node.nodeName === 'A') node.style.color = 'red';
});
