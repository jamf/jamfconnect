### Script populates a Jamf Pro Extension Attribute with the txt record of the EULA and has the Date/Time of the agreement in the naming convention. In Jamf Pro, create a smart group with the criteria being that Extension Attribute with an Accepted Value sets the scope for a policy to reset autchanger to no longer prompt the EULA with Jamf Connect Login.

#!/bin/sh
EULA=$(ls /filepath/to/EULArecord/)

if [ $EULA == "" ]; then
   echo "<result>No EULA</result>"
else
   echo "<result>$EULA</result>"
fi