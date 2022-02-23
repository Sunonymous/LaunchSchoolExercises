// Short Long Short

function shortLongShort(str1, str2) {
  const firstLonger = str1.length > str2.length;
  if (firstLonger) {
    return str2 + str1 + str2;
  } else {
    return str1 + str2 + str1;
  }
}

console.log('Test Results');
console.log(shortLongShort('abc', 'defgh') === "abcdefghabc");
console.log(shortLongShort('abcde', 'fgh') === 'fghabcdefgh');
console.log(shortLongShort('', 'xyz') === 'xyz');
