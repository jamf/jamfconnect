# Creating a Custom Scope for Jamf Connect and Conditional Access policies
**Change log**:
24 AUG 2022 - Initial release.  See notes of minimum system requirements for minimum version of Jamf Connect to use for these instructions.

# Workflow overview:
- Create a “private endpoint” application registration with a custom API
    - With API permissions for “User.read”
    - With “Expose an API” scope created
    - Define roles like “Admin” and “Standard” for elevating macOS account permissions
- Create a “public endpoint” application registration for OIDC to call that custom API
    - Add API permission for “My APIs” for the name of the application created in first step and the scope created in first step
- Create an Azure Conditional Access policy to require multifactor authentication
    - Apply to application created in first step
- Remove any CA policy applied to “All cloud apps” that would require MFA
- Create a Jamf Connect Login configuration profile
    - Azure as Identity Provider
    - Define a custom scope
    - Define the Discovery URL for OIDC and ROPG
    - Test with Jamf Connect Configuration 
# Minimum system requirements

These instructions were written assuming you are using Jamf Connect version 2.14 or greater.

Refer to https://www.jamf.com/blog/how-to-azure-conditional-access-and-jamf-connect/ for details on this workflow and why you may need it.