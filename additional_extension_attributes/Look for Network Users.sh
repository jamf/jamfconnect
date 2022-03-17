#!/bin/bash

# Search for mobile account users 
# Extension attribute for Jamf Pro
#
# Will return either "No Network Accounts" if no accounts exist or a list of the 
# short names of network accounts on a macOS device
#
# Use with smart groups in Jamf Pro to scope for NoMAD or Jamf Connect to demobilize
# user accounts.
# — SRABBITT May 7, 2020

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