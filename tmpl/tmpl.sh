#!/bin/bash
# Author: <<name>>
# Date  : <<date>>

now=`date +%s`
today=`echo $now|gawk '{print int(($1+8*3600)/86400)*86400-8*3600}'`
yesterday=$(echo $today-86400|bc)

# Function usage:
#asdf=$(YM $now)
#echo $asdf

function YMD {
    echo $1|gawk '{print strftime("%Y%m%d", $1)}'
}
function YM {
    echo $1|gawk '{print strftime("%Y%m", $1)}'
}
function DAY {
    echo $1|gawk '{print strftime("%d", $1)}'
}
