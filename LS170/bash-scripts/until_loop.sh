#!/bin/bash

counter=0
max=10

until [ $counter -gt $max ]
do
  echo Why not $counter?
  ((counter++))
done
