'use strict';

const log = (v) => console.log(v);

log('unShuffler --- START');

// adjust first h1 element into the site header (with nav) and move that header to the top of body (where heads belong!)
const siteHeader = document.getElementsByTagName('header')[1];
const siteHeading = document.getElementsByTagName('h1')[0];
siteHeader.insertAdjacentElement('afterbegin', siteHeading);
document.body.insertAdjacentElement('afterbegin', siteHeader);

// swap images
let babyMopIMG;
let chinStickIMG;
[babyMopIMG, chinStickIMG] = document.getElementsByTagName('img');
babyMopIMG.insertAdjacentElement('beforebegin', chinStickIMG);
const secondFigure = document.getElementsByTagName('figure')[1];
secondFigure.insertAdjacentElement('afterbegin', babyMopIMG);

// move figures into article
const article = document.getElementsByTagName('article')[0];
Array.prototype.slice.call(document.getElementsByTagName('figure')).forEach((f) => article.insertAdjacentElement('beforeend', f));

log('unShuffler --- FINISH');
