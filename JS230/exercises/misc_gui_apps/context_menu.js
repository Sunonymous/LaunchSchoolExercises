'use strict';

// Custom Delete Confirmation

// Data
let todos = [
  {id: 0, task: 'Rewrite the Matrix'},
  {id: 1, task: 'Heat Vision Correction Surgery'},
  {id: 2, task: 'Plan Afterlife'},
  {id: 3, task: 'Some Drudgery'},
];

let deleteQueue = null; // tracks which id is going to be deleted

function uponDOM() {
  // Elements
  const       todoPanel = document.querySelector('.panel');
  const confirmationBox = document.querySelector('#confirmation-box');
  const      confirmYes = document.querySelector('#confirm-delete');
  const       confirmNo = document.querySelector('#confirm-cancel');
  const     contextMenu = document.querySelector('#context-menu');
  const  deleteMenuItem = document.querySelector('#delete-from-menu');

  // Functions
  function deleteQueuedTask() {
    if (deleteQueue) {
      todos = todos.filter((t) => t.id !== Number(deleteQueue));
      confirmationBox.classList.add('is-hidden');
      document.querySelector(`label[data-id="${deleteQueue}"]`).remove();
      deleteQueue = null;
    }
  }

  function cancelDeletion() {
    deleteQueue = null;
    confirmationBox.classList.add('is-hidden');
  }

  function addTask(item) {
    const todo = document.createElement('label');
    todo.classList.add('panel-block', 'is-justify-content-flex-start');
    todo.setAttribute('data-id', item.id);
    todo.innerHTML = `<input type="checkbox">${item.task}`;
    todo.addEventListener('contextmenu', (e) => {
      e.preventDefault();
      if (!contextMenu.classList.contains('is-hidden')) return;
      deleteQueue = todo.dataset.id;
      contextMenu.style.left = `${e.clientX}px`;
      contextMenu.style.top = `${e.clientY}px`;
      contextMenu.classList.remove('is-hidden');
    });
    todoPanel.appendChild(todo);
  }

  const hideContextMenu = () => contextMenu.classList.add('is-hidden');

  // Events
  deleteMenuItem.addEventListener('click', (e) => {
    confirmationBox.classList.remove('is-hidden');
    contextMenu.classList.add('is-hidden');
  });
  todos.forEach((t) => addTask(t));
  confirmYes.addEventListener('click', deleteQueuedTask);
  confirmNo.addEventListener('click', cancelDeletion);
  document.body.addEventListener('click', hideContextMenu);
}

document.addEventListener('DOMContentLoaded', uponDOM);
