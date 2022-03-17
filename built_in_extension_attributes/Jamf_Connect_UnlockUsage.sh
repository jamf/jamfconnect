#!/bin/bash
# Displays the value of the UnlockInUse attribute for the Jamf Connect user.
#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist
UnlockInUse=$(/usr/libexec/PlistBuddy -c "Print :UnlockInUse" $jamfConnectStateLocation || echo "Does not exist")
echo "UnlockInUse"
echo "<result>$UnlockInUse</result>"

