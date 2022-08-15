'use strict';

// Article Highlighter

function walk(node, callback) {
  callback(node);

  for (let index = 0; index < node.children.length; index += 1) {
    walk(node.children[index], callback);
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const   header = document.querySelector('header');
  const     main = document.querySelector('main');
  const    links = document.querySelectorAll('a');
  const articles = document.querySelectorAll('article');

  function removeHighlights() {
    const main = document.querySelector('main');
    walk(main, (n) => n.classList.remove('highlight'));
  }

  function highlightArticle(id) {
    removeHighlights();
    document.getElementById(id).classList.add('highlight');
  }


  document.body.addEventListener('click', (e) => {
    let clickedOnArticleOrLink = false;

    articles.forEach((a) => {
      if (a.contains(e.target)) {
        removeHighlights();
        highlightArticle(a.id);
        clickedOnArticleOrLink = true;
        e.stopPropagation();
      }
    });

    links.forEach((l) => {
      if (e.target === l) {
        removeHighlights();
        const fullLink = l.href;
        const hashIdx  = fullLink.lastIndexOf('#');
        const article  = fullLink.slice(hashIdx + 1);
        highlightArticle(article);
        e.stopPropagation();
        clickedOnArticleOrLink = true;
      }
    });

    if (!clickedOnArticleOrLink) {
      removeHighlights();
      main.classList.add('highlight');
    }
  });

});
