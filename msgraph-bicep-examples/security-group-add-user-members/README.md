# README

This project demonstrates a Bicep-based deployment for managing Microsoft Graph resources such as users and groups.

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
3. Verify outputs (e.g., listed user principal names and group details) in the deployment result.