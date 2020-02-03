#!/bin/bash 

echo "Welcome to the gambler's simulation"

#VARIABLES
stake=100
win=0
loss=0

#CONSTANT
bet=1
MIN_STAKE_VALUE=$(($stake*50/100))
MAX_STAKE_VALUE=$(($stake+$MIN_STAKE_VALUE))

#Playing till the stake value reaches the given limit
while (( $stake<$MAX_STAKE_VALUE && $stake>$MIN_STAKE_VALUE ))
do
if (( $((RANDOM%2))==1 ))
then
		((win++))
		((stake++))
else
		((loss++))
		((stake--))
fi
done
