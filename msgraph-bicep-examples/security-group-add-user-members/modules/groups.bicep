extension microsoftGraphV1

@description('Name of the group to be created')
param groupName string

@description('List of User IDs to be added as members')
param userIds array

resource group 'Microsoft.Graph/groups@v1.0' = {
  displayName: groupName
  mailEnabled: false
  mailNickname: uniqueString(groupName)
  securityEnabled: true
  uniqueName: groupName
  members: userIds
}

output groupId string = group.id
output groupDisplayName string = group.displayName
