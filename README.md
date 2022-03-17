# Jamf Connect
A repository for open-source resources created for use with or alongside Jamf Connect.

![](https://resources.jamf.com/images/logos/Jamf-Connect-color.png)

Customers of Jamf Connect are able to leverage resources in this repository such as:

### Configurations
Jamf Connect supports many identity providers and customs as well, in this folder you will find example configurations for standard supported identity providers and also a custom identity Providers.
Import the sample profiles into the Jamf Connect Configuration application or direct into Jamf Pro. **Make sure to modify the configuration to use your organization identity provider settings.**

### Extension Attributes
As Jamf Connect writes data to the com.jamf.connect.state domain, we can read and import that data in Jamf Pro with Extension Attributes. Many Extension Attributes for Jamf Connect are built-in as templates within Jamf Pro and are included here as well.

More information on using Extension Attributes with Jamf Pro can be found [here](https://docs.jamf.com/jamf-pro/administrator-guide/Computer_Extension_Attributes.html)

Additional extension attributes that have been created for customers by our professional services and consulting engineering team have been included in a separate directory.

### Jamf Connect Scripts
Jamf Connect can be combined in scripts, to use [URI schemas](https://docs.jamf.com/jamf-connect/documentation/Jamf_Connect_URL_Scheme.html) in certain scripts or read data from [com.jamf.connect.state.plist](https://docs.jamf.com/jamf-connect/documentation/State_Settings_and_User_Status.html) to use within scripts.

We can also call the [authchanger](https://docs.jamf.com/jamf-connect/documentation/authchanger.html) binary to change the LoginWindow from a script or run certain actions with Jamf Connect at Login.

### Debugging Logs
More information on the Jamf Connect logs can be found [here](https://docs.jamf.com/jamf-connect/documentation/Jamf_Connect_Logs.html) 

### Please see the [Wiki](https://github.com/jamf/jamfconnect/wiki) for specific information on each resource in this repository.

# 
## Please note that all resources contained within this repository are provided as-is and are not officially supported by Jamf Support.