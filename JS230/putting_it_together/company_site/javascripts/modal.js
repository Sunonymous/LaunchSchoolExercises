'use strict';

// Modal

// seems inappropriate to have data hosted within this file
// could be read in from external source to be more changeproof
// ...
// the module itself could be made a little more extensible in general
// I tried playing with CSS transitions and had little success,
//   wondering if it is because I was using RGB values

const DATA = {
  Kevin: {
    name: 'Kevin Wang',
    bio: 'Hey, I am Kevin. I like to make computers work better.',
    img: './images/img_kevin.jpg',
  },
  Louis: {
    name: 'Louis the Man',
    bio: 'Hey, I am Louis. I like to work with computers and the internet.',
    img: './images/img_louis.jpg',
  },
  Kasper: {
    name: 'Kasper the Non-Ghost',
    bio: 'Hey, I am Kasper. I like to be alive and do a variety of things related to computers.',
    img: './images/img_kasper.jpg',
  },
  Chris: {
    name: 'Chris Lee',
    bio: 'Hey, I am Chris. I like everything related to Launch School, because it is a beautiful thing that I started and has done a lot of wonderful things for many people.',
    img: './images/img_chris.jpg',
  },
};

function uponDOM() {
  // Elements
  const      modal = document.querySelector('#modal');
  const modalClose = document.querySelector('#modalClose');
  const   modalTTL = document.querySelector('#modalTitle');
  const   modalIMG = document.querySelector('#modalImg');
  const   modalTXT = document.querySelector('#modalTxt');
  const modalLinks = document.querySelectorAll('.modalLink');
  // Functions
  const  openModal = () => modal.style.display = 'block';
  const closeModal = () => modal.style.display = 'none';

  function populate(employee) {
    let data = DATA[employee];
    modalTTL.textContent = data.name;
    modalIMG.src = data.img;
    modalTXT.textContent = data.bio;
  }
  // Events
  for (let i = 0; i < modalLinks.length; i += 1) {
    modalLinks[i].addEventListener('click', (e) => {
      e.preventDefault();
      const employee = e.target.parentElement.textContent.trim();
      populate(employee);
      openModal();
    });

    modalClose.addEventListener('click', closeModal);
    modal.addEventListener('click', (e) => {
      e.stopPropagation();
      e.target.id === 'modal' ? closeModal() : null;
    });
  }

  document.addEventListener('keyup', (e) => e.key === 'Escape' ? closeModal() : null);
}

document.addEventListener('DOMContentLoaded', uponDOM);
