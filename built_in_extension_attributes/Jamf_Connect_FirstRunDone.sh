#!/bin/bash
# Displays the value of the FirstRunDone attribute for the Jamf Connect user.#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

FirstRunDone=$(/usr/libexec/PlistBuddy -c "Print :FirstRunDone" $jamfConnectStateLocation || echo "Does not exist")
echo "FirstRunDone"
echo "<result>$FirstRunDone</result>"

