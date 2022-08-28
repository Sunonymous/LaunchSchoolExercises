'use strict';

var inventory;
let itemTemplate;

(function() {
  inventory = {
    lastId: 0,
    collection: [],
    setDate: function() {
      const date = new Date();
      document.querySelector('#order_date').textContent = date.toUTCString();
    },
    cacheTemplate: function() {
      const invTemplate = document.querySelector('#inventory_item');
      this.template = Handlebars.compile(invTemplate.innerHTML, {noEscape: true,});
      invTemplate.remove();
    },
    add: function() {
      this.lastId++;
      var item = {
        id: this.lastId,
        name: "",
        stock_number: "",
        quantity: 1
      };
      this.collection.push(item);

      return item;
    },
    remove: function(idx) {
      this.collection = this.collection.filter(function(item) {
        return item.id !== idx;
      });
    },
    get: function(id) {
      var found_item;

      this.collection.forEach(function(item) {
        if (item.id === id) {
          found_item = item;
          return false;
        }
      });

      return found_item;
    },
    update: function(itemEm) {
      var id = this.findID(itemEm),
          item = this.get(id);

      item.name = itemEm.querySelector("[name^=item_name]").value;
      item.stock_number = itemEm.querySelector("[name^=item_stock_number]").value;
      item.quantity = itemEm.querySelector("[name^=item_quantity]").value;
    },
    newItem: function(e) {
      e.preventDefault();
      const item = this.add();
      const itemNode = document.createElement('tr');
      itemNode.innerHTML = this.template({id: item.id});
      document.querySelector('#inventory').appendChild(itemNode);
    },
    findParent: function(e) {
      let tr = e.target;
      while (tr.tagName !== 'TR') {
        tr = tr.parentNode;
      }
      return tr;
    },
    findID: function(item) {
      return +item.querySelector("input[type=hidden]").value;
    },
    deleteItem: function(e) {
      e.preventDefault();
      var item = this.findParent(e);
      item.remove();

      this.remove(this.findID(item));
    },
    updateItem: function(e) {
      var item = this.findParent(e);

      this.update(item);
    },
    bindEvents: function() {
      // Add
      document.querySelector("#add_item").addEventListener("click", this.newItem.bind(this));
      // Delete
      document.querySelector('#inventory').addEventListener("click", (e) => {
        if (e.target.tagName === 'A' && e.target.classList.contains('delete')) {
          this.deleteItem(e);
        }
      });
      // Blur originally used event delegation, which I found a bit tricky to implement with Browser APIs.
      // Divs don't respond to blur events, so what I wound up doing was adding individual event listeners upon creation of a new item.
    },
    init: function() {
      this.setDate();
      this.cacheTemplate();
      this.bindEvents();
    }
  };
})();

document.addEventListener('DOMContentLoaded', inventory.init.bind(inventory));
