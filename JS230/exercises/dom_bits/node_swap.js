'use strict';

const log = (v) => console.log(v);

// Given two element IDs, swap the position of the elements with the given IDs in the DOM.
// Return `true` if the swap is valid, and `undefined` if the swap is invalid.
// Invalid swaps are when no element with the given ID is present, or when one element is a child of another element.
// So we'll need a parent check, which could be done by traveling up the DOM until we hit body.
//   If body is reached before one of the nodes, then it is not a child of it.
// Then we'll need a way to get the index of a given node in the children of its parent (for placement purposes).
// We can try indexOf first.
// This should work because the variable reference to the node should preclude GC... right?

function isChildOf(par, chd) {
  let currentParent = chd.parentNode;
  while (currentParent !== document.body) {
    if (currentParent === par) {
      return true;
    } else {
      currentParent = currentParent.parentNode;
    }
  }

  return false;
}

const areRelated = (node1, node2) => isChildOf(node1, node2) || isChildOf(node2, node1);

function nodeSwap(id1, id2) {
  const node1 = document.getElementById(String(id1));
  const node2 = document.getElementById(String(id2));
  if (!node1 || !node2 || areRelated(node1, node2)) return undefined;

  const node1Idx = Array.from(node1.parentNode.children).indexOf(node1);
  node1.parentNode.insertBefore(node2, node1.nextElementSibling);
  node2.parentNode.insertBefore(node1, node2.nextElementSibling);
  // node2.replaceWith(node1);
}

nodeSwap(2, 1);
nodeSwap(7, 9);
log(nodeSwap(42, 24) === undefined); // true
log(nodeSwap(1, 4) === undefined);   // true
