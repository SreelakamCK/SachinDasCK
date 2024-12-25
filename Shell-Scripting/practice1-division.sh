#!/bin/bash

###########################
# Write a Shell script to print numbers divided by 3 & 5 and not 15
# Author: Sachin Das
# Date: 25/12/2024
##########################

# Range 1-100
# Conditions : Divisible by 3 ,Divisible by 5, Not Divisible by 15

# Initiating for loop to run the range 

for i in {1..100};do
	if (((i % 3 == 0))||((i % 5 == 0)))&& ((i % 15 != 0));
	then
		echo $i
	fi;
done

