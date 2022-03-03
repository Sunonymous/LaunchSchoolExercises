// How Many

const ifKeyPlusOneElseOne = (obj, key) => {
  obj[key] = obj[key] || 0;
  obj[key] += 1;
  return obj;
}

function countOccurrences(array) {
  const result = array.reduce(ifKeyPlusOneElseOne, {});
  for (let key in result) console.log(`${key}: ${result[key]}`);
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);
