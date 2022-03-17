## Jamf Pro Extension Attributes
Scripted Extension Attributes in Jamf Pro allow IT teams to extend the native inventory capabilities of the product with customizable data collection to achieve powerful, advanced workflows for the environment.

If you use Jamf Pro as MDM, many Jamf Connect Extension Attributes are already [built-in](https://docs.jamf.com/jamf-pro/documentation/Computer_Extension_Attributes.html?hl=template#ID-0001c78e) and can be used from within Jamf Pro. In the template gallery search for `Jamf Connect`

More information regarding using Extension Attributes in Jamf Pro can be found [here](https://docs.jamf.com/jamf-pro/administrator-guide/Computer_Extension_Attributes.html).

## Using Extension Attributes to report on the Jamf Connect attributes and state
This repository contains many Extension Attribute scripts that can be used to include information about Jamf Connect and the state on an endpoint in the standard inventory submission sent to Jamf Pro or any other MDM that does support Extension Attributes. 

You can track app and user status settings via [Jamf Connect’s state settings](https://docs.jamf.com/jamf-connect/documentation/State_Settings_and_User_Status.html). These settings are stored in the `com.jamf.connect.state` preference domain and include the following:

* **User information**—User attributes, such as a user’s display name from the cloud identity provider (IdP) and their email address.
* **Password information**—Details about a user’s password settings, such as their password expiration date or password complexity requirements found in Active Directory.
* **App information**—Details about Jamf Connect processes, such as if the app has been opened by the user and timestamps of the last sign-in or app notification.To read Jamf Connect state settings on a computer, execute the following command:

As there are many built-in templates in Jamf Pro, we have them stored here as well to make them available for Jamf Connect customers that do not use Jamf Pro as MDM.

## Please note that all resources contained within this repository are provided as-is and are not officially supported by Jamf Support.