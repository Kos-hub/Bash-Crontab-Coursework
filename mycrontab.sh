#!/bin/bash

Times(){

arr=("$@")	#Taking the array from main

timeChecking=true


read -p "Do you want to use preset or custom? " pick #Asks the user if he wants to enter a preset or custom inputs
if [[ "$pick" == "preset" ]] ; then
	presetChecking=true
	while($presetChecking) #Error handling for bad inputs
	do
	printf "Which case do you want?\n" >&2
		echo "1. Reboot" >&2
		echo "2. Yearly" >&2
		echo "3. Monthly" >&2
		echo "4. Weekly" >&2
		echo "5. Daily" >&2
		echo "6. Hourly" >&2
		read -p "Pick one of the above " presetChoice #Takes one of the options and returns them to the editjob function.
		case $presetChoice in
		1)
		echo "@reboot"
		presetChecking=false
		;;
		2)
		echo "@yearly"
		presetChecking=false
		;;
		3)
		echo "@monthly"
		presetChecking=false
		;;
		4)
		echo "@weekly"
		presetChecking=false
		;;
		5)
		echo "@daily"
		presetChecking=false
		;;
		6)
		echo "@hourly"
		presetChecking=false
		;;
		*)
		echo "Bad Input" >&2
		continue
		;;
		esac
		done
else
while($timeChecking)
do
	read -p "Do you want to change minutes, hours, dayofthemonth, month, dayoftheweek? " choice
	case $choice in
		minutes)
		read -p "Enter min " min
		if [[ "$min" == "*" || $min -ge 1 && $min -le 59 || "$min" == *"-"* || "$min" = *"/"* ]]; then	#Error handling with ranges. Same goes for the next lines of code.
		arr[0]=$min
		else
		echo "Bad Input!" >&2
		continue
		fi
		;;

		hours)
		read -p "Enter hours " hours
		if [[ "$hours" == "*" || $hours -ge 1 && $hours -le 24 || "$hours" == *"-"* || "$hours" = *"/"* ]]; then
		arr[1]=$hours
		else
		echo "Bad Input!" >&2
		continue
		fi
		;;

		dayofthemonth)
		read -p "Enter day " day
		if [[ "$day" == "*" || $day -ge 1 && $day -le 31 || "$day" == *"-"* || "$day" = *"/"* ]]; then
		arr[2]=$day
		else
		echo "Bad Input!" >&2
		continue
		fi
		;;

		month)
		read -p "Enter month " month
		if [[ "$month" == "*" || $month -ge 1 && $month -le 12 || "$month" == *"-"* || "$month" = *"/"* ]]; then
		arr[3]=$month
		else
		echo "Bad Input!" >&2
		continue
		fi
		;;

		dayoftheweek)
		read -p "Enter day of the week " dWeek
		if [[ "$dWeek" == "*" || $dWeek -ge 1 && $dWeek -le 7 || "$dWeek" == *"-"* || "$dWeek" = *"/"* ]]; then
		arr[4]=$dWeek
		else
		echo "Bad Input!" >&2
		continue
		fi
		;;

		*)
		echo "Bad Input!" >&2
		continue
		;;
		esac

	checkingHandler=true
	while($checkingHandler) 	#Looping the question so in case an invalid input is entered, the loop doesn't break.
	do
	read -p "Are you finished? " answer
	case $answer in
		yes)
		checkingHandler=false
		timeChecking=false
		;;
		no)
		checkingHandler=false
		timeChecking=true
		;;
		*)
		echo "Invalid input" >&2
		continue
		;;
		esac
	done
done


var=$( IFS=$' '; echo "${arr[*]}")	#Takes the array and makes it a string
echo "$var"				#Passing the array to the main function
fi
}


