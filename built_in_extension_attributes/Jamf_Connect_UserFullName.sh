#!/bin/bash
# Displays the value of the UserFullName attribute for the Jamf Connect user.
#
# Data Type: String
# Input Type: Script
#
# Copyright (c) 2022 JAMF Software, LLC
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

UserFullName=$(/usr/libexec/PlistBuddy -c "Print :UserFullName" $jamfConnectStateLocation || echo "Does not exist")
echo "UserFullName"
echo "<result>$UserFullName</result>"

