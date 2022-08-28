'use strict';

const log = (v) => console.log(v);

// Tab Navigation
// A selection of obscure haikus.
// poems generated pseudo-randomly from https://www.poem-generator.org.uk/

function doWithDOM() {
  log('Dom is ready.');
  const $articles = $('article');

  $('a').click((e) => {
    e.preventDefault();
    $articles.hide().filter('[data-poem="' + e.target.dataset.poem + '"]').show();
  });

  $articles.hide();
}

$(doWithDOM);
