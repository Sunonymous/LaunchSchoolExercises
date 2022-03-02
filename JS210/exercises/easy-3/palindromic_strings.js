// Palindromic Strings

const reverse              = str => str.split('').reverse().join('');
const filterToLetters      = str => str.split('').filter(c => c.match(/[A-Za-z]/)).join('');
const onlyLowercaseLetters = str => filterToLetters(str).toLowerCase();

function isPalindrome(str) {
  return str === reverse(str);
}

function isRealPalindrome(str) {
  return onlyLowercaseLetters(str) === reverse(onlyLowercaseLetters(str));
  return isPalindrome(onlyLowercaseLetters(str)); // alternatively
}

function isPalindromicNumber(num) {
  return isPalindrome(String(num));
}

console.log('Test Results:');
console.log(!!isPalindrome('madam'));
console.log(!isPalindrome('Madam'));
console.log(!isPalindrome("madam i'm adam"));
console.log(!!isPalindrome('356653'));
console.log(!!isRealPalindrome('madam'));
console.log(!!isRealPalindrome('Madam'));
console.log(!!isRealPalindrome("Madam, I'm Adam"));
console.log(!!isRealPalindrome('356653'));
console.log(isRealPalindrome('356a653'));
console.log(!!isRealPalindrome('356a653'));
console.log(!isRealPalindrome('123ab321'));
console.log(!!isPalindromicNumber(34543));
console.log(!isPalindromicNumber(123210));
console.log(!!isPalindromicNumber(22));
console.log(!!isPalindromicNumber(5));
