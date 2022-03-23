# Additional Extension Attributes

The following extension attributes are curated by Jamf's Professional Services and Consulting Engineering teams, and they are not available as templates in Jamf Pro.

To use these extension attributes, upload them to Jamf Pro.

## Look for Unmigrated Users

Returns a list of user account names (a.k.a short names) on a computer that have not yet been migrated via logging in with Jamf Connect.

Use Cases:

- Use extension attribute as criteria for a smart computer group, and then use the smart group in the scope of a configuration profile, such as a Jamf Connect configuration that blocks local authentication at the login window until migration is complete.
- Search for computers that have local accounts that are not yet controlled and connected with your identity provider (IdP).

## Look for Network Users

Returns a list of users with mobile (network) accounts. The extension attribute result returns "No Network Accounts" if no mobile accounts exist, or a list of mobile account names on the computer.

Use Case:

Use the extension attribute as the criteria for smart group in Jamf Pro, and then use the scope of the smart group to execute account demobilization using Jamf Connect or NoMAD. If mobile accounts exists, you can disable the demobilize loginwindow mechanism in Jamf Connect using the `authchanger` command-line tool. Alternatively use the result of no mobile accounts as a trigger to enable Jamf Connect's account migration workflow to connect all demobilized local accounts to user network accounts in your IdP.

For more information, about using this extension attribute, see the [Demobilizing and Unbinding Mobile Accounts with Jamf Connect and Jamf Pro](https://docs.jamf.com/technical-articles/Demobilizing_and_Unbinding_Mobile_Accounts_with_Jamf_Connect_and_Jamf_Pro.html) article.

## Last Jamf Connect menu bar app sign-in within time range

Determine if a user successfully signed in with Jamf Connect successfully within a certain time frame, in days.

Use Case:

Add the extension attribute to Jamf Pro to display the result in a user's inventory information. If a user hasn't logged in successfully in a certain amount of days, you can use the extension attribute as criteria for a smart computer group and then use the smart computer group to remediate the issue in the following ways:

- Set the `DenyLocal` preference key to `true` for in the `com.jamf.connect.login` preference domain, which will force a user to use network authentication with Jamf Connect on their next login, even if FileVault is enabled.
- Use the Jamf Helper utility to execute a script that prompts users to sign in with Jamf Connect.

# Count of Jamf Connect users

Determine how many local user accounts on a computer are connect to a network account in your IdP via Jamf Connect.

Use Case:

Use the extension attribute as the criteria for smart group in Jamf Pro, and then use the scope of the smart group to do the following:

- Run a policy to disable the Jamf Connect login window after the count is `1` or more.
- Ensure local account migration of existing accounts with Jamf Connect succeeded.
