extension microsoftGraphV1

@description('Name of the group to be created')
param groupName string

resource group 'Microsoft.Graph/groups@v1.0' = {
  displayName: groupName
  mailEnabled: false
  mailNickname: uniqueString(groupName)
  securityEnabled: true
  uniqueName: groupName
}

output groupId string = group.id
output groupDisplayName string = group.displayName
