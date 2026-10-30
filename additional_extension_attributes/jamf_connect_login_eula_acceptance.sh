### Script populates a Jamf Pro Extension Attribute with the txt record of the EULA and has the Date/Time of the agreement in the naming convention. In Jamf Pro, create a smart group with the criteria being that Extension Attribute with an Accepted Value sets the scope for a policy to reset autchanger to no longer prompt the EULA with Jamf Connect Login.
# Copyright (c) 2022 JAMF Software, LLC

#!/bin/sh
EULADir="/filepath/to/EULArecord"

# Only report regular files owned by root, so a user-planted filename cannot forge acceptance
EULA=""
for record in "$EULADir"/*; do
   [ -f "$record" ] && [ ! -L "$record" ] || continue
   [ "$(/usr/bin/stat -f %u "$record")" = "0" ] || continue
   EULA="$EULA${EULA:+, }$(basename "$record")"
done

if [ -z "$EULA" ]; then
   echo "<result>No EULA</result>"
else
   echo "<result>$EULA</result>"
fi
