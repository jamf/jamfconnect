#!/bin/bash
# Displays the value of the UserShortName attribute for the Jamf Connect user.
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

UserShortName=$(/usr/libexec/PlistBuddy -c "Print :UserShortName" $jamfConnectStateLocation || echo "Does not exist")
echo "UserShortName"
echo "<result>$UserShortName</result>"
