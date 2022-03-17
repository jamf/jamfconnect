#!/bin/bash
# Displays the value for the longest expiration date of a certificate pulled from the authentication domain for the Jamf Connect user.
#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
currentUser=$(ls -l /dev/console | awk '/ / { print $3 }')

#com.jamf.connect.state.plist location
jamfConnectStateLocation=/Users/$currentUser/Library/Preferences/com.jamf.connect.state.plist

LastCertificateExpiration=$(/usr/libexec/PlistBuddy -c "Print :LastCertificateExpiration" $jamfConnectStateLocation || echo "Does not exist")
echo "LastCertificateExpiration"
echo "<result>$LastCertificateExpiration</result>"

