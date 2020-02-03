#!/bin/bash 

echo "Welcome to the gambler's simulation"

#VARIABLES
stake=100
win=0
loss=0

#CONSTANT
bet=1




#Gamling for 20 days straight
for ((i=1; i<=20; i++))
do
	#VARIABLES
	minStakeValue=$(( $stake * 50 / 100))
	maxStakeValue=$(( $stake + $minStakeValue))
	oldStake=$stake

	#Playing till the  gambler either win 50 percent of the stake or lose
	while (( $stake <= $maxStakeValue && $stake >= $minStakeValue ))
	do
		if (( $((RANDOM%2)) == $bet ))
		then
			(( stake++ ))
		else
			(( stake-- ))
		fi
	done

	#Checking how much the gambler has won or lost that day
	if (( stake <= 0 ))
	then
		echo "Lost all the money so Can't play"
		break
	elif (( stake > oldStake ))
	then
		echo "Total amount won at day $i is "$(( stake - oldStake))
	elif (( stake < oldStake ))
	then
		echo "Total amount lost at day $i is "$(( oldStake - stake))
	fi

done

