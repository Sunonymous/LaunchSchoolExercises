'use strict';

const log = (v) => console.log(v);

// Requirements
// Helper Functions
const filterChars     =   (s, f) => s.split('').filter(f).join('');
const noWhitespace    =      (c) => !!c.match(/\S/);
const stripWhitespace =      (s) => filterChars(s, noWhitespace);
const isPositive      =      (n) => typeof n === 'number' && n >= 0;
const onlyOneWord     =      (s) => !s.match(/\s/);
const overrideProps   = (oT, oF) => Object.keys(oF).forEach((k) => oT[k] = oF[k]);


class Item {
  static #buildSKU = function(name, cat) {
    name = stripWhitespace(name).toUpperCase();
    cat  = stripWhitespace(cat).toUpperCase();
    return name.slice(0, 3) + cat.slice(0, 2);
  }

  static #validQty  =  (qty) => isPositive(qty);
  static #validName = (name) => stripWhitespace(name).length >= 5;
  static #validCat  =  (cat) => onlyOneWord(cat) && cat.length >= 5;

  constructor(itemName, category, quantity) {
    let invalid = false;
    Item.#validName(itemName) ? this.name     = itemName : invalid = true;
    Item.#validCat(category)  ? this.category = category : invalid = true;
    Item.#validQty(quantity)  ? this.quantity = quantity : invalid = true;
    this.SKU = Item.#buildSKU(itemName, category);
    return invalid ? {notValid: true} : this;
  }
}

class ItemManager {
  static items = []

  static create(itemName, category, quantity) {
    const newObj = new Item(itemName, category, quantity);
    if (newObj.notValid) return false;
    ItemManager.items.push(newObj);
    return newObj;
  }

  static update(sku, updatedProperties) {
    ItemManager.items.forEach((i) => {
      if (i.SKU === sku) overrideProps(i, updatedProperties);
    });
  }

  static delete(sku) {
    const itemIdx = ItemManager.items.findIndex((i) => i.SKU === sku);
    const NOT_FOUND = `Item with SKU: '${sku}' not found in inventory.`;
    itemIdx === -1 ? log(NOT_FOUND) : ItemManager.items.splice(itemIdx, 1);
    return itemIdx !== -1;
  }

  static inStock() {
    log(ItemManager.items.filter((i) => i.quantity > 0));
  }

  static itemsInCategory(category) {
    log(ItemManager.items.filter((i) => i.category === category));
  }
}

class ReportsManager {
  static #items = null;

  static init(mgr) {
    ReportsManager.#items = mgr;
  }

  static createReporter(sku) {
    return {
      itemInfo: function() {
        let item = ReportsManager.#items.items.find((i) => i.SKU === sku);
        if (item === undefined) {
          log('Item with SKU ${sku} not found.');
          return null;
        } else {
          Object.entries(item).map(([k, v]) => `${k}: ${v}`).map(log);
        }
      }
    }
  }

  static reportInStock() {
    const inStock = ReportsManager.#items.items.filter((i) => i.quantity > 0);
    log(inStock.map((i) => i.name).join(', '));
  }
}

/*
// PERSONAL TESTS

ItemManager.create('Peanut Butter', 'Grocery', 3);
ItemManager.create('Uvita', 'Medicine', -3);
ItemManager.create('Orange Juice', 'Grocery', 0);
ItemManager.create('Toaster Oven', 'Appliances', 2);
ItemManager.create('Band-Aids', 'FirstAid', 74); // sold individually. go figure
// ItemManager.delete('MEGAZ');
ItemManager.delete('ORAGR'); // people just aren't thirsty anymore!
// log(ItemManager.items);
// ItemManager.inStock();
// ItemManager.itemsInCategory('Grocery');
// ItemManager.update('BANFI', {quantity: 240}); // it's an epidemic of kitties scratching people!
// ItemManager.itemsInCategory('FirstAid');
ReportsManager.init(ItemManager);
let toastRep = ReportsManager.createReporter('TOAAP');
let fakeItem = ReportsManager.createReporter('DINGUS');
// log(fakeItem === null);
// toastRep.itemInfo();
ReportsManager.reportInStock();

// END OF PERSONAL TESTS
*/

// tested with the LS tests too,
// which showed me something I had implemented differently than they wanted.
// (reporter's `itemInfo` method is dynamic, in the sense that nothing is cached like I had it)
// it was adjusted, though
