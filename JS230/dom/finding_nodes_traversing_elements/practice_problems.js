'use strict';

const log = (v) => console.log(v);
log('Script loaded successfully.');
const walk = (startNode, func) => {
  func(startNode);
  startNode.childNodes.forEach((node) => {
    walk(node, func);
  });
}

// 1
const h2s          = document.getElementsByTagName('h2');
const h2Text       = Array.prototype.slice.call(h2s).map((h) => h.textContent);
const h2WordCounts = h2Text.map((txt) => txt.split(' ').length);

// 2
let tableOfContents;
tableOfContents = document.querySelector('#toc');
log(tableOfContents === document.querySelector('.toc'));
log(tableOfContents === document.getElementsByClassName('toc')[0]);
log(tableOfContents === document.getElementById('toc'));

// 3

let links = tableOfContents.getElementsByTagName('a');
for(let i = 0; i < links.length; i += 1) {
  if (i % 2 !== 0) links[i].style.color = 'green';
}

// 4
const imageCaptions = [];
let images = document.getElementsByTagName('img');
Array.prototype.slice.call(images).forEach((img) => {
  let txt = img.getAttribute('alt');
  if (txt !== '') {
    imageCaptions.push(txt);
  }
});
log(imageCaptions);

// oh. guess I misunderstood what they were looking for.

let thumbnailCaptions = Array.prototype.slice.call(document.querySelectorAll('.thumbcaption'));
thumbnailCaptions = thumbnailCaptions.map((c) => c.textContent.trim());
log(thumbnailCaptions);

// 5
const ranks = ['Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'];
const ranking = Object.fromEntries(ranks.map((r) => [r, '']));
const classificationBox = document.querySelector('.infobox, .biota');
const tableData = classificationBox.getElementsByTagName('td');

ranks.forEach((r) => {
  for (let i = 0; i < tableData.length; i += 1) {
    if (tableData[i].textContent === `${r}:`) {
      ranking[r] = tableData[i].nextElementSibling.firstElementChild.textContent;
    }
  }
});

log(ranking);


log('Script finished successfully.');
