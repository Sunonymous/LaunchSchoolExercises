'use strict';
const log = (v) => console.log(v);

// This is a weird exercise. Took me a little while to wrap my head around it.
// I'm thinking that the first thing we could do is create a map of all the dom/body elements and their respective integer "levels" of nesting.
// Once we have that, we only need to iterate through it and append the correct class to the elements at the level we're requesting.
// If we start at the body element, its children are nesting level 1. Then all of the subchildren are nesting level 2, etc. etc.
//   This goes until we've exhausted the children.
// Maybe we could just count the number of parents before reaching the body element to get the nesting level?
// Let's do some experiments to see if we're on a good track.
// This was so much easier than originally inticipated. Cool.

function nestingLevel(node) {
  let level = 1;
  let parent = node.parentNode;
  while (parent !== document.body) {
    parent = parent.parentNode;
    level += 1;
  }

  return level;
}

// these next two both work, though are a perhaps-unnecessary level of complication
// they may be useful in certain cases, however!

// building into object with IDs for keys
// function colorGeneration(level) {
//   const allIDs = Array.from(document.querySelectorAll('*[id]')).map((n) => n.id);
//   const levels = Object.fromEntries(allIDs.map((id) => [id, nestingLevel(document.getElementById(id))]));

//   Object.keys(levels).forEach((id) => {
//     if (levels[id] === level) document.getElementById(id).classList.add('generation-color');
//   });
// }

// iterating over IDs alone
// function colorGeneration(level) {
//   const allIDs = Array.from(document.querySelectorAll('*[id]')).map((n) => n.id);

//   allIDs.forEach((id) => {
//     let node = document.getElementById(id);
//     if (nestingLevel(node) === level) node.classList.add('generation-color');
//   });
// }

// using walk from earlier
function walk(node, callback) {
  callback(node);

  for (let index = 0; index < node.children.length; index += 1) {
    walk(node.children[index], callback);
  }
}

function colorGeneration(level) {
  walk(document.body.firstElementChild, (n) => {
    if (nestingLevel(n) === level) n.classList.add('generation-color');
  });
}
