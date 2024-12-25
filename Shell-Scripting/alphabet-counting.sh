#!/bin/bash

#####################################
# Author: Sachin Das	
# Date : 25/12/2024
# Description : Counting a specific alphabet in word
# In this case counting s in word mississippi
####################################################

set -x
set -e
set -o pipefail

x=mississippi

grep -o "s" <<<"$x" | wc -l
