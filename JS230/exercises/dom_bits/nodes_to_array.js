'use strict';

const log = (v) => console.log(v);

// Referencing the DOM structure of the page, return a nested array starting from the body element containing subarrays of [node, [child1, child2]], etc.

// How does this look with the walk function?
// I brought in the walk function and tried it out and it worked poorly
// added too many things
// Recursion seems easier here.

function summarizeElement(elem) {
  const tag = elem.tagName;
  if (elem.children.length === 0) {
    return [tag, []];
  } else {
    return [tag, Array.from(elem.children).map(summarizeElement)];
  }
}


function nodesToArr() {
  return summarizeElement(document.body);
}

log(JSON.stringify(nodesToArr()));

// mine include script tags/arrays because I included the script in the html files
// NTA_1
// my output
// ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]],["SCRIPT",[]]]] -- without script ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]]
// ls example result ->                                                               ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]]

// NTA_2
// my output
// ["BODY",[["HEADER",[]],["MAIN",[["DIV",[]],["DIV",[]]]],["FOOTER",[]],["SCRIPT",[]]]]
//   -- without script ["BODY",[["HEADER",[]],["MAIN",[["DIV",[]],["DIV",[]]]],["FOOTER",[]]]]
// ls example result   ["BODY",[["HEADER",[]],["MAIN",[["DIV",[]],["DIV",[]]]],["FOOTER",[]]]]

// NTA_3
// my output
// ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]],["SCRIPT",[]]]]
// -- without script ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]]
// ls example result ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]]
