'use strict';

const SENTENCE_TERMINATORS = /[\.\!\?]+\s*/;

const longerOfTwo          = (a, b) => a.length > b.length ? a : b;
const validWord            = (str)  => str.match(/^\w+$/);
const lettersAndWhitespace = (c) => c.match(/[a-z\s]/i);
const filterString         = (string, func) => string.split('').filter(func).join('');

// via this methodology, hyphenated words are considered a single word (because the hyphen is lost)
const stripString          = (string) => filterString(string, lettersAndWhitespace);

const longestSentence = (text) => {
  const sentences       = text.split(SENTENCE_TERMINATORS);
  const longestSentence = sentences.reduce(longerOfTwo);

  // the or branch handles the case of when the final terminator of the original string is missing
  const terminator      = text[text.indexOf(longestSentence) + longestSentence.length] || '.';
  const words           = stripString(longestSentence).split(/\s+/).filter(validWord);
  console.log(longestSentence + terminator + '\n');
  console.log(`The longest sentence has ${words.length} words.\n`);
}

const longText = 'Four score and seven years ago our fathers brought forth' +
  ' on this continent a new nation, conceived in liberty, and' +
  ' dedicated to the proposition that all men are created' +
  ' equal.' +
  ' Now we are engaged in a great civil war, testing whether' +
  ' that nation, or any nation so conceived and so dedicated,' +
  ' can long endure. We are met on a great battlefield of that' +
  ' war. We have come to dedicate a portion of that field, as' +
  ' a final resting place for those who here gave their lives' +
  ' that that nation might live. It is altogether fitting and' +
  ' proper that we should do this.' +
  ' But, in a larger sense, we can not dedicate, we can not' +
  ' consecrate, we can not hallow this ground. The brave' +
  ' men, living and dead, who struggled here, have' +
  ' consecrated it, far above our poor power to add or' +
  ' detract. The world will little note, nor long remember' +
  ' what we say here, but it can never forget what they' +
  ' did here. It is for us the living, rather, to be dedicated' +
  ' here to the unfinished work which they who fought' +
  ' here have thus far so nobly advanced. It is rather for' +
  ' us to be here dedicated to the great task remaining' +
  ' before us -- that from these honored dead we take' +
  ' increased devotion to that cause for which they gave' +
  ' the last full measure of devotion -- that we here highly' +
  ' resolve that these dead shall not have died in vain' +
  ' -- that this nation, under God, shall have a new birth' +
  ' of freedom -- and that government of the people, by' +
  ' the people, for the people, shall not perish from the' +
  ' earth.';

longestSentence(longText);

// console output
// It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth.
//
// The longest sentence has 82 words. ("--" are not words!)

// Assuming the last sentence is removed:
// console output
// Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.
//
// The longest sentence has 30 words.
