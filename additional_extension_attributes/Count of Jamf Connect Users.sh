#!/bin/bash

# Return the number of Jamf Connect Login enabled users
# Will return an integer with the number of users who use Jamf Connect login

# MIT License
#
# Copyright (c) 2020 JAMF Software, LLC

# REQUIRED VARIABLES
# Put the name of the management account created for Jamf in a prestage enrollment here
jamfManagementAccount=jamfManagement

# Declare variable for JamfConnectUsers
JamfConnectUserCount=0

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
		MIGRATESTATUS=($(dscl . -read /Users/$user | grep "NetworkUser: " | awk {'print $2'}))
		# If we didn't get a result, the variable is empty.  Thus that user hasn't been migrated.
		if [[ -z $MIGRATESTATUS ]]; 
		then
			# user is not a jamf connect user
			echo "$user is Not a Jamf Connect User"
		else
			echo "$user is a Jamf Connect user"
			JamfConnectUserCount=$((JamfConnectUserCount+1))
			
		fi
	fi
done

echo "<result>$JamfConnectUserCount</result>"


exit 0