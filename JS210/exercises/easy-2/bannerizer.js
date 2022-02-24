// Bannerizer

// given a short line of text, log a box surrounding it

const BOX_CORNER  = '+';
const BOX_CEILING = '-';
const BOX_WALL    = '|';

// Borrowed from a previous exercise
function repeat(string, times) {
  // edge cases
  if (times === 0) return '';
  if (times < 0)   return undefined;
  if (!Number.isInteger(times)) return undefined;

  let originalString = string;

  function recur(string, times) {
    if (string.length === originalString.length * times) {
      return string;
    } else {
      return recur(string + originalString, times);
    }
  }
  return recur(string, times);
}

const makeBoxCeiling = width => `${BOX_CORNER}${repeat(BOX_CEILING, width - 2)}${BOX_CORNER}\n`;
// console.log(makeBoxCeiling(5));
const makeBoxPadLine = width => `${BOX_WALL}${repeat(' ', width - 2)}${BOX_WALL}\n`;
// console.log(makeBoxPadLine(5));
const makeBoxMsgLine = (msg, width) => `${BOX_WALL} ${msg} ${BOX_WALL}\n`;
// console.log(makeBoxMsgLine('x', 5));
const makeBoxPadLines   = (width, count) => {
  let result = '';
  for (let i = 1; i <= count; i++) {
    result += makeBoxPadLine(width);
  }
  return result;
}

function logInBox(str, padLines = 1) {
  let result = '';
  totalWidth = str.length + 4; // 2 spaces + 2 box chars
  result += makeBoxCeiling(totalWidth);
  result += makeBoxPadLines(totalWidth, padLines);
  result += makeBoxMsgLine(str, totalWidth);
  result += makeBoxPadLines(totalWidth, padLines);
  result += makeBoxCeiling(totalWidth);
  return result;
}

// console.log(logInBox('how about something even longer? like incredibly long. thank god for high resolution screens, amirite?'));
console.log(logInBox('To boldly go where no one has gone before.'));

// not in the mood for the further exploration, plus it is something that I have done before (in ruby track)
