#!/bin/bash

# Jamf Connect Notify updater
# Use in any Jamf Pro policy to update the Jamf Connect notify mechanism without all the mucking about writing scripts
# Should work with DEP Notify as well as Jamf Connect notify mechanism
#
# Use Case: Deploy via Jamf Pro.  Under Options -> Parameter Labels set:
#
# Parameter 4: Status - this will be a character string which updates the status below the determinate bar
# Parameter 5: Main Title - this will be a character string with the big text at the top of the window
# Parameter 6: Main Text - this will be a character string for the main body of the text below the title.  New lines can be denoted with a \n
# Parameter 7: Image - Path to a .png file that appears above the Main Title
# Parameter 8: MainTextImage - Path to a .png file that will replace what appears in the Main Text area of the window
# Parameter 9: DeterminateManual - A number that determines how many steps total will be shown in the pseudo progress bar.  This should be used only once per 
# Parameter 10: DeterminateManualStep - A number that steps the pseudo bar - usually you want to make this 1 to step the progress bar
#
# If the string is empty, the update is skipped.  Location of the depnotify.log file is set below in DEP_NOTIFY_LOG - update if you
# have moved this to a different location.
#
# To quit, use a Jamf Pro policy with a UNIX command:
# echo "Command: Quit" >> /var/tmp/depnotify.log
# to end the notify mechanism display.

#
# MIT License
#
# Copyright (c) 2020 Jamf Software

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


DEP_NOTIFY_LOG="/var/tmp/depnotify.log"

STATUS_STRING=$4
MAIN_TITLE_STRING=$5
MAIN_TEXT_STRING=$6
IMAGE_PATH=$7
MAIN_TEXT_IMAGE_PATH=$8
DETERMINATE_MANUAL=$9
DETERMINATE_MANUAL_STEP=${10}

#Status:
if [[ ! -z "$STATUS_STRING" ]]; then
	echo "Status: $STATUS_STRING" >> "$DEP_NOTIFY_LOG"
fi

#Command: MainTitle:
if [[ ! -z "$MAIN_TITLE_STRING" ]]; then
	echo "Command: MainTitle: $MAIN_TITLE_STRING" >> "$DEP_NOTIFY_LOG"
fi

#Command: MainText:
if [[ ! -z "$MAIN_TEXT_STRING" ]]; then
	echo "Command: MainText: $MAIN_TEXT_STRING" >> "$DEP_NOTIFY_LOG"
fi

#Command: Image:
if [[ ! -z "$IMAGE_PATH" ]]; then
	echo "Command: Image: $IMAGE_PATH" >> "$DEP_NOTIFY_LOG"
fi

#Command: MainTextImage:
if [[ ! -z "$MAIN_TEXT_IMAGE_PATH" ]]; then
	echo "Command: MainTextImage: $MAIN_TEXT_IMAGE_PATH" >> "$DEP_NOTIFY_LOG"
fi

#Command: DeterminateManual:
if [[ ! -z "$DETERMINATE_MANUAL" ]]; then
	echo "Command: DeterminateManual: $DETERMINATE_MANUAL" >> "$DEP_NOTIFY_LOG"
fi

#Command: DeterminateManualStep:
if [[ ! -z "$DETERMINATE_MANUAL_STEP" ]]; then
	echo "Command: DeterminateManualStep: $DETERMINATE_MANUAL_STEP" >> "$DEP_NOTIFY_LOG"
fi

exit
