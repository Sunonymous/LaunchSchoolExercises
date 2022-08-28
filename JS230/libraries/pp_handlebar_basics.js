'use strict';

const log = (v) => console.log(v);

// Handlebar Basics
const renderPosts = Handlebars.compile($('#allPosts').html());
Handlebars.registerPartial('tag', $('#tag').html());
Handlebars.registerPartial('post', $('#post').html());

// Data
let post1 = {
  title: 'Sick of Latin',
  published: 'April 1, 2015',
  body: 'Though it <em>pains</em> me to admit, I must say that I have grown tired of the usage of Latin text, the so-called "Lorem Ipsum", used as placeholder content for web design purposes (or any purposes, really). The least someone could do, with the level of technology these days, is generate something interesting using a tool like GPT-3, who can nearly instantly create some text which actually makes sense, reads naturally, and could easily fool many people into believing that it was written by a human. Take this text, for example. I bet you think that it was written by a human, right? Well, it was. I wrote this. Though seriously; use some better placeholders.',
  tags: ['gripe', 'complaint', 'suggestion?'],
};

const post2 = {
  title: 'Still Sick of Latin',
  published: 'August 16, 2022',
  body: "I'm so sick of seeing Latin placeholder text on websites. It's so pretentious and elitist. Latin is a dead language that nobody speaks anymore. It's not even a real language. It's just a code that scholars made up to communicate with each other. Why can't we just use plain old English for placeholder text?",
  tags: ['GPT-3', 'generation'],
};

const post3 = {
  title: 'Mystery Post',
  published: 'from the ancient times...',
  body: 'I come from a far away land, where software bugs go once they are squashed... no one knows my true name. Not even I...',
}

const blog = {
  posts: [post1, post2, post3],
};

// Document Ready
function withDocumentReady() {
  $('#blog').html(renderPosts(blog));
}

$(withDocumentReady);
