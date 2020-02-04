#!/bin/bash 

echo "Welcome to the gambler's simulation"

#VARIABLES
win=0
loss=0

#CONSTANT
bet=1
stake=100
minStakeValue=$(( $stake * 50 / 100))
maxStakeValue=$(( $stake + $minStakeValue))
maxGamblingDays=20

#Playing till the  gambler either win 50 percent of the stake or lose
function gambling(){
#	days=$1
	local newstake=$1
	for ((i=1; i<=maxGamblingDays; i++))
	do
		#Storing the original stake value to compare the gain and losses
		tempStake=$newstake
		while (( $newstake < $maxStakeValue && $newstake > $minStakeValue ))
		do
			if (( $((RANDOM%2)) == $bet ))
			then
				newstake=$(( newstake + bet ))
			else
				newstake=$(( newstake - bet ))
			fi
		done
		dailyResult $newstake 
	done
}


#Function to check how much the gambler has won or lost that day
function dailyResult() {
	updatedstake=$1
	if (( updatedstake == maxStakeValue ))
	then
		echo "Total amount won at day $i is "$(( updatedstake - tempStake  ))
	elif (( updatedstake == minStakeValue ))
	then
		echo "Total amount lost at day $i is "$(( tempStake -updatedstake ))
	fi

  #Reinstating the stake amount
  newstake=100
}

#MAIN
gambling $stake

