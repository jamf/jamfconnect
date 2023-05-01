# Integrating with RapidIdentity / Identity Automation

# Creating a Federation Partner definition

To integrate with RapidIdentity, you must create an Identity Provider Federation Partner in the administrative console Configuration page.


1. Log into the Rapid Identity administration portal for your tenant.
2. Select Configuration from the pulldown menu at the top of the screen.
3. Select Identity Providers fro the Security section.
4. Select Federation Partners from the left sidebar.

To create a new Federation Partner, you can either import a .json definition file or create a new integration manually.

## Option 1 - Recommended - Importing a definition file
1. Download the JamfConnect.json definition file from the Jamf Connect GitHub repository located at https://github.com/jamf/jamfconnect/tree/main/configurations/RapidIdentity-Identity_Automation
2. Select “Import” from the bottom navigation bar.  Select the JamfConnect.json file.
## Option 2 - Manually add federation partner
1. Click “Add Federation Partner”.  Select the option for “OpenID Connect”.
2. Expand the section titled “General.  
    1. Name: “Jamf Connect”
    2. Description: Enter a description of the Jamf Connect application following your organization’s naming guidelines
    3. Callback URLs: `https://127.0.0.1/jamfconnect`
3. Expand the section titled “OpenID Connect Configuration”
    1. Select “Sign ID Token (RSA with SHA-256)
    2. Select Encryption Method to “A128CBC_HS256”
    3. Select “Enable Resource Owner Password Grant (ROPG)”.  Select the option for “Yes” when presented with the security information about ROPG.
4. Expand the section titled “Claim Attributes”
    1. Click “Add Claim Attribute” and add the following claims
        1. Name: Email
        2. Description: Sends the LDAP mail Attribute
        3. Claim: `email`
        4. Claim Type: String
        5. Attribute Value Type: LDAP
        6. LDAP Attribute: `mail`
        7. Select the option for “Single Valued”
    2. Click “Add Claim Attribute” and add the following claims
        1. Name: Role
        2. Description: Sends the LDAP idautoPersonEmployeeTypes Attribute
        3. Claim: `role`
        4. Claim Type: String
        5. Attribute Value Type: LDAP
        6. LDAP Attribute: `idautoPersonEmployeeTypes`
        7. Verify the option for “Single Valued” is left unchecked to send multiple roles
    3. Click “Add Claim Attribute” and add the following claims
        1. Name: First
        2. Description: Sends the LDAP givenName Attribute
        3. Claim: `first`
        4. Claim Type: String
        5. Attribute Value Type: LDAP
        6. LDAP Attribute: `givenName`
        7. Select the option for “Single Valued”
    4. Click “Add Claim Attribute” and add the following claims
        1. Name: Last
        2. Description: Sends the LDAP sn Attribute
        3. Claim: `last`
        4. Claim Type: String
        5. Attribute Value Type: LDAP
        6. LDAP Attribute: `sn`
        7. Select the option for “Single Valued”
5. Select Save at the bottom of the screen to create the Federation Partner definition.
# Creating a configuration profile with Jamf Connect Configuration
## Gather information about your tenant and federation partner definition

Collect the information about your RapidIdentity / Identity Automation tenant.


1. Log into the Rapid Identity administration portal for your tenant.
2. Select Configuration from the pulldown menu at the top of the screen.
3. Select Identity Providers fro the Security section.
4. Select Federation Partners from the left sidebar.
5. Select the Jamf Connect federation partner definition and click “Edit”
6. Expand the section titled “General.”
7. Copy the Client ID field and save it for later use.
8. Click “Show Client Secret Key”.  Copy the Client Secret Key and save it for later use.
9. Select “IDP Configuration” from the left sidebar.
10. Copy the Base URL and save it for later use.
## Create configuration profiles with Jamf Connect Configuration

Jamf Connect Configuration is located in the software distribution DMG file for Jamf Connect.  The latest version of the software is located in your Jamf Account at account.jamf.com.  Install the software on your administrative Mac by dragging and dropping to the Applications folder.

Open the application.  If you have already created a previous configuration, select the “+” button in the lower left corner of the screen to make a new configuration.

On the Identity provider tab:

1. Identity provider: Custom
2. OIDC client ID: Enter the “Client ID” you saved from RapidIdentity earlier
3. OpenID Connect scopes: `openid+profile+email`
4. ROPG client ID: Enter the “Client ID” you saved from RapidIdentity earlier
5. Client secret: Enter the Client Secret Key you saved from RapidIdentity earlier
6. OIDC redirect URI: `https://127.0.0.1/jamfconnect`
7. Discovery URL: The Discovery URL is a combination of the Base URL you copied earlier appended with the following: `/.well-known/openid-configuration`.  A sample Discovery URL would be like: `https://sample_tenant_id.rapididentity.com/idp/.well-known/openid-configuration`
## Test your configuration

Select the option for Test in the upper right corner of the Jamf Connect Configuration application.  Select “OIDC”.  A web browser will open and prompt for a login.  Complete the login process and confirm that you receive a message of “You got tokens!”

Examine the decoded ID Token and confirm there are claims of:

- last
- first
- email
- (Optional) role

Select the option for Test in the upper right corner of the Jamf Connect Configuration application.  Select “ROPG”.  Enter the Username and Password in the same format that you used for the OIDC test.  Confirm that you receive a message of “Success: Your configuration seems to be working.”

## Complete your configuration

Select the Login tab at the top of the Jamf Connect Configuration tab.  Refer to Settings Reference → Login Window Settings [https://learn.jamf.com/bundle/jamf-connect-documentation-current/page/Login_Window_Preferences.html] for a full list of settings.  Recommended minimum settings are:


- User creation
    - Admin roles: Enter the values of `idautoPersonEmployeeTypes` from your RapidIdentity tenant that are appropriate for receiving administrator rights when logging into a Mac
    - Admin attribute: `roles`
    - Enable “Keychain: Create Jamf Connect Keychain”
- Authentication
    - Enable “Use Passthrough Authentication”
- Appearance
    - Enable “Internet: Allow network selection”

Add other settings as desired for your organization login and security needs.

Select the Connect tab at the top of the Jamf Connect Configuration tab.  Refer to Settings Reference → Menu Bar App Settings [https://learn.jamf.com/bundle/jamf-connect-documentation-current/page/Menu_Bar_App_Preferences.html] for a full list of settings.  Recommended minimum settings are:


- Authentiation
    - ROPG client ID: Enter the “Client ID” you saved from RapidIdentity earlier
    - Discovery URL: The Discovery URL is a combination of the Base URL you copied earlier appended with the following: `/.well-known/openid-configuration`.  A sample Discovery URL would be like: `https://sample_tenant_id.rapididentity.com/idp/.well-known/openid-configuration`
    - Client secret: Enter the Client Secret Key you saved from RapidIdentity earlier
- Custom branding
    - Set the option for “Show welcome window” to false by checking the box to select and then check again to unselect the option.

Add other settings as desired for your organization login and security needs.  Note that not every setting applied to every identity provider; refer to the reference guide for full details on specifics.

