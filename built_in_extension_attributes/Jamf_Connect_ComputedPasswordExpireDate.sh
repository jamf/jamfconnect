#!/bin/bash
# Displays the value of the ComputedPasswordExpireDate attribute for the Jamf Connect user.
#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

ComputedPasswordExpireDate=$(/usr/libexec/PlistBuddy -c "Print :ComputedPasswordExpireDate" $jamfConnectStateLocation || echo "Does not exist")
echo "ComputedPasswordExpireDate"
echo "<result>$ComputedPasswordExpireDate</result>"

