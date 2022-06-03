'use strict';

/*
Problem-->
Ditching the template again! Living on the edge!

-- I/O
---- Input  ->
---- Output ->
---- Edges  ->


-- Rules


-- Questions


-- Notes

*/

// Helpers
const range            = (len, from) => [...Array(len).keys()].map((n) => n + from);
const log              =       (val) => console.log(val);
const randInt          = (min, max) => Math.floor(Math.random() * (max - min) + min);
const alphabet         = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
const digits           = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
const displayNameChars = alphabet.concat(alphabet.map(c => c.toLowerCase()), digits);
const retLog           = (v) => {
  log(v);
  return v;
};

const DISPLAY_NAME_LEN = 16;
const BAD_PASSWORD = 'Invalid password';

const genDisplayName = () => {
  let result = '';
  while (result.length < DISPLAY_NAME_LEN) {
    result += displayNameChars[randInt(0, displayNameChars.length)];
  }
  return result;
};

// Primary

let Account = (function() {
  const DATA = [];
  let accountObj = {};
  let email;
  let password;
  let firstName;
  let lastName;

  const doIfValidPassword = function(pwd, func, ...args) {
    if (pwd === password) {
      func.call(this, ...args);
    } else {
      log(BAD_PASSWORD);
    }
  }

  return {
    init: function(eml, passwd, fName, lName) {
      email       = eml,
      password    = passwd,
      firstName   = fName;
      lastName    = lName;
      this.displayName = genDisplayName();
      return this;
    },

    reanonymize: function(pwd) {
      doIfValidPassword(pwd, function() {
        disName = genDisplayName();
      });
    },

    resetPassword: function(currentPass, newPass) {
      doIfValidPassword(currentPass, function() {
        password = newPass;
      });
    },

    firstName: function(pwd) {
      doIfValidPassword(pwd, function() {
        return retLog(firstName);
      })
    },

    lastName: function(pwd) {
      doIfValidPassword(pwd, function() {
        return retLog(lastName);
      });
    },

    email: function(pwd) {
      doIfValidPassword(pwd, function() {
        return retLog(email);
      });
    },
  };
})();

let sunny = Object.create(Account).init('sunnysupersun@rainingsunshine.net', 'sneakysneaker', 'Sunny', 'Ynnus');
sunny.firstName('sneakysneaker');
sunny.lastName('sneakysneaker');
sunny.email('sneakysneaker');
log(sunny.displayName);

// this has a lot of duplication still... had some ideas but I've been so tired that I'm making so many unnecessary mistakes in the works of this.
// maybe I'll return to it. maybe
