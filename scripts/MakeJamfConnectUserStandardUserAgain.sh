#!/bin/bash

# Copyright (c) 2022 JAMF Software, LLC

# A script to remove the attributes that Jamf Connect uses to determine if a
# local user account has already been migrated to match up with an identity
# provider.  
#
# If you run this as a policy from Jamf Pro, be sure to change the $1 to
# something like $4 and pass the local user account name to the script.
#
# This script can be useful if someone accidentally migrated the wrong
# user account or in a situation like a name change in your identity provider
# and you want to match it up with a local user again i.e. Roger Elizabeth
# De Bris gets married and changes their last name to Ghia.

localUser="$1"

dscl . delete /Users/"$localUser" dsAttrTypeStandard:NetworkUser
dscl . delete /Users/"$localUser" dsAttrTypeStandard:OIDCProvider
dscl . delete /Users/"$localUser" dsAttrTypeStandard:AzureUser
dscl . delete /Users/"$localUser" dsAttrTypeStandard:OktaUser

# For informational purposes only.  There may be an alias to the user
# account added by Jamf Connect if the IdP user name does not match the 
# unix short name exactly.  For example, if the user's short name was 
# fluffy.bunny but the IdP username was joel.rennich@example.com, Connect will
# add an alias of "joel.rennich" and "joel.rennich@example.com" to the user

# If the user account has signed into iCloud, there may also be an alias 
# created by Apple that begins with "com.apple.idms.appleid.prd." followed by
# a unique identifier string.  Because of this, we can't automatically remove
# the aliases based on there being a posibility of breaking something from 
# the undocumented realms of the fruit company.

localUserAlias=$(dscl . read /Users/"$localUser" RecordName) #| awk -F " " '{print $NF}')
echo "$localUserAlias"

# echoed result will appear in the results of the policy running in Jamf Pro
# if you needed to clean up the account manually.