extension microsoftGraphV1

@description('List of User Principal Names (UPNs)')
param upnList array

var upnListLength = length(upnList)

resource userList 'Microsoft.Graph/users@v1.0' existing = [for i in range(0, upnListLength): {
  userPrincipalName: upnList[i]
}]

output userIds array = [for i in range(0, upnListLength): userList[i].id]
output userPrincipalNames array = upnList
