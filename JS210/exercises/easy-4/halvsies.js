// Halvsies

function halvsies(array) {
  if (array.length === 0) return [[], []];
  let midpoint = Math.floor(array.length / 2);
  midpoint = array.length % 2 === 0 ? midpoint : midpoint + 1;
  const firstHalf = array.slice(0, midpoint);
  const lastHalf  = array.slice(midpoint);
  return [firstHalf, lastHalf];
}

console.log('Test Results:');
console.log(halvsies([1, 2, 3, 4]));       // [[1, 2], [3, 4]]
console.log(halvsies([1, 5, 2, 4, 3]));    // [[1, 5, 2], [4, 3]]
console.log(halvsies([5]));                // [[5], []]
console.log(halvsies([]));                 // [[], []]

// ah, missed their ceil() shortcut
// oh well
