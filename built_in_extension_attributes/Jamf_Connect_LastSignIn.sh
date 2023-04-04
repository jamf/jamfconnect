#!/bin/bash
# Displays the value for the LastSignIn date when the Jamf Connect user last signed in to their identity provider.
#
# Data Type: String
# Input Type: Script
#
# Updated 03 APR 2023 - Changed return value from a string to epoch zero date to handle issue with 
# smart computer groups expecting a date when a string was returned. - S. Rabbitt D. MacLaughlin
#
# Copyright (c) 2022 JAMF Software, LLC
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

LastSignIn=$(/usr/libexec/PlistBuddy -c "Print :LastSignIn" $jamfConnectStateLocation || echo "1970-01-01 00:00:00")
echo "LastSignIn"
echo "<result>$LastSignIn</result>"

