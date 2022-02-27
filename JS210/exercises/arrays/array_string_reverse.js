// Array and String Reverse

// we've done this, minus the inclusion of string handling

const reverse = val => {
  let givenString = false;
  if (typeof val === 'string') {
    givenString = true;
    val = val.split(''); // quick change!
  }
  if (Array.isArray(val)) {
    let result = [];
    for (let idx = val.length - 1; idx > -1; idx--) {
      result.push(val[idx]);
    }
    return givenString ? result.join('') : result;
  } else {
    return undefined;
  }
}

// seems like I had the same idea as the LS solution, though I kept it as one function
console.log(reverse(5));
console.log(reverse([1, 2, 3]));
console.log(reverse('yup'));
