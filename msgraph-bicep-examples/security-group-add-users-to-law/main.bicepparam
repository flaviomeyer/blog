using './main.bicep'

param upnList = [
  'usera@contoso.com'
  'userb@contoso.com'
  'userc@contoso.com'
]
param groupName = 'sg-con-log-prod-switzerlandnorth-01'
param logAnalyticsWorkspaceName = 'con-log-prod-switzerlandnorth-01'
param logAnalyticsWorkspaceSkuName = 'PerGB2018'
param logAnalyticsWorkspaceRetentionInDays = 30
param logAnalyticsWorkspaceDailyQuotaGb = 1
param roleDefinitionId = '92aaf0da-9dab-42b6-94a3-d43ce8d16293' //Log Analytics Contributor
