// Combine Two Lists
// oh, so zip

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function interleave(array1, array2) {
  return range(array1.length, 0).map(i => [array1[i], array2[i]]).flat();
}

console.log(interleave([1, 2, 3], ['a', 'b', 'c']));    // [1, "a", 2, "b", 3, "c"]

// thanks for not making us do variable length (ie unmatched lengths)
// moving on!!
