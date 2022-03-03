// Name Swapping

function swapName(fullName) {
  const separateNames = fullName.split(' ');
  return `${separateNames[separateNames.length - 1]}, ${separateNames[0]}`;
}

console.log(swapName('Joe Roberts') === "Roberts, Joe");