TimesPreset(){
presetChecking=true

while($presetChecking) #Error handling for choices
do
	read -p "Do you want to edit the preset or the times? " choice
	case $choice in
	preset)
		printf "Which case do you want?\n" >&2
		echo "1. Reboot" >&2
		echo "2. Yearly" >&2
		echo "3. Monthly" >&2
		echo "4. Weekly" >&2
		echo "5. Daily" >&2
		echo "6. Hourly" >&2

		while($choiceCheck) #Error handling for presets
		do
		read -p "Pick one of the above " presetChoice
		choiceCheck=true
		case $presetChoice in
		1)
		echo "@reboot"
		choiceCheck=false
		;;
		2)
		echo "@yearly"
		choiceCheck=false
		;;
		3)
		echo "@monthly"
		choiceCheck=false
		;;
		4)
		echo "@weekly"
		choiceCheck=false
		continue
		;;
		5)
		echo "@daily"
		choiceCheck=false
		;;
		6)
		echo "@hourly"
		choiceCheck=false
		;;
		*)
		echo "Bad Input" >&2
		continue
		;;
		esac
		done
	presetChecking=false
	;;
	times)
		#Bunch of while loops to handle errors
		minCheck=true
		while($minCheck)
		do

		read -p "Tell me the minute " minutes

		if [[ "$minutes" = "*" || $minutes -ge 1 && $minutes -le 59 ]] ; then
			minutes="$minutes"
			minCheck=false
		else
			echo "Bad input!" >&2
			continue
		fi

		done

		hourCheck=true
		while($hourCheck)
		do

		read -p "Tell me the hours " hours

		if [[ "$hours" = "*" || $hours -ge 1 && $hours -le 23 ]] ; then
			hours="$hours"
			hourCheck=false
		else
			echo "Bad input!" >&2
			continue
		fi

		done

		dayCheck=true
		while($dayCheck)
		do

		read -p "Tell me the day " day
		if [[ "$day" = "*" || $day -ge 1 && $day -le 31 ]] ; then
			day="$day"
			dayCheck=false
		else
			echo "Bad input!" >&2
			continue
		fi

		done

		monthCheck=true
		while($monthCheck)
		do

		read -p "Tell me the month " month
		if [[ "$month" = "*" || $month -ge 1 && $month -le 12 ]] ; then
			month="$month"
			monthCheck=false
		else
			echo "Bad input!" >&2
			continue
		fi

		done

		dWeekCheck=true
		while($dWeekCheck)
		do

		read -p "Tell me the day of the week " dWeek
		if [[ "$dWeek" = "*" || $dWeek -ge 1 && $dWeek -le 7 ]] ; then
			dWeek="$dWeek"
			dWeekCheck=false
		else
			echo "Bad input!" >&2
			continue
		fi

		done

		echo ''$minutes' '$hours' '$day' '$month' '$dWeek''	#We took a bunch of strings that are going to be used for making an entire string and passed into the main editjob function
		presetChecking=false
	;;
	*)
	echo "Bad Input" >&2
	continue
	;;
	esac
done
}


Script(){
read -p "Tell me the script " script
echo "$script"
}

  counter=0
  crontab -l | grep "^[^#;]" > .crontab_data.txt  # Get all lines from the current crontab file that do not begin with a '#' symbol
  while read lineString; do
    let counter=counter+1
  done < .crontab_data.txt
  echo "$counter"  # Return the number of jobs as an integer.


ChoiceHandler(){

	line=$(head -$lineNumber .crontab_edit.txt | tail -1)		#Gets the specific line

  #Divides the substring with a space delimiter. The first field is range between 1-5 that will always get the "timing" part of the string and then from the 6th field onwards, it's always going to be the scripting part
  	if [[ "$line" == *"@"* ]] ; then
  		timing=$(echo "$line" | cut -d ' ' -f 1)
  		script=$(echo "$line" | cut -d ' ' -f 2)
 	 else
  		timing=$(echo "$line" | cut -d ' ' -f 1-5)
 		 script=$(echo "$line" | cut -d ' ' -f6-)
 		 IFS=' ' read -r -a array <<< "$timing" 	#Turning a string into an array for each space between character.
	fi
  		sed -i "${lineNumber}d" .crontab_edit.txt 	#Deleting the line that we decided to edit



  		looping=true


  #Loop that will decide the choices of the user.
  while($looping)
  do
    finishCheck=true

    read -p "Do you want to edit Times or Script? " pick
    case $pick in
      Script)
      script=$(Script)
      echo "$script"
      changeScript=true
      ;;

      Times)
      if [[ "$timing" == *"@"* ]] ; then
      timing=$(TimesPreset $timing)
      else
      timing=$(Times "${array[@]}")	#Passing the array into the function
      fi
      echo "$timing"
      ;;
      *)
      echo "Invalid input" >&2
      ;;
      esac

      while($finishCheck)
      do
      	read -p "Are you finished? " finish
    	case $finish in
      	yes)
      	looping=false
      	finishCheck=false
      	;;
      	no)
      	looping=true
      	finishCheck=false
      	;;
      	*)
      	echo "Invalid input" >&2
      	;;
      	esac
      done


  done

  echo "$timing $script" >> .crontab_edit.txt
  echo "Successfuly edited. The job has been moved and is now called Job $jobCount"
  crontab .crontab_edit.txt	#execute the text file to insert it into the crontab

}

