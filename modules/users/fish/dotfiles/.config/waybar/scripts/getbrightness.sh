#!/bin/sh

CURRENT=$(brightnessctl g)
MAX=$(brightnessctl m)
PERCENT=$(( CURRENT * 100 / MAX ))

echo "{\"percentage\": $PERCENT}"
