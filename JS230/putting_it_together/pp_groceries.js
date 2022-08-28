'use strict';

// Grocery List

function uponDOM() {
  // Elements
  const     $form = $('form').eq(0);
  const     $list = $('ul').eq(0);
  const     $item = $('#itemName');
  const $quantity = $('#itemQuantity');
  // Data
  const liTemplate = '<li class="list-group-item">QTY ITM</li>';
  // Functions
  const clearForm = () => $('input').val('');
  const formatLI = (itm, qty) => liTemplate.replace('ITM', itm).replace('QTY', qty);
  // Events
  $form.submit((e) => {
    e.preventDefault();
    $list.append(formatLI($item.val(), $quantity.val() || '1'))
    clearForm();
  });
}

$(uponDOM);
