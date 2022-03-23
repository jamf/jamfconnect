# Jamf Pro Built-in Extension Attributes

If you use Jamf Pro, you can use Jamf Connect extension attribute templates to collect Jamf Connect data from computers using Jamf Pro. Jamf Connect extension attribute templates collect data from the Jamf Connect state settings on computers.

For instructions on creating an extension attribute from a template in Jamf Pro, see the [Computer Extension Attributes](https://docs.jamf.com/jamf-pro/documentation/Computer_Extension_Attributes.html) in the _Jamf Pro Documentation_.

If you do not use Jamf Pro, these extension attributes are available to download in the _built-in_extension_attributes_ folder in this repository.

## Using Extension Attributes to Report Jamf Connect Attributes and Statuses

You can track app and user status settings via Jamf Connect's [State Settings and User Status](https://docs.jamf.com/jamf-connect/documentation/State_Settings_and_User_Status.html) preference domain. These settings are stored in the `com.jamf.connect.state` preference domain and include the following:

- **User information**—User attributes, such as a user’s display name from the cloud identity provider (IdP) and their email address.
- **Password information**—Details about a user’s password settings, such as their password expiration date or password complexity requirements found in Active Directory.
- **App information**—Details about Jamf Connect processes, such as if the app has been opened by the user and timestamps of the last sign-in or app notification.To read Jamf Connect state settings on a computer, execute the following command:

**Disclaimer:** All resources contained in this repository are provided as-is and are not officially supported by Jamf Support.
