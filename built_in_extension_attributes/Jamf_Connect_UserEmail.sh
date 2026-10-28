#!/bin/bash
# Displays the value of the UserEmail attribute for the Jamf Connect user.
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

# Only read a regular file (not a symlink or FIFO) owned by the user, never one pointing elsewhere
if [ -f "$jamfConnectStateLocation" ] && [ ! -L "$jamfConnectStateLocation" ] && [ "$(/usr/bin/stat -f %u "$jamfConnectStateLocation")" = "$(/usr/bin/id -u "$currentUser")" ]; then
    UserEmail=$(/usr/libexec/PlistBuddy -c "Print :UserEmail" "$jamfConnectStateLocation" 2>/dev/null || echo "Does not exist")
else
    UserEmail="Does not exist"
fi
echo "UserEmail"
echo "<result>$UserEmail</result>"

