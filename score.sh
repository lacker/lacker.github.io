#!/bin/bash

NUM_POSTS=`ls _posts/2022*n | wc -l`
DAYS_OK=`echo "7 *" $NUM_POSTS | bc`
echo post score: $DAYS_OK
echo goal score: `date +%j`
