'use strict';

// What You See is What You Get (Editor)

function uponDOM() {
  // Elements
  const buttons = document.querySelectorAll('button');
  const contextWindow = document.querySelector('#editableContent');

  // Data
  const linkRegEx = /(http|https|ftp):\/\/(\S*)/; // courtesy of https://regex101.com/r/jWeZok/1

  // Functions
  function updateIcons() {
    buttons.forEach((b) => {
      const command = b.dataset.cmd;
      const icon = b.querySelector('i');
      document.queryCommandState(command) ? icon.classList.add('mdi-rotate-45') : icon.classList.remove('mdi-rotate-45');
    });
  }

  function getLink(selection) {
    if (selection.isCollapsed) {
      alert('Please select some text to create a link.');
      return;
    }
    const link = prompt('Enter url to link to.');
    const value = linkRegEx.test(link) ? selection : undefined;
    if (!value) alert('Invalid link provided.');
    return value;
  }

  // Events
  buttons.forEach((b) => b.addEventListener('click', (e) => {
    const command = b.dataset.cmd;
    let value;
    if (command === 'createLink') value = getLink(document.getSelection());
    document.execCommand(command, false, value);
    updateIcons();
  }));

  document.addEventListener('selectionchange', updateIcons);
  updateIcons();
}

document.addEventListener('DOMContentLoaded', uponDOM);
