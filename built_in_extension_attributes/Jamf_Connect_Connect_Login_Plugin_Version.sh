#!/bin/bash
# Displays the version of the currently installed Jamf Connect login window security agent plugin.
#
# Data Type: String
# Input Type: Script
#
# Copyright (c) 2022 JAMF Software, LLC
##### Script starts here #####

#Jamf Connect Login Location
jamfConnectLoginLocation="/Library/Security/SecurityAgentPlugins/JamfConnectLogin.bundle"

jamfConnectLoginVersion=$(defaults read "$jamfConnectLoginLocation"/Contents/Info.plist "CFBundleShortVersionString" || echo "Does not exist")
echo "jamfConnectLoginVersion"
echo "<result>$jamfConnectLoginVersion</result>"
