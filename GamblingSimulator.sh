#!/bin/bash

echo "Welcome to the gambler's simulation"

#declaring the dictionaries
declare -A day
declare -A result

#VARIABLES
updatedAmount=0
tempStake=0

#CONSTANTS
BET=1
STAKE=100
MIN_STAKE_VALUE=$(( $STAKE * 50 / 100 ))
MAX_STAKE_VALUE=$(( $STAKE + $MIN_STAKE_VALUE ))
MAX_GAMBLING_DAYS=20

#Function to Play till the  gambler either win 50 percent of the stake or lose
function gambling()
{
	for (( i=1; i<=MAX_GAMBLING_DAYS; i++ ))
	do
		#Storing the original stake value to compare the gain and losses
		tempStake=$STAKE
		while (( $tempStake < $MAX_STAKE_VALUE && $tempStake > $MIN_STAKE_VALUE ))
		do
			if (( $((RANDOM%2)) == $BET ))
			then
				tempStake=$(( tempStake + BET ))
			else
				tempStake=$(( tempStake - BET ))
			fi
		done
		dailyResult
	done
	wonOrLost
	totalAmountRemaining
}

#Function to check how much the gambler has won or lost that day
function dailyResult()
{
	if (( tempStake == MAX_STAKE_VALUE ))
	then
		day[won]="${day[won]} $i"
		wins=$(( tempStake - STAKE ))
		updatedAmount=$(( updatedAmount + wins ))
	else
		day[lost]="${day[lost]} $i"
		loss=$(( STAKE - tempStake ))
		updatedAmount=$((updatedAmount-loss))
	fi
	#Storing the days and the min and max amount it holds
	result[$i]=$updatedAmount
}

#Function to check total amount remaining at the end of the month
function totalAmountRemaining() 
{
	if (( updatedAmount>0 ))
	then
		echo "Amount won in a month is $updatedAmount"
	else
		echo "Amount lost in a month is $updatedAmount"
	fi
	#reinstating the updated value to zero for next simulation
	updatedAmount=0


	echo "the luckiest day is"
	luckyOrunlucky head
	echo "the unluckiest day is"
	luckyOrunlucky tail
}

#Function to check the days won and lost
function wonOrLost()
{
	for i in ${!day[@]}
	do
		echo "days $i --> ${day[$i]}"
	done
}

#Function to determine the luckiest and unluckiest day
function luckyOrunlucky()
{
	for j in ${!result[@]}
	do
		echo "$j ${result[$j]}"
	done | sort -k2 -rn | $1 -1
}


#MAIN
read -p "press 1 to play: " choice

while ((choice==1))
do
	gambling
	read -p "press 1 to play again: " choice
	unset day[won]
	unset day[lost]
done
echo "GOODBYE!!"


