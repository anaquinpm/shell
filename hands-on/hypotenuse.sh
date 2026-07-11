#!/bin/bash

# calculate the length of the hypotenuse of a Pythagorean triangle
# using hypotenuse^2 = adjacent^2 + opposite^2
echo -n “Enter the Adjacent length: “
read adjacent
echo -n “Enter the Opposite length: “
read opposite
osquared=$(($opposite ** 2))
# get o^2
asquared=$(($adjacent ** 2))
# get a^2
hsquared=$(($osquared + $asquared))
# h^2 = a^2 + o^2
hypotenuse=`echo "scale=5;sqrt ($hsquared)" | bc`
# bc does sqrt
echo “The Hypotenuse is $hypotenuse”
