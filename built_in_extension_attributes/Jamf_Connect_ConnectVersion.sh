#!/bin/bash
# Displays the version number for the currently installed Jamf Connect menu bar app.
#
# Data Type: String
# Input Type: Script
#
# Copyright (c) 2022 JAMF Software, LLC
##### Script starts here #####

#Jamf Connect 2.0 Location
jamfConnectLocation="/Applications/Jamf Connect.app"

jamfConnectVersion=$(defaults read "$jamfConnectLocation"/Contents/Info.plist "CFBundleShortVersionString" || echo "Does not exist")
echo "jamfConnectVersion"
echo "<result>$jamfConnectVersion</result>"

