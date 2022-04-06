#!/bin/bash
# Displays the value for the LastSignIn date when the Jamf Connect user last signed in to their identity provider.
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

LastSignIn=$(/usr/libexec/PlistBuddy -c "Print :LastSignIn" $jamfConnectStateLocation || echo "Does not exist")
echo "LastSignIn"
echo "<result>$LastSignIn</result>"

