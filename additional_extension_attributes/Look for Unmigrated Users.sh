#!/bin/bash

# Search for unmigrated users Extension Attribute
# Will return either "No Unmigrated Users" or a list of user names which have not been migrated yet

# MIT License
#
# Copyright (c) 2020 Jamf Software


# REQUIRED VARIABLES
# Put the name of the management account created for Jamf in a prestage enrollment here
jamfManagementAccount=jamfManagement

# Declare list of unmigrated users variable
listOfUnmigratedUsers=""

# Get a list of all users on the machine who have a password.  For each user check to see if 
# the user is named after the Jamf Management Account or the _mbsetupuser

####NOTE: That second thing may not be required; my setup of Parallels might have given the
# 	_mbsetupuser a password when it really didn't need one...
####NOTE: You may want to modify this to add any additional programatically created
#	local admin accounts you create in your environment.

for user in $(dscl . list /Users Password | awk '$2 != "*" {print $1}');do
	if [[ ("$user" != "$jamfManagementAccount") && ("$user" != "_mbsetupuser") ]]; then
		# Look in the dscl record for the user and see if there is an entry for OIDCProvider
		# Jamf Connect will add that to the user record when it is migrated or created
		MIGRATESTATUS=($(dscl . -read /Users/$user | grep "OIDCProvider: " | awk {'print $2'}))
		# If we didn't get a result, the variable is empty.  Thus that user hasn't been migrated.
		if [[ -z $MIGRATESTATUS ]]; then
			# Add the user to the list of unmigrated users
			listOfUnmigratedUsers+=$(echo "$user ")
		fi
	fi
done

# If the listOfUnmigratedUsers is empty, then everyone is a Jamf Connect user or has been migrated.
if [[ -z $listOfUnmigratedUsers ]]; then
	echo "<result>No Unmigrated Users</result>"
# Else, return a list of short names of unmigrated users.
else
	echo "<result>$listOfUnmigratedUsers</result>"
fi

exit 0