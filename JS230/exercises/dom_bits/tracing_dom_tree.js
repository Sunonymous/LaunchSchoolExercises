'use strict';
const log = (v) => console.log(v);

// Given a string ID, return a 2D array of the DOM tree.
// The first element contains the element at the given ID and its siblings, the next array element contains the parent and its siblings, and upwards.
// The "top-level" element has an ID of 1.

// So here we just can do a for loop based on the numeric ids.
// If we're looping on the ids, we can reach upwards to the parent and grab its childNodes "array".
// Add that to a results array built up throughout the function and BAM.
// Scratch that. The problem with this numerical technique is that we get duplicates. Let's try it with a while loop.
// Took some finagling, though it finally resulted.
// It's kind of a weird exercise.

function domTreeTracer(startID) {
  const results = [];
  let currentElement = document.getElementById(startID);
  do {
    let parent = currentElement.parentElement;
    let nodeNames = Array.prototype.slice.call(parent.children);
    nodeNames = nodeNames.map((n) => n.nodeName).filter((n) => n !== 'SCRIPT');
    results.push(nodeNames);
    currentElement = parent;
  } while (currentElement.toString() !== '[object HTMLBodyElement]');
  return results;
}


// Tests
log(domTreeTracer(1));
// [["ARTICLE"]]
log(domTreeTracer(2));
// [["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]
log(domTreeTracer(22));
// [["A"], ["STRONG"], ["SPAN", "SPAN"], ["P", "P"], ["SECTION", "SECTION"], ["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]
