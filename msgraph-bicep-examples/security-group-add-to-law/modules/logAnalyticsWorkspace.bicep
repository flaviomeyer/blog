// Parameters
@description('Name of the Log Analytics workspace.')
param logAnalyticsWorkspaceName string

@description('SKU name for the Log Analytics workspace.')
@allowed([
  'Free'
  'PerGB2018'
])
param logAnalyticsWorkspaceSkuName string

@description('Log retention in days for the Log Analytics workspace.')
param logAnalyticsWorkspaceRetentionInDays int

@description('Maximum daily ingestion in gigabytes for the Log Analytics workspace.')
param logAnalyticsWorkspaceDailyQuotaGb int

@description('Name of the RBAC Role assignment.')
param roleAssignmentName string

@description('Principal ID of the user, group, or service principal to assign the role to.')
param principalId string

@description('Role definition ID to assign to the principal.')
param roleDefinitionId string

// Resources
resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: logAnalyticsWorkspaceName
  location: resourceGroup().location
  properties: {
    sku: {
      name: logAnalyticsWorkspaceSkuName
    }
    retentionInDays: logAnalyticsWorkspaceRetentionInDays
    workspaceCapping: {
      dailyQuotaGb: logAnalyticsWorkspaceDailyQuotaGb
    }
  }
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: logAnalyticsWorkspace
  name: roleAssignmentName
  properties: {
    principalId: principalId
    roleDefinitionId: roleDefinitionId
  }
}
