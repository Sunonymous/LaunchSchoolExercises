'use strict';

// Exotic Animals

function uponDOM() {
  let macyEm;

  // Data
  const    timeouts = {};
  let activeTooltip = null;

  // Functions
  const showImages = () => {
    $('img').removeClass('hidden');
    macyEm = Macy({
      container: '#macyContainer',
      columns: 3,
      waitForImages: true,
    });
  }

  function queueTooltip(e) {
    const imageName = e.target.dataset.name;
    if (!timeouts[imageName]) {
      timeouts[imageName] = setTimeout(() => showTooltip(imageName), 2000);
    }
  }

  function unscheduleTooltip(e) {
    const imageName = e.target.dataset.name;
    if (timeouts[imageName]) {
      clearTimeout(timeouts[imageName]);
      timeouts[imageName] = null;
    }
    if (activeTooltip === imageName) {
      hideTooltip(imageName);
    }
  }

  function showTooltip(name) {
    $(`figcaption[data-name="${name}"]`).addClass('show');
    activeTooltip = name;
  }

  function hideTooltip(name) {
    $(`figcaption[data-name="${name}"]`).removeClass('show');
     activeTooltip = null;
    timeouts[name] = null;
  }

  // Events
  $(window).on('load', showImages);
  $('img').mouseenter(queueTooltip);
  $('img').mouseleave(unscheduleTooltip);
}

document.addEventListener('DOMContentLoaded', uponDOM);
