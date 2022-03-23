# Configuration Profile Examples

You must create a configuration profile to deploy to target computers alongside the Jamf Connect package.

Depending on which components of Jamf Connect you plan to use, you must configure settings for the following Jamf application domains:

- `com.jamf.connect`—Includes all settings for the Jamf Connect menu bar app
- `com.jamf.connect.login`—Includes all settings for the Jamf Connect login window

Jamf Connect configuration profiles using multiple methods, and it is up an IT administrator to determine which tool best suits them and their environment.

Configurations can be created with the following methods;

- [Jamf Connect Configuration](https://docs.jamf.com/jamf-connect/documentation/Jamf_Connect_Configuration.html) is an app that allows administrators to automatically create computer configuration profiles for Jamf Connect apps. You can use Jamf Connect Configuration to do the following:
  - Select and specify Jamf Connect preferences.
  - Test configurations to confirm a successful connection with your cloud identity provider (IdP).
  - Save configuration profiles, which you can install locally or upload for deployment with an MDM solution. Configuration profiles can be saved in `.mobileconfig` or `PLIST` format.
  - Upload configuration profiles in `.mobileconfig` format to Jamf Pro.
  - Edit, duplicate, or import existing Jamf Connect configuration profiles.
- You can use [Jamf Pro](https://docs.jamf.com/jamf-connect/documentation/Creating_a_Configuration_Profile_using_Jamf_Pro.html) to create a computer configuration profile that configures Jamf Connect settings with the Application & Custom Settings payload. This payload allows you to select Jamf Connect preferences, automatically generate a PLIST file, and configure the scope. Jamf Pro can use configuration profiles created in this way to automatically deploy and update Jamf Connect.
- You can manually create a PLIST file that defines the properties for the preference domain you specify in Jamf Pro, and then [upload the PLIST file directly to Jamf Pro.](https://docs.jamf.com/technical-articles/Deploying_Custom_Configuration_Profiles_Using_Jamf_Pro.html)

# About this repository

This sub-repository contains example configuration profiles for Jamf Connect 1.x and earlier and Jamf Connect 2.0.0 or later. You can download any of these configuration profiles and import them into the Jamf Connect Configuration app as a starting point.

**Disclaimer:** All resources contained in this repository are provided as-is and are not officially supported by Jamf Support.
