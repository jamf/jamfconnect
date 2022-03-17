#!/bin/bash
# Displays any enabled password length requirement from the authentication domain for the Jamf Connect user.
#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

PasswordLength=$(/usr/libexec/PlistBuddy -c "Print :passwordLength" $jamfConnectStateLocation || echo "Does not exist")
echo "PasswordLength"
echo "<result>$PasswordLength</result>"

