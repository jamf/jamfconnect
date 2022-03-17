#!/bin/bash
# Displays the value of the UserUPN attribute for the Jamf Connect user.
#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

UserUPN=$(/usr/libexec/PlistBuddy -c "Print :UserUPN" $jamfConnectStateLocation || echo "Does not exist")
echo "UserUPN"
echo "<result>$UserUPN</result>"

