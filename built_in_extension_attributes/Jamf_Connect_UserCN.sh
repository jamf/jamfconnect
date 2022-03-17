#!/bin/bash
# Displays the value of the UserCN attribute for the Jamf Connect user.
#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

UserCN=$(/usr/libexec/PlistBuddy -c "Print :UserCN" $jamfConnectStateLocation || echo "Does not exist")
echo "UserCN"
echo "<result>$UserCN</result>"

