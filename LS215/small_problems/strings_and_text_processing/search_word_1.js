'use strict';

// given a query word and an extended string of text, return the number of
// case-insensitive occurrences of the query word exist in the source text

const filterString         = (string, func) => string.split('').filter(func).join('');
const wordsAndWhitespace   = (c)      => c.match(/[a-z\s\-]/i);
const stripString          = (string) => filterString(string, wordsAndWhitespace).trim();
const sentenceToWords      = (string) => stripString(string).split(' ');

const searchWord = (query, source) => {
  query = query.toLowerCase(); // equalize case
  const sourceWords  = sentenceToWords(source.toLowerCase());
  const matchedWords = sourceWords.filter((word) => word === query);
  return matchedWords.length;
}

const text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

console.log(searchWord('sed', text));      // 3
console.log(searchWord('qui', text));
