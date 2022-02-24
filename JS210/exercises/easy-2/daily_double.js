// Daily Double

// I couldn't figure out a simple way to do this functionally, so I'll start with procedural.

function crunch(str) {
  let result = '';
  for (let i = 0; i < str.length; i++) {
    if (result.length === 0 || result[result.length - 1] !== str[i]) {
      result += str[i];
    } else {
      continue;
    }
  }
  return result;
}

// figured it out while writing that
// first to test this first function though
// tests are good

function removeConsecutiveDuplicates(str) {
  if (str === '' || str.length == 1) return str;
  let index = 0;
  let track = '';
  function recur(track) {
    if (index === str.length - 1) return track;
    if (track === '') {
      track += str[index];
    }
    index += 1;
    if (track[track.length - 1] !== str[index]) {
      return recur(track += str[index]);
    } else {
      return recur(track)
    }
  }
  return recur(track);
}
// this recursive solution is not pretty
// and I still don't know how best to handle mutable parameters inside a JS recursive function

console.log('Test Results:');
console.log(crunch('ddaaiillyy ddoouubbllee') === "daily double");
console.log(crunch('4444abcabccba') === "4abcabcba");
console.log(crunch('ggggggggggggggg') === 'g');
console.log(crunch('a') === 'a');
console.log(crunch('') === '');
console.log('Recursive Test Results:');
console.log(removeConsecutiveDuplicates('ddaaiillyy ddoouubbllee') === "daily double");
console.log(removeConsecutiveDuplicates('4444abcabccba') === "4abcabcba");
console.log(removeConsecutiveDuplicates('ggggggggggggggg') === 'g');
console.log(removeConsecutiveDuplicates('a') === 'a');
console.log(removeConsecutiveDuplicates('') === '');

// I don't feel like putting on my regex hat right now
