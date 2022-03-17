#!/bin/bash
# Displays if Device and Mac are correctly paired
#
# Data Type: String
# Input Type: Script
#
##### Script starts here #####

#Get current signed in user
systemProfiler=$(system_profiler SPSmartCardsDataType | grep com.jamf.connect.unlock.token:UnlockToken)

if [[ "$systemProfiler" =~ "com.jamf.connect.unlock.token:UnlockToken" ]]; then
	echo "<result>Succesfully paired</result>"
else
	echo "<result>Not paired</result>"
fi

