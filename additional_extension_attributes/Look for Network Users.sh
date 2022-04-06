#!/bin/bash

# Search for mobile account users 
# Extension attribute for Jamf Pro
#
# Will return either "No Network Accounts" if no accounts exist or a list of the 
# short names of network accounts on a macOS device
#
# Use with smart groups in Jamf Pro to scope for NoMAD or Jamf Connect to demobilize
# user accounts.

# MIT License
#
# Copyright (c) 2020 JAMF Software, LLC


# Look for all accounts that contain an attribute of "OriginalNodeName" which is 
# added to the dscl user record when we're a mobile or network account.
NETWORKACCOUNTLIST=`dscl . list /Users OriginalNodeName | awk '{print $1}' 2>/dev/null`
 
# If no network accounts exist, return "No Network Accounts"
if [ "$NETWORKACCOUNTLIST" == "" ]; then
	echo "<result>No Network Accounts</result>"
else
# Else, return a list of short names of network accounts on the box.
	echo "<result>$NETWORKACCOUNTLIST</result>"
fi

exit 0