#Main
  crontab -l > .crontab_edit.txt 	#Takes the crontab list to a text file

  read -p "Which job do you want to edit? (Insert the number or type end to end the function) " lineNumber		#Takes the line of the job that we want to edit

	if ! [[ $lineNumber =~ [1-999] ]] ; then	#Error handling for checking if the input is a number and if it is within range.
		if [ "$lineNumber" == "end" ] ; 	#In case end is entered, the loop breaks and gets back to the main menu.
		then
		echo "Going back to main menu..." >&2
		return 0
		else
		echo "Bad input" >&2
		return 0
		fi
	elif [[ $lineNumber = [a-zA-Z] ]] ; then		#Checks if the input is a character
	echo "Bad input" >&2
	elif [ "$lineNumber" -le "$jobCount" ] ;
	then
	ChoiceHandler $lineNumber
  else
  echo "Number out of range" >&2
  fi

    read -p "Are you sure you want to add a new job? yes/no: " userChoice #Ensures user has chosen the correct option in the maiun menu

    if [[ "$userChoice" == "yes" ]]; then #Checks the user input for 'yes'

        crontab -l > .crontab_addJob.txt #Takes the crontab file adn inputs it to an editable .txt file.

        read -p "Do you want to use custom or preset times? custom/preset: " userChoice2
        case $userChoice2 in
        custom)
            declare -a timeArray #Declare timeArray as a way to keep the times together.

            #Enter all times needed for the job to the array: While loops to verify user input for each in the time inputs.
            checkForMinute=true

            while($checkForMinute)
            do
                read -p "Enter min " min
                if [[ "$min" == "*" || $min -ge 1 && $min -le 59 ]]; then	#Error handling with ranges suitable for each time type. Same goes for subsequent while loops
                timeArray[0]=$min
                checkForMinute=false
                else
                echo "Bad Input!" >&2 # IF the user input iof out of range, error message is output, and loop is repeated.
                continue
                fi
            done

            checkForHour=true

            while($checkForHour)
            do
                read -p "Enter hour " hour
                if [[ "$hour" == "*" || $hour -ge 1 && $hour -le 24 ]]; then
                timeArray[1]=$hour
                checkForHour=false
                else
                echo "Bad Input!" >&2
                continue
                fi
            done

            checkForDOTM=true

            while($checkForDOTM)
            do
                read -p "Enter day of the month " dayMonth
                if [[ "$dayMonth" == "*" || $dayMonth -ge 1 && $dayMonth -le 31 ]]; then
                timeArray[2]=$dayMonth
                checkForDOTM=false
                else
                echo "Bad Input!" >&2
                continue
                fi
            done

            checkForMonth=true

            while($checkForMonth)
            do
                read -p "Enter month " month
                if [[ "$month" == "*" || $month -ge 1 && $month -le 12 ]]; then
                timeArray[3]=$month
                checkForMonth=false
                else
                echo "Bad Input!" >&2
                continue
                fi
            done

            checkForDOTW=true

            while($checkForDOTW)
            do
                read -p "Enter day of the week " dayWeek
                if [[ "$dayWeek" == "*" || $dayWeek -ge 1 && $dayWeek -le 7 ]]; then
                timeArray[4]=$dayWeek
                checkForDOTW=false
                else
                echo "Bad input!" >&2
                continue
                fi
            done

            time=$( IFS=$' '; echo "${timeArray[*]}") # Converts timeArray to a string delimited by ' '.
        ;;
        preset) #if user chooses preset time setting
        choiceLoop=true;
        while($choiceLoop)
        do
            echo "The preset times are: "
            echo ""
            echo "1) Reboot"
            echo "2) Yearly"
            echo "3) Annually"
            echo "4) Monthly"
            echo "5) Weekly"
            echo "6) Daily"
            echo "7) Midnight"
            echo "8) Hourly"
            read -p "Enter the number of the preset time setting: " userChoice3
            case $userChoice3 in
            1)
            time="@reboot"
            choiceLoop=false
            ;;
            2)
            time="@yearly"
            choiceLoop=false
            ;;
            3)
            time="@annually"
            choiceLoop=false
            ;;
            4)
            time="@monthly"
            choiceLoop=false
            ;;
            5)
            time="@weekly"
            choiceLoop=false
            ;;
            6)
            time="@daily"
            choiceLoop=false
            ;;
            7)
            time="@midnight"
            choiceLoop=false
            ;;
            8)
            time="@hourly"
            choiceLoop=false
            ;;
            *)
            echo "Bad input!"
            choiceLoop=true
            ;;
            esac
        done
        ;;
        esac

        read -p "Enter the script " newScript # Input script from user

        printf "\nYour new job is: \n$time $newScript\n\n" #Summarise and output the new job for the user.

        loop=true
        while($loop)
        do
            read -p "Are you sure you want to add this job? yes/no: " input #Affirmation that user wants to add the new job
            case $input in
                yes)
                echo "$time $newScript" >> .crontab_addJob.txt # Adds the new job to the temporary .txt file when user gives affirmation
                crontab .crontab_addJob.txt #Turns ctrontab_addJob.txt in to the crontab file.
                loop=false
                ;;
                no)
                echo "No Jobs Added"
                loop=false
                ;;
                *)
                printf "\nBad input!\n\n" #If anything else than yes or no is input.
                loop=true
                ;;
                esac
        done
    else
    echo "No Jobs added" #If user answers 'no' to first prompt
    fi