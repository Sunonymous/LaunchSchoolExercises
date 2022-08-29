'use strict';

// Photo Gallery w/ API

function compileTemplates() {
  const templates = {};
  const ids = ['#photos', '#photo_information', '#photo_comments', '#photo_comment'];
  ids.forEach((s) => {
    const template = document.querySelector(s);
    if (template.dataset.type === 'partial') {
      Handlebars.registerPartial(template.id, template.innerHTML);
    } else {
      templates[template.id] = Handlebars.compile(template.innerHTML);
    }
    template.remove(); // clean 'er up!
  });
  return templates;
}

async function uponDOM() {
  // Templates
  const templates = compileTemplates();

  // Elements
  const   slidesDiv = document.querySelector('#slides');
  const   photoInfo = document.querySelector('section > header');
  const commentList = document.querySelector('#comments ul');
  const  prevButton = document.querySelector('a.prev');
  const  nextButton = document.querySelector('a.next');
  const commentForm = document.querySelector('form');
  const submitBtn = document.querySelector('input[type="submit"]');
  let    likeButton; // re-rendered with every new photo
  let     favButton; // re-rendered with every new photo

  // Data
  let photoData;
  let photoElems;
  let visibleIdx = 0;

  // Functions
  function photoJumper(delta) {
    return (e) => {
      e.preventDefault();
      let newIndex = visibleIdx + delta;
      if (newIndex <= -1) newIndex = photoElems.length - 1;
      if (newIndex >= photoElems.length) newIndex = 0;
      photoElems[visibleIdx].classList.add('hidden');
      photoElems[visibleIdx].classList.remove('visible');
      visibleIdx = newIndex;
      showPhoto(visibleIdx);
    }
  }

  async function getAllPhotos() {
    const photoData = await fetch('/photos').then((data) => data.json()).then((json) => json);
    slidesDiv.innerHTML = templates.photos({photos: photoData});
    photoElems = document.querySelectorAll('#slides figure');
    photoElems.forEach((p) => p.classList.add('hidden'));
    return photoData;
  }

  async function showPhoto(idx) {
    const photo = photoData[idx];
    photoElems[idx].classList.remove('hidden');
    photoElems[idx].classList.add('visible');
    renderPhotoInfo(photo);
    renderComments({comments: await loadComments(photoElems[idx].dataset.id)});
    likeButton = document.querySelector('.actions .like');
    favButton = document.querySelector('.actions .favorite');

    // update the form photo_id value
    document.querySelector('input[name="photo_id"]').value = photo.id;

    // Strange that these buttons are continually created. That seems unnecessary.
    likeButton.addEventListener('click', (e) => {
      e.preventDefault();
      sendPost('/photos/like', `photo_id=${photoData[idx].id}`);
    });
    favButton.addEventListener('click', (e) => {
      e.preventDefault();
      sendPost('/photos/favorite', `photo_id=${photoData[idx].id}`);
    });
  }

  const    loadComments = async (id) => await fetch(`/comments?photo_id=${id}`).then((data) => data.json());
  const renderPhotoInfo = (data) => photoInfo.innerHTML = templates.photo_information(data);
  const  renderComments = (data) => commentList.innerHTML = templates.photo_comments(data);

  // paths '/photos/like' && '/photos/favorite'
  async function sendPost(path, data) {
    const isLike = path.includes('like');
    let xhr = new XMLHttpRequest();
    xhr.open('POST', path);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.responseType = 'json';
    xhr.addEventListener('load', (e) => {
      updatePhotoData(path, xhr.response.total);
      refreshLikeFavButtons(isLike, xhr.response.total);
    });
    xhr.onerror = (e) => alert(`Error! ${e.message}`);
    xhr.send(data);
  }

  function updatePhotoData(path, amount) {
    if (path === '/photos/like') {
      photoData[visibleIdx].likes = amount;
    } else if (path === '/photos/favorite') {
      photoData[visibleIdx].favorites = amount;
    } else {
      return false;
    }
    return true;
  }

  function refreshLikeFavButtons() {
    const formats = {
      'a.button.like': {
        amount: photoData[visibleIdx].likes,
        symbol: '♡',
        keyword: 'Likes',
      },
      'a.button.favorite': {
        amount: photoData[visibleIdx].favorites,
        symbol: '☆',
        keyword: 'Favorites',
      }
    };
    ['a.button.like', 'a.button.favorite'].forEach((selector) => {
      const button = document.querySelector(selector);
      const data = formats[selector];
      const sym = data.symbol;
      const amt = data.amount;
      const kyw = data.keyword;
      button.textContent = `${sym} ${amt} ${kyw}`;
    });
  }

  async function submitComment(e) {
    e.preventDefault();
    const data = new URLSearchParams(new FormData(commentForm));
    const activeID = photoElems[visibleIdx].getAttribute('data-id');

    await fetch('/comments/new', {
      method: 'POST',
      body: data,
    }).then(async (response) => {
      console.log(await response.json());
      const allComments = await loadComments(photoElems[visibleIdx].dataset.id);
      renderComments({comments: allComments});
      commentForm.reset();
    }).catch((err) => {
      alert(`Error! ${err.message}`);
    });
  }

  // Events
  prevButton.addEventListener('click', photoJumper(-1));
  nextButton.addEventListener('click', photoJumper(1));
  commentForm.addEventListener('submit', submitComment);

  // Start the Show!
  photoData = await getAllPhotos();
  showPhoto(visibleIdx);
}

document.addEventListener('DOMContentLoaded', uponDOM);
