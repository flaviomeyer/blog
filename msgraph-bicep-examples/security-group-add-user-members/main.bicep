extension microsoftGraphV1

// Parameters
@description('Name of the group to be created')
param groupName string

@description('List of User Principal Names (UPNs)')
param upnList array

// Module invocations
module users 'modules/users.bicep' = {
  name: 'users'
  params: {
    upnList: upnList
  }
}

module group 'modules/groups.bicep' = {
  name: 'group'
  params: {
    groupName: groupName
    userIds: users.outputs.userIds
  }
}

// Outputs
output addedUserList array = users.outputs.userPrincipalNames
output groupName string = group.outputs.groupDisplayName
output groupId string = group.outputs.groupId
