#!/bin/bash
# Displays the value of the UserLastName attribute for the Jamf Connect user.
#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

UserLastName=$(/usr/libexec/PlistBuddy -c "Print :UserLastName" $jamfConnectStateLocation || echo "Does not exist")
echo "UserLastName"
echo "<result>$UserLastName</result>"