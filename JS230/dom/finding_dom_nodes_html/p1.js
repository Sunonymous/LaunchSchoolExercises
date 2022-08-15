'use strict';

const log = (v) => console.log(v);
log('Script loaded successfully.');

// 1
const walk = (startNode, func) => {
  func(startNode);
  startNode.childNodes.forEach((node) => {
    walk(node, func);
  });
}

function getParagraphs(dom) {
  const results = [];
  walk(dom, (node) => {
    if (node.nodeName === 'P') results.push(node);
  });
  return results;
}

log(getParagraphs(document));
