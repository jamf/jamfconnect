#!/bin/bash
# Displays the value of the PasswordCurrent attribute for the Jamf Connect user.
#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

PasswordCurrent=$(/usr/libexec/PlistBuddy -c "Print :PasswordCurrent" $jamfConnectStateLocation || echo "Does not exist")
echo "PasswordCurrent"
echo "<result>$PasswordCurrent</result>"
