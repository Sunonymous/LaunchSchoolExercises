// Letter Counter P2

const filterToLetters      = str => str.split('').filter(c => c.match(/[A-Za-z\s]/)).join('');

// looks like a job for reduce!

const ifKeyAddOneElseOne = (obj, key) => {
  if (Object.keys(obj).includes(String(key))) {
    obj[key] += 1;
  } else {
    obj[key] = 1;
  }
  return obj;
}

function wordSizes(str) {
  if (str.length < 1) return {};
  const wordLengths = filterToLetters(str).split(' ').map(word => word.length);
  return wordLengths.reduce(ifKeyAddOneElseOne, {})
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));
console.log(wordSizes("What's up doc?"));
console.log(wordSizes(''));
