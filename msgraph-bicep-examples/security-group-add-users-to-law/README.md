# README

This example creates a security group with defined members and a Log Analytics workspace, assigning the security group as a contributor to the workspace.

## Project Structure

- **bicepconfig.json**  
  Contains Bicep configuration (including Microsoft Graph extension).
- **main.bicep**  
  Entry point for the deployment; references user and group Bicep modules.
- **main.bicepparam**  
  Parameter file with values for main.bicep.
- **modules/users.bicep**  
  Manages existing user profiles by userPrincipalNames, outputs user IDs.
- **modules/groups.bicep**  
  Creates or references a group resource with member assignment.
- **modules/logAnalyticsWorkspace.bicep**  
  Creates a new Log Analytics workspace and add Azure RBAC permission
  

## Usage

1. Build the Bicep file locally:
   ```bash
   az bicep build --file main.bicep
   ```
2. Deploy to a resource group:
   ```bash
   az deployment group create \
     --resource-group <ResourceGroupName> \
     --template-file main.bicep \
     --parameters main.bicepparam
   ```
3. Verify outputs (e.g., listed group details with users and RBAC role) in the deployment result.