'use strict';

let textExcerpt = 'To be or not to be-that is the question:\n' +
    'Whether \'tis nobler in the mind to suffer\n' +
    'The slings and arrows of outrageous fortune,\n' +
    'Or to take arms against a sea of troubles,\n' +
    'And, by opposing, end them. To die, to sleep-\n' +
    'No more-and by a sleep to say we end\n' +
    'The heartache and the thousand natural shocks\n' +
    'That flesh is heir to-\'tis a consummation\n' +
    'Devoutly to be wished. To die, to sleep-\n' +
    'To sleep, perchance to dream. Aye, there\'s the rub,\n' +
    'For in that sleep of death what dreams may come,\n' +
    'When we have shuffled off this mortal coil,\n' +
    'Must give us pause. There\'s the respect\n' +
    'That makes calamity of so long life.\n' +
    'For who would bear the whips and scorns of time,\n' +
    'Th\' oppressor\'s wrong, the proud man\'s contumely, [F: poor]\n' +
    'The pangs of despised love, the law’s delay, [F: disprized]\n' +
    'The insolence of office, and the spurns\n' +
    'That patient merit of the unworthy takes,\n' +
    'When he himself might his quietus make\n' +
    'With a bare bodkin? Who would fardels bear, [F: these Fardels]\n' +
    'To grunt and sweat under a weary life,\n' +
    'But that the dread of something after death,\n' +
    'The undiscovered country from whose bourn\n' +
    'No traveler returns, puzzles the will\n' +
    'And makes us rather bear those ills we have\n' +
    'Than fly to others that we know not of?\n' +
    'Thus conscience does make cowards of us all,\n' +
    'And thus the native hue of resolution\n' +
    'Is sicklied o\'er with the pale cast of thought,\n' +
    'And enterprises of great pitch and moment, [F: pith]\n' +
    'With this regard their currents turn awry, [F: away]\n' +
    'And lose the name of action.-Soft you now,\n' +
    'The fair Ophelia.-Nymph, in thy orisons\n' +
    'Be all my sins remembered';

let positiveWords = ['fortune', 'dream', 'love', 'respect', 'patience', 'devout', 'noble', 'resolution'];
let negativeWords = ['die', 'heartache', 'death', 'despise', 'scorn', 'weary', 'trouble', 'oppress'];

const lettersAndWhitespaceOnly = (string) => string.match(/[a-z\s]/i);
// console.log(lettersAndSpacesOnly('$'));
const filterString = (string, func) => string.split('').filter(func).join('');
// console.log(filterString(textExcerpt, lettersAndSpacesOnly));

const sentimentFilter = {
    positiveWords,
    negativeWords,
}

const count = (col, val) => col.filter((em) => em === val).length;

const textToWords = (string) => filterString(string.toLowerCase(), lettersAndWhitespaceOnly).split(/\s/);

// this was used before I remembered i needed to save the matched words... now it just sits here.
const countWordsInString = (string, words) => {
    const text = textToWords(string);
    return words.reduce((total, word) => total + count(text, word), 0);
};

const filterWordsFromString = (allWords, queryWords) => queryWords.filter((word) => allWords.includes(word));
// console.log(filterWordsFromString(textToWords(textExcerpt), positiveWords));

// countWordsInString(textExcerpt, positiveWords)

const sentiment = (text, filter) => {
    const words           = textToWords(text);
    const positiveMatches = filterWordsFromString(words, filter.positiveWords);
    const positiveCount   = countWordsInString(text, filter.positiveWords);
    const negativeMatches = filterWordsFromString(words, filter.negativeWords);
    const negativeCount   = countWordsInString(text, filter.negativeWords);
    const resonance       = positiveCount + (-1 * negativeCount);
    let sentiment;
    if (resonance === 0) {
        sentiment = 'Neutral';
    } else {
        sentiment = resonance > 0 ? 'Positive' : 'Negative';
    }

    console.log(`There are ${positiveCount} positive words in the text:`);
    console.log(`Positive sentiments: ${positiveMatches.join(', ')}\n`);
    console.log(`There are ${negativeCount} negative words in the text:`);
    console.log(`Negative sentiments: ${negativeMatches.join(', ')}\n`);
    console.log(`The sentiment of the text is ${sentiment}.`);
}

sentiment(textExcerpt, sentimentFilter);

// console output

// There are 5 positive words in the text.
// Positive sentiments: fortune, dream, respect, love, resolution

// There are 6 negative words in the text.
// Negative sentiments: die, heartache, die, death, weary, death

// The sentiment of the text is Negative.
