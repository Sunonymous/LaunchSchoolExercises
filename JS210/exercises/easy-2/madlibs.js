// Mad libs

// I took this one way farther than it needed to be taken.
// Limitations:
// only works with parts of speech directly in the story text, so "stories about literature" aren't really allowed
// this could be worked around, though I had to play with JS regexp A LOT in order to get this working okay...

const rlSync = require('readline-sync');

const getXPartOfSpeech = (part) => () => rlSync.question(`Enter a ${part}: `);
const getNoun = getXPartOfSpeech('noun');
const getVerb = getXPartOfSpeech('verb');
const getAdjective = getXPartOfSpeech('adjective');
const getInterjection = getXPartOfSpeech('interjection');

const stripSpecialCharacters = match => match.substring(2);
const regExp = /(noun|verb|adjective|interjection)/;

const funcs = {
  noun: getNoun,
  verb: getVerb,
  adjective: getAdjective,
  interjection: getInterjection,
}

function madlibs(story) {
  if (story.match(regExp)) {
    story = story.replace(regExp, funcs[story.match(regExp)[0]]());
    return madlibs(story);
  } else {
    return story;
  }
}

const story = 'In the noun of the moon, a adjective egg lay on a leaf.\nOne Sunday noun, the adjective noun came up, when... interjection!\nOut of the egg came a adjective and very adjective noun.';
console.log(madlibs(story));
