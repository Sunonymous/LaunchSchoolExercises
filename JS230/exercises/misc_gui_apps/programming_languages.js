'use strict';

// Programming Language Information

// Data
const INFO = {
  elixir: {
    desc: 'Elixir is a functional, concurrent, general-purpose programming language that runs on the BEAM virtual machine which is also used to implement the Erlang programming language. Elixir builds on top of Erlang and shares the same abstractions for building distributed, fault-tolerant applications. Elixir also provides productive tooling and an extensible design. The latter is supported by compile-time metaprogramming with macros and polymorphism via protocols.',
    source: 'https://en.wikipedia.org/wiki/Elixir_(programming_language)',
  },
  clojure: {
    desc: 'Clojure is a dynamic and functional dialect of the Lisp programming language on the Java platform. Like other Lisp dialects, Clojure treats code as data and has a Lisp macro system. The current development process is community-driven, overseen by Rich Hickey as its benevolent dictator for life (BDFL). Clojure advocates immutability and immutable data structures and encourages programmers to be explicit about managing identity and its states. This focus on programming with immutable values and explicit progression-of-time constructs is intended to facilitate developing more robust, especially concurrent, programs that are simple and fast. While its type system is entirely dynamic, recent efforts have also sought the implementation of a dependent type system.',
    source: 'https://en.wikipedia.org/wiki/Clojure',
  },
  haskell: {
    desc: 'Haskell is a general-purpose, statically-typed, purely functional programming language with type inference and lazy evaluation. Designed for teaching, research and industrial applications, Haskell has pioneered a number of programming language features such as type classes, which enable type-safe operator overloading. Haskell\'s main implementation is the Glasgow Haskell Compiler (GHC). It is named after logician Haskell Curry.',
    source: 'https://en.wikipedia.org/wiki/Haskell',
  }
};

function uponDOM() {
  // Elements
  const paragraphs = Array.from(document.getElementsByClassName('description'));
  // Functions
  function citeSources() {
    const sources = Array.from(document.querySelectorAll('.source a'));
    sources.forEach((s) => {
      const language = s.parentElement.dataset.lang;
      s.href = INFO[language].source;
    });
  }

  function resizeContent(paragraphEm, shortForm = true) {
    const language = paragraphEm.dataset.lang;
    const   source = document.querySelector(`p.source[data-lang="${language}"]`);
    let    content = INFO[language].desc || 'NOT FOUND';
    if (shortForm) {
      content = content.slice(0, 120) + '...';
      source.classList.add('hidden');
    } else {
      source.classList.remove('hidden');
    }
    paragraphEm.textContent = content;
  }

  function toggleButton(e) {
    const button = e.target;
    const isShort = button.textContent.includes('More');
    const paragraph = e.target.previousElementSibling.previousElementSibling;
    button.textContent = isShort ? 'Show Less' : 'Show More';
    resizeContent(paragraph, !isShort);
  }
  // Events
  citeSources();
  paragraphs.forEach((p) => resizeContent(p));
  document.querySelectorAll('button').forEach((b) => b.addEventListener('click', toggleButton));
}

document.addEventListener('DOMContentLoaded', uponDOM);
