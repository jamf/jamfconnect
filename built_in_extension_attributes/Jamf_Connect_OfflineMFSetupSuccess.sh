#!/bin/bash
# Displays the status of OfflineMFA of the current user.
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

OfflineMFASetupSuccess=$(/usr/libexec/PlistBuddy -c "Print :OfflineMFASetupSuccess" $jamfConnectStateLocation || echo "Does not exist")
echo "OfflineMFASetupSuccess"
echo "<result>$OfflineMFASetupSuccess</result>"
