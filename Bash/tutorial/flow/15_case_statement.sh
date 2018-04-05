#!/bin/bash

function colour () {
  case $1 in
    black)
      echo "black";;
    red)
      echo "red";;
    blue)
      echo "blue";;
    *)
      echo "unknown colour"
  esac
}

colour red
