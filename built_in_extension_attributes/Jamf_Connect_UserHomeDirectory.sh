#!/bin/bash
# Displays the value of the UserHomeDirectory attribute for the Jamf Connect user.
#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

UserHomeDirectory=$(/usr/libexec/PlistBuddy -c "Print :UserHomeDirectory" $jamfConnectStateLocation || echo "Does not exist")
echo "UserHomeDirectory"
echo "<result>$UserHomeDirectory</result>"