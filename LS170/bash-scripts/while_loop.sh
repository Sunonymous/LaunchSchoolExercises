#!/bin/bash

counter=0
max=10

while [ $counter -le $max ]
do
  echo It is about $counter.
  ((counter++))
done
