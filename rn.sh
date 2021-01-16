#!/bin/bash
# colors for the text ..
blk=$'\x1b[90m' # Sets text to black
red=$'\x1b[31m' # Sets text to red
grn=$'\x1b[92m' # Sets text to green
ylw=$'\x1b[93m' # Sets text to yellow
blu=$'\x1b[94m' # Sets text to blue
pur=$'\x1b[95m' # Sets text to purple
cyn=$'\x1b[96m' # Sets text to cyan
wht=$'\x1b[97m' # Sets text to white
rst=$'\x1b[0m'  # resets to default terminal color
grey=$'\x1b[90m'
bold=$'\x1b[1m'

# colorize the input and output separately
# red -- > input
# green -- > output

arg=$1
$(touch ans)
echo -n ${red} 
./$arg > ans
echo -n ${rst}
echo -n ${grn} 
cat ans
echo -n ${rst}
rm ans


