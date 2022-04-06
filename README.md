# Jamf Connect

This repository contains open-source resources for use with or alongside Jamf Connect.

![](https://resources.jamf.com/images/logos/Jamf-Connect-color.png)

Jamf Connect users can leverage the following resources:

### Configuration Profiles

Jamf Connect supports many identity providers (IdPs) and custom settings, the `Configurations` folder includes example configuration profiles for supported identity providers and a template for setting up a custom IdP. Examples for advanced settings, such as menu bar actions and the Jamf Connect Notify screen are also available.

Import the sample profiles into the Jamf Connect Configuration application or configure settings directly into Jamf Pro.

**Note: Make sure to edit the example configuration profiles to use your organization's identity provider settings.**

### Extension Attributes

Jamf Connect writes data to the `com.jamf.connect.state` preference domain on computers, which can be used to populate inventory information in Jamf Pro via extension attributes. Many of the Extension Attributes available this repository are also available in Jamf Pro as built-in templates.

For more information about using Extension Attributes with Jamf Pro, see [Computer Extension Attributes](https://docs.jamf.com/jamf-pro/administrator-guide/Computer_Extension_Attributes.html) in the _Jamf Pro Documentation_.

Additional extension attributes curated by Jamf's Professional Services and Consulting Engineering teams are in `additional_extension_attributes` folder.

### Jamf Connect Scripts

Some Jamf Connect processes can be run via scripts:

- Use the [URI schemas](https://docs.jamf.com/jamf-connect/documentation/Jamf_Connect_URL_Scheme.html) in scripts to perform simple actions.
- Read data from [com.jamf.connect.state.plist](https://docs.jamf.com/jamf-connect/documentation/State_Settings_and_User_Status.html) to use in scripts.
- Execute the [authchanger](https://docs.jamf.com/jamf-connect/documentation/authchanger.html) command-line tool to change the macOS loginwindow from a script or run certain actions with Jamf Connect at login.

### Debugging Logs

For more information about Jamf Connect logs, see [Jamf Connect Logs](https://docs.jamf.com/jamf-connect/documentation/Jamf_Connect_Logs.html) in the _Jamf Connect Documentation_.

**Disclaimer:** All resources contained in this repository are provided as-is and are not officially supported by Jamf Support.

```
####################################################################################################
#
# Copyright (c) 2022, Jamf, LLC.  All rights reserved.
#
#       Redistribution and use in source and binary forms, with or without
#       modification, are permitted provided that the following conditions are met:
#               * Redistributions of source code must retain the above copyright
#                 notice, this list of conditions and the following disclaimer.
#               * Redistributions in binary form must reproduce the above copyright
#                 notice, this list of conditions and the following disclaimer in the
#                 documentation and/or other materials provided with the distribution.
#               * Neither the name of the JAMF Software, LLC nor the
#                 names of its contributors may be used to endorse or promote products
#                 derived from this software without specific prior written permission.
#
#       THIS SOFTWARE IS PROVIDED BY JAMF SOFTWARE, LLC "AS IS" AND ANY
#       EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#       WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#       DISCLAIMED. IN NO EVENT SHALL JAMF SOFTWARE, LLC BE LIABLE FOR ANY
#       DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#       (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#       LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#       ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#       (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#       SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
####################################################################################################

```