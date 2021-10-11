#!/bin/bash
echo 'Please, tell me a word.'
read word

if [[ -n $word ]]
then
  echo Your word \'$word\' was really something. Thank you for your cooperation.
else
  echo I am disappointed that you chose not to comply.
fi
