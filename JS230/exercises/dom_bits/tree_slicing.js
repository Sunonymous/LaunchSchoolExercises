'use strict';
const log = (v) => console.log(v);

// Implement a function for slicing the DOM tree.
// Given a starting and ending ID, return an array of tag names.
// Tag names included are only of element nodes.
// Only slice elements with 'body' as an ancestor.
// If ID is not in the DOM or no path connects the two IDs, return `undefined`.

// This is similar to the last exercise, though we're moving in the opposite direction, inwards!
// Actually, is this really the easiest way? After looking at the examples,
//   it seems easier to traverse outwards, then reverse the array.
// It's either a valid path, or it isn't. Traveling outwards, we will only check a single path.
// What we can do is to iterate through the elements starting at the ending id.
//   Branch outwards on its parent ->
//   We end if the parent is the body and return undefined (indicating an invalid path)


function sliceTree(startID, endID) {
  startID = String(startID);
  endID   = String(endID);

  // incorrect ID given
  const allIDs = Array.from(document.querySelectorAll('*[id]')).map((n) => n.id);
  if (![startID, endID].every((i) => allIDs.includes(i))) return undefined;

  let currentElement = document.getElementById(endID);
  const results = [currentElement.tagName];
  while (currentElement.id !== startID) {
    const parent = currentElement.parentElement;

    if (parent === document.body) return undefined; // invalid path
    results.push(parent.tagName);

    if (parent.id === startID) break;
    currentElement = parent;
  }

  return results.reverse();
}

// Tests
log(sliceTree(1, 4));   // ["ARTICLE", "HEADER", "SPAN", "A"]
log(sliceTree(1, 76));  // undefined
log(sliceTree(2, 5));   // undefined
log(sliceTree(5, 4));   // undefined
log(sliceTree(1, 23));  // ["ARTICLE", "FOOTER"]
log(sliceTree(1, 22));  // ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
log(sliceTree(11, 19)); // ["SECTION", "P", "SPAN", "STRONG", "A"]
