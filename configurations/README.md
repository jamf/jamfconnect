# Configurations
Jamf Connect needs to have a valid configuration in order to work, to properly configure Jamf Connect we need to configure settings in two different preference domains. 

* In  `com.jamf.connect.login` values can be specified for configuring Jamf Connect at LoginWindow
* In  `com.jamf.connect` values can be specified for configuring the Jamf Connect MenuBar application.

Both configurations can be created on multiple ways, but in the end it does not change the behaviour of Jamf Connect.

Configurations can be created with the following methods;

* [Jamf Connect Configuration](https://docs.jamf.com/jamf-connect/documentation/Jamf_Connect_Configuration.html) is an app that allows administrators to automatically create computer configuration profiles for Jamf Connect apps. You can use Jamf Connect Configuration to do the following:
	* Select and specify Jamf Connect preferences.
	* Test configurations to confirm a successful connection with your cloud identity provider (IdP).
	* Save configuration profiles, which you can install locally or upload for deployment with an MDM solution. Configuration profiles can be saved in `.mobileconfig` or `PLIST` format.
	* Upload configuration profiles in `.mobileconfig` format to Jamf Pro.
	* Edit, duplicate, or import existing Jamf Connect configuration profiles.
* You can use [Jamf Pro](https://docs.jamf.com/jamf-connect/documentation/Creating_a_Configuration_Profile_using_Jamf_Pro.html) to create a computer configuration profile that configures Jamf Connect settings with the Application & Custom Settings payload. This payload allows you to select Jamf Connect preferences, automatically generate a PLIST file, and configure the scope. Jamf Pro can use configuration profiles created in this way to automatically deploy and update Jamf Connect.
* You can manually create a PLIST file that defines the properties for the preference domain you specify in Jamf Pro, and then [upload the PLIST file directly to Jamf Pro.](https://docs.jamf.com/technical-articles/Deploying_Custom_Configuration_Profiles_Using_Jamf_Pro.html)



# About this repository
In this sub-repository you will find example configurations for Jamf Connect version 1 and version 2, these example configurations can be used to import in Jamf Pro or in the Jamf Connect Configuration app and can be customised.


## Please note that all resources contained within this repository are provided as-is and are not officially supported by Jamf Support.