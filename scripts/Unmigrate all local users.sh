#!/bin/bash

# Unmigrate all users from Jamf Connect

# For all users who have a password on this machine (eliminates service accounts
# but includes the _mbsetupuser and Jamf management accounts...)
for user in $(/usr/bin/dscl . list /Users Password | /usr/bin/awk '$2 != "*" {print $1}'); do
	# If a user has the attribute "NetworkUser" in their user record, they are a Jamf Connect user.
	MIGRATESTATUS=($(/usr/bin/dscl . -read /Users/$user | grep "NetworkUser: " | /usr/bin/awk {'print $2'}))
	# If we didn't get a result, the variable is empty.  Thus that user is not 
	# a Jamf Connect Login user.
	if [[ -z $MIGRATESTATUS ]]; 
	then
		# user is not a jamf connect user
		echo "$user is Not a Jamf Connect User"
	else
		dscl . delete /Users/$user dsAttrTypeStandard:NetworkUser
		dscl . delete /Users/$user dsAttrTypeStandard:OIDCProvider
		dscl . delete /Users/$user dsAttrTypeStandard:OktaUser
		dscl . delete /Users/$user dsAttrTypeStandard:AzureUser
	fi
done
