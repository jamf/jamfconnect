# Creating a Custom Scope for Jamf Connect and Conditional Access policies
**Change log**:
25 JAN 2023 - Using new Custom Security Attributes (preview) from Microsoft, we can mark an application as being subject or exempt from a conditional access policy.  New instructions include how to make the basic single Jamf Connect app no longer subject to a CA policy without removing any "All cloud apps" scoped policies.  Also includes how to make Jamf Connect interactive logins subject to a CA policy and non-interactive ROPG password checks not show failures in user sign-in logs.
24 AUG 2022 - Initial release.  See notes of minimum system requirements for minimum version of Jamf Connect to use for these instructions.

# Workflow overview:

- Create a “private endpoint” application registration with a custom API
    - With API permissions for “User.read”
    - With “Expose an API” scope created
- Create a “public endpoint” application registration for OIDC to call that custom API
    - Add API permission for “My APIs” for the name of the application created in first step and the scope created in first step
    - Define roles like “Admin” and “Standard” for elevating macOS account permissions
- Optional: Create an Azure Conditional Access policy to require multi-factor authentication
    - Create an exception to Azure Conditional Access policies to exempt ROPG from requiring MFA
- Create a Jamf Connect Login configuration profile
    - Azure as Identity Provider
    - Define a custom scope
- Test with Jamf Connect Configuration 
# Minimum system requirements

These instructions were written assuming you are using Jamf Connect version 2.17 or greater.

Refer to https://www.jamf.com/blog/how-to-azure-conditional-access-and-jamf-connect/ for details on this workflow and why you may need it.