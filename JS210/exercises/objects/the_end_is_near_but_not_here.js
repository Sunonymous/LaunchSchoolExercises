// Yay for filename autocompletion
// at least after creating the file...

function penultimate(string) {
  return string.split(' ').slice().reverse()[1];
}

console.log(penultimate('last word') === "last");
console.log(penultimate('Launch School is great!') === 'is')

// negative indices do not work like that in JS arrays
// actually, they don't work at all like that.
// to do this a simpler way, just reverse the string and get the word at index 1

// hmm... the solution used slice
// it is less function calls, though it seems misleading to me that array methods can use negative indices, but arrays themselves can't
// why so many mixed messages??
