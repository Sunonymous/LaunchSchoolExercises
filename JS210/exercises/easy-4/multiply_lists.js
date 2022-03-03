// Multiply Lists

function range(len, from) {
  return [...Array(len).keys()].map(n => n + from);
}

function multiplyList(array1, array2) {
  return range(array1.length, 0).map(n => array1[n] * array2[n]);
}

console.log(multiplyList([3, 5, 7], [9, 10, 11]));    // [27, 50, 77]
