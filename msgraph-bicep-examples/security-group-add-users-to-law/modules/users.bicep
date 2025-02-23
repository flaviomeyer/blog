// Extension
extension microsoftGraphV1

// Parameters
@description('List of User Principal Names (UPNs)')
param upnList array

// Variables
@description('Length of the UPN list')
var upnListLength = length(upnList)

// Resources
resource userList 'Microsoft.Graph/users@v1.0' existing = [for i in range(0, upnListLength): {
  userPrincipalName: upnList[i]
}]

// Output
output userIds array = [for i in range(0, upnListLength): userList[i].id]
output userPrincipalNames array = upnList
