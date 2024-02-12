#!/bin/bash

# Sample notify screen script
# Copyright 2024 Jamf 
# Updated 12 FEB 2024

# This script is not intended for use in production without modification to
# fit your organization's specific environment and needs.

# This script shows examples of how each of the commands for Notify work.
# It is NOT intended be a real life example of an onboarding script.

# This script can be deployed to a computer via a prestage enrollment package
# The script must be located in a directory which has execute permissions
# The script file must have execute permissions for the root user (700) 
# We recommend that the script owner be set to root:wheel

# If this script is executed via Jamf Connect through the RunScript preference,
# the script will be executed by the "root" user.  sudo commands are not needed.

### Variables
# Set the location of the control file
controlFile = "/var/tmp/depnotify.log"
# Expected location of the Jamf binary
jamfBinary = "/usr/local/bin/jamf"

# Set the Main Title at the top of the window
echo "Command: MainTitle: Welcome to AnyCo!" >> "$controlFile"

# Text in the MainText area can include a forced "newline" with the text "\\n"
echo "Command: MainText: Welcome to your new Mac.\\nSit tight as we do some basic setup to get you ready for success.\\nYou can see the status of the setup on the progress bar below." >> "$controlFile"

# Status appears below the 
echo "Status: Installing Jamf..." >> "$controlFile"

# Perform an action that may take some time
# Example: Wait until the Jamf Binary is downloaded and installed
until [ -f "$jamfBinary" ]
do
	echo "Status: Waiting on Jamf Pro agent install" >> "$controlFile" 
	sleep 2
done

# Example: Wait until Jamf Self Service is downloaded and installed
until [ -f "/Applications/Self Service.app/Contents/Resources/AppIcon.icns" ]
do
	echo "Status: Installing Jamf Self Service..." >> "$controlFile" 
	sleep 2
done

# Change the Determinate bar from "cylon" mode to 2 steps
echo "Command: Determinate: 2" >> "$controlFile"

# Make your screen informative to the end user so they know something good is 
# happening to their computer.  Graphics and text should be short and simple so 
# they can be read before the policy completes.  Apple computers just keep 
# getting faster, so keep that in mind!

echo "Command: MainTitle: Jamf Self Service makes Mac life easier" >> "$controlFile"

# Long text in the MainText field will automatically pageinate so you don't 
# need to include line breaks.
echo "Command: MainText: Self Service is your personal app store for AnyCo.  We've also included helpful extras like bookmarks and utilities to keep your Mac running great." >> "$controlFile"

# Images must be installed locally on the Mac.  .icns files are perfect and 
# several are built into macOS automatically.  .png, .gif, and .jpg files are 
# also acceptable.
echo "Command: Image: /Applications/Self Service.app/Contents/Resources/AppIcon.icns" >> "$controlFile"

# When a Status command is sent, the Determinate bar will increment by one step
echo "Status: Installing Jamf Protect..." >> "$controlFile"

# A Jamf policy to install software may take a few moments to complete while the
# package is downloaded to the target device and the installer runs.  We can use
# a custom trigger to call specific onboarding policies and installers

# This example will start any policy set to trigger on the custom trigger named 
# "InstallJamfProtect"
$jamfBinary policy -event InstallJamfProtect

# When a Status command is sent, the Determinate bar will increment by one step
echo "Status: Installing essential software..." >> "$controlFile"

# More than one policy can be triggered by one trigger event.  Policies will be 
# run in alpha numeric order as they are named.  For example, a policy named
###  10 - Install Essential Software
# will run before a policy named
###  20 - Install Even More Essential Software
# if both policies run on a custom trigger named "OnboardingEssentials"

$jamfBinary policy -event OnboardingEssentials

# Once your onboarding is complete, it is best practice to disable the notify 
# screen from appearing at every login

# Disable notify screen from loginwindow process
/usr/local/bin/authchanger -reset -JamfConnect	

# Close the notify screen and continue the loginwindow process.  The user will 
# now start their first macOS user session
echo "Command: Quit" >> "$controlFile"

# The notify screen will read all of the commands in a control file when it 
# launches. Therefore, in case you ever need to use the notify screen on the 
# same computer again, it's best to clean up after ourselves and delete the 
# control file.

rm -rf "$controlFile"
