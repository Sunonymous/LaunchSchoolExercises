function includesFalse(list) {
  for (let i = 0; i < list.length; i++) {
    let element = list[i];

    if (element === false) {
      return true;
    }
  }

  return false;
}
                                                                  // returns:
console.log('Results: ');
console.log(!!includesFalse([8, null, 'abc', true, 'launch', 11, false]));
console.log(!includesFalse(['programming', undefined, 37, 64, true, 'false']));
console.log(!includesFalse([9422, 'lambda', true, 0, '54', null]));
