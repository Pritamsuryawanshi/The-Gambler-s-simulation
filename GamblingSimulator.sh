#!/bin/bash 

echo "Welcome to the gambler's simulation"

#CONSTANT
bet=1
stake=100
minStakeValue=$(( $stake * 50 / 100))
maxStakeValue=$(( $stake + $minStakeValue))
maxGamblingDays=20

#Function to Play till the  gambler either win 50 percent of the stake or lose
function gambling()
{
	for ((i=1; i<=maxGamblingDays; i++))
	do

		#Storing the original stake value to compare the gain and losses
		tempStake=$stake
		while (( $stake < $maxStakeValue && $stake > $minStakeValue ))
		do
			if (( $((RANDOM%2)) == $bet ))
			then
				stake=$(( stake + bet ))
			else
				stake=$(( stake - bet ))
			fi
		done
		dailyResult 
	done
}

#Function to check how much the gambler has won or lost that day
function dailyResult() 
{
	if (( stake == maxStakeValue ))
	then
		echo "Total amount won at day $i is "$(( stake - tempStake  ))
	elif (( stake == minStakeValue ))
	then
		echo "Total amount lost at day $i is "$(( tempStake - stake ))
	fi

  #Reinstating the stake amount
  stake=100
}

#MAIN
gambling

