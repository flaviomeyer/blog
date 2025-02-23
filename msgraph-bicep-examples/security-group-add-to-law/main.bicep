// Extensions
extension microsoftGraphV1

// Parameters
@description('Name of the group to be created')
param groupName string

@description('Name of the Log Analytics workspace to be created')
param logAnalyticsWorkspaceName string

@description('Sku name of the Log Analytics workspace to be created')
param logAnalyticsWorkspaceSkuName string

@description('Retention period in days for the Log Analytics workspace')
param logAnalyticsWorkspaceRetentionInDays int

@description('Daily quota in GB for the Log Analytics workspace')
param logAnalyticsWorkspaceDailyQuotaGb int

@description('Role definition ID to assign to the principal.')
param roleDefinitionId string

// Variables
@description('Name of the role assignment to be created')
var roleAssignmentName = guid(groupName, roleDefinitionId, resourceGroup().id)

// Resources
module groups 'modules/groups.bicep' = {
  name: 'groups'
  params: {
    groupName: groupName
  }
}

module logAnalyticsWorkspace 'modules/logAnalyticsWorkspace.bicep' = {
  name: 'logAnalyticsWorkspace'
  params: {
    logAnalyticsWorkspaceName: logAnalyticsWorkspaceName
    logAnalyticsWorkspaceSkuName: logAnalyticsWorkspaceSkuName
    logAnalyticsWorkspaceRetentionInDays: logAnalyticsWorkspaceRetentionInDays
    logAnalyticsWorkspaceDailyQuotaGb: logAnalyticsWorkspaceDailyQuotaGb
    roleAssignmentName: roleAssignmentName
    principalId: groups.outputs.groupId
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
  }
}

// Outputs
output groupName string = groups.outputs.groupDisplayName
output groupId string = groups.outputs.groupId
output roleAssignmentName string = roleAssignmentName
