#!/bin/bash

# Jamf Connect state - Is the last successful sign-in within the specified number of days
# Sean Rabbitt Oct 16, 2020
#
# Script type: Jamf Pro Extension Attribute

# Usage: The last time someone successfully signed in to the Jamf Connect menu bar agent
#	is stored in com.jamf.connect.state.plist located in ~/Library/Preferences
#	Report back as an EA either 
	# No record found - either the com.jamf.connect.state.plist does not exist, or the user never signed in
	# Over limit - The last sign-in is older than the number of days we specified below
	# Within limit - The last sign-in is within the range of the number of days we specified below
	
# Why: The info can be used to create a Smart Computer Group to remediate password sync.
#	For example, use the Smart Computer Group as a target scope for :
	# a Configuration Profile that adds the DenyLocal key for com.jamf.connect.login set to TRUE to force an IDP login at next power cycle
	# a Policy that reboots the machine after X minutes of idle
	# a Policy that updates the inventory of the machine every X hours to make sure the user logged in
	# a Configuration Profile that adds RequireSignIn to TRUE to com.jamf.connect
	
# LIMITATIONS: This EA will only update on an inventory update in Jamf Pro, so schedule your inventory
	# recons appropriately.
	
# ADMIN: Change the next line to the number of days you want to check.  In this case, we're checking to see if
# 	a user has logged in successfully within the last 
LastSignInMaxAge=14 # Numeric value in DAYS

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

# Path to the preference with our current user's shortname
jamfConnectStateLocation=/Users/"$currentUser"/Library/Preferences/com.jamf.connect.state.plist

# Read the preference key from the .plist with PlistBuddy.  If no preference, LastSignIn will be "No record found"
LastSignIn=$(/usr/libexec/PlistBuddy -c "Print :LastSignIn" "$jamfConnectStateLocation" || echo "No record found")

# If our result is "No record found", return the result to the EA and stop
if [ "$LastSignIn" = "No record found" ]; then
	echo "<result>No record foundn</result>"
	exit 0;
# Otherwise, use the date command to calculate how far back in Epoch time is our maximum sign in date, compare to the
#	results of the LastSignIn.
else
	# Give us today's date minus the range, report in Epoch time 
	LastSignInMaxDate=$(/bin/date -j -v -"$LastSignInMaxAge"d "+%s")
	# Convert the UTC formatted date from LastSignIn into Epoch time
	LastSignIn=$(/bin/date -j -f "%a %b %d %T %Z %Y" "$LastSignIn" "+%s")

	# Compare the numberic values of the dates (that's why we're using ((.)) and not [ $variable ] in this if command
	# If the last signin is less than or equal to the cutoff (aka a date earlier than x days back), report Over limit
	if ((LastSignIn <= LastSignInMaxDate)); then
		echo "<result>Over limit</result>"
	else
		# Otherwise, we coo.  Within the limits.
		echo "<result>Within limit</result>"
	fi
fi

exit 0;