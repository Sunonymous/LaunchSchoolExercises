'use strict';

// Example: Loading JSON via XHR

let req = new XMLHttpRequest();
req.open('GET', 'https://api.github.com/repos/rails/rails');

req.addEventListener('load', (e) => {
  console.log('Request Complete.');
  let data;
  if (e.target) {
    data = JSON.parse(e.target.response);
    console.log(e.target.status);
    console.log(data.open_issues);
  }
});

req.addEventListener('error', (e) => {
  console.log('Your request could not be completed. Please hang up and try again.');
});

req.send();

// Sending JSON via XHR

/* 1
POST /books HTTP/1.1
HOST: ls-230-book-catalog.herokuapp.com
Content-Type: application/json; charset=utf-8
Accept: * /* (space not present in real request)

{ "title": "Eloquent JavaScript", "author": "Marijn Haverbeke" }
*/

// 2
let prodReq = new XMLHttpRequest();
prodReq.open('POST', 'https://ls-230-web-store-demo.herokuapp.com/v1/products');
prodReq.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
prodReq.setRequestHeader('Authorization', 'token AUTH_TOKEN');
const item = {
  name: 'Magic Mirror',
  sku: 'magm-324',
  price: 4200,
}

prodReq.addEventListener('load', (e) => {
  console.log(`Request completed with status ${e.target.status} - ${e.target.statusText}.`);
});

prodReq.send(JSON.stringify(item));
