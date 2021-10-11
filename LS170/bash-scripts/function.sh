#!/bin/bash

greeting () {
  echo Hello $1
}

echo Good day. What do you call yourself?
read name
greeting $name

echo "Well, $name, do you fancy yourself a sailor? (y/n)"
read answer

echo I won\'t check. Was just curious. Good luck and all.
