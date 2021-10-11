#!/bin/bash

echo If word \'Hello\' is not empty, it will be displayed.

string='Hello'

if [[ -n $string ]]
then
  echo $string
fi

sleep 1

# ---

echo If $integer_1 and $integer_2 are the same, it will be announced.
integer_1=100
integer_2=1000
echo . . .
if [[ $integer_1 -eq $integer_2 ]]
then
  echo $integer_1 and $integer_2 are the same!
else
  echo $integer_1 and $integer_2 are, in fact, not the same!
fi
sleep 1

# ---

echo Let\'s check for a file in the current directory.
echo enter a file to check for:
read filename
filepath="./${filename}"
echo Checking for file $filepath
if [[ -e $filepath ]]
then
  echo File $filepath exists!
else
  echo File $filepath was not found.
fi

sleep 1

# ---

echo Nested if conditional expression.
integer=3

echo Let\'s check out the number $integer.

if [[ $integer -lt 10 ]]
then
  echo Good news! $integer is less than 10.

  if [[ $integer -lt 5 ]]
  then
    echo Great news! $integer is also less than 5.
  fi
fi

sleep 1

# ---

echo If-then-else conditional expression.

integer=150000

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10.
else
  echo $integer is not less than 10.
fi

sleep 1

# ---

echo If-then-elseif-then-else expression. What a mouthful.

integer=9

echo Checking out numbah $integer, baby!

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10. Woo.
elif [[ $integer -gt 20 ]]
then
  echo $integer is greater than 20. Woo.
else
  echo $integer is between 10 and 20. Woo.
fi

sleep 1

# ---

echo Boolean operators!

integer=15

if [[ $integer -gt 10 ]] && [[ $integer -lt 20 ]]
then
  echo $integer is between 10 and 20.
fi

echo Aren\'t you glad we have other programming languages?

sleep 1

# ---

echo This-and-that!

lowerend=50
higherend=100
integer=12

echo There is a secret window between $lowerend and $higherend . Can you find a number in between?

if [ $integer -lt $higherend ] && [ $integer -gt $lowerend ]
then
  echo The number $integer is in the window, aka greater than $lowerend or less than $higherend !
else
  echo Nope. That wasn\'t it.
fi

# ---

echo BANG!

echo Can we play something else now?

integer=8

if ! ([ $integer -lt 5 ] || [ $integer -gt 10 ])
then
  echo $integer is between 5 and 10.
fi

# ---


