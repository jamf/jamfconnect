#!/bin/bash
# Displays the value of the UserLoginName attribute for the Jamf Connect user.
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

UserLoginName=$(/usr/libexec/PlistBuddy -c "Print :UserLoginName" $jamfConnectStateLocation || echo "Does not exist")
echo "UserLoginName"
echo "<result>$UserLoginName</result>"

