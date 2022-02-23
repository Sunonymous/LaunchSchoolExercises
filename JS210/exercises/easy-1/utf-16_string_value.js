// UTF-16 String Value

// separate chars into array
// map over array with their char codes
// reduce it

const sum          = (n, memo) => n + memo;
const charToCode   = c => c.charCodeAt(0);
const utf16Value   = str => {
  if (str === '') return 0;
  return str.split('').map(charToCode).reduce(sum);
};

console.log('Test Results');
console.log(utf16Value('Four score') === 984);
console.log(utf16Value('Launch School') === 1251);
console.log(utf16Value('a') === 97);
console.log(utf16Value('') === 0);
const OMEGA = "\u03A9"; // UTF-16 character 'Ω' (omega)
console.log(utf16Value(OMEGA) === 937);
console.log(utf16Value(OMEGA + OMEGA + OMEGA) === 2811);
