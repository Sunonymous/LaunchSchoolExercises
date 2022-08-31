'use strict';

const log = (v) => console.log(v);
const sum = (a, b) => a + b;

// Multiple Choice Quiz!
// The order of the questions (as reflected by the question `id`s) is significant.

// answer is index in options property
const quiz = {
  title: 'Personal Info',
  questions: [
    {
      id: 0,
      tag: 'name',
      question: 'What is my name?',
      options: ['Sunshine', 'Sunnerific', 'Sunny', 'Sunshadow'],
      answer: 2,
    },
    {
      id: 1,
      tag: 'school',
      question: 'What school am I studying at?',
      options: ['NASA Culinary School', 'Launch School', 'School Of Hard Knocks', 'Berkeley School Of Optical Science'],
      answer: 1,
    },
    {
      id: 2,
      tag: 'state',
      question: 'What state do I live in?',
      options: ['Idaho', 'Arkansas', 'Wyomington', 'Delusion'],
      answer: 3,
    },
  ],
};

function uponDOM() {
  // Elements
  const   $quiz = $('#quizForm');
  const $submit = $('#submitBtn');

  // Templates
  Handlebars.registerHelper('stripSpaces', (str) => str.split('').filter((c) => c !== ' ').join(''));
  const quizTemplate = Handlebars.compile($('#quizTemplate').html());

  // Functions
  const     questionNames = () => quiz.questions.map((q) => q.tag);
  const   questionAnswers = () => quiz.questions.map((q) => q.options[q.answer]);
  const  questionElements = () => questionNames().map((n) => document.getElementsByName(n));
  const questionResponses = () => questionNames().map(getCheckedValue);
  const   getCheckedValue = (n) => document.querySelector(`input[name=${n}]:checked`).value;

  function allQuestionsAnswered() {
    const   checkedStatus = questionElements().map((ems) => Array.from(ems).map((em) => em.checked));
    const oneOrMoreMarked = checkedStatus.map((cs) => cs.some((x) => !!x));
    return oneOrMoreMarked.every((n) => !!n);
  }

  function gradeResponses() {
    const responses = questionResponses();
    const   answers = questionAnswers();
    const   correct = responses.map((r, i) => r === answers[i]).reduce(sum); // implicit coercion of bool to number!
    // oh wait, I need side-effects...
    questionNames().forEach((n, i) => {
      const callout = document.getElementById(`${n}Callout`);
      const correct  = responses[i] === answers[i];
      const color = correct ? 'success' : 'alert';
      const text = correct ? 'You got it right!' : `You got it wrong! The correct answer is '${answers[i]}'.`;
      callout.textContent = text;
      callout.classList.add(color);
      callout.classList.remove('hidden');
    });
  }

  function resetQuiz() {
    $submit.prop('disabled', false);
    $('.callout').addClass('hidden');
    // radio inputs are cleared automatically
  }

  // Events
  $submit.before(quizTemplate(quiz)); // populate quiz questions

  $('#quizForm').submit((e) => {
    e.preventDefault();
    if (allQuestionsAnswered()) {
      $submit.prop('disabled', true);
      gradeResponses();
    } else {
      alert('Please answer all questions before submitting!');
    }
  });

  $('#resetBtn').click(resetQuiz);
}

$(uponDOM);
