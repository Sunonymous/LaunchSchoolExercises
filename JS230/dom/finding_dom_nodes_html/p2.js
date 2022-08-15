'use strict';

const log = (v) => console.log(v);
log('Script loaded successfully.');

// 2
const walk = (startNode, func) => {
  func(startNode);
  startNode.childNodes.forEach((node) => {
    walk(node, func);
  });
}

// commented for next iteration
// walk(document, (node) => {
//   if (node.nodeName === 'P') node.classList.add('article-text');
// });

// 3
// document.body.getElementsByTagName('p').forEach((n) => n.classList.add('article-text'));

// 4
const intros = document.getElementsByClassName('intro');
Array.prototype.slice.call(intros).forEach((i) => {
  let paragraphs = i.getElementsByTagName('p');
  log(paragraphs);
  Array.prototype.slice.call(paragraphs).forEach((n) => n.classList.add('article-text'));
});

log('Script finished successfully!');
