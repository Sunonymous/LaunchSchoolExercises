"use strict";

// wonder if there's an easy way to automate inclusion of strict mode via a shortcut or macro or something
// worry about it later, i guess

// given a nested array of "rectangles"
// where each rectangle is an array of [height, width]
// return the total area
// this seems like a job for Map Man + The Reducing Kid!

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

const totalArea = (rectangleArray) => {
  const rectangleAreas = rectangleArray.map(([width, height]) => width * height);
  return rectangleAreas.reduce((total, current) => total + current);
}

console.log('Total Area of Rectangles Correct?');
console.log(totalArea(rectangles) === 141);

// and the addition of Filter Dude... an underrated hero, for sure

const totalSquareArea = (rectangleArray) => {
  const squares = rectangleArray.filter(([height, width]) => height === width);
  const squareAreas = squares.map(([height, width]) => height * width);
  return squareAreas.reduce((total, current) => total + current);
}

console.log('Total Area of Squares Correct?');
console.log(totalSquareArea(rectangles) === 121);
