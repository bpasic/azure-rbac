targetScope = 'subscription'

@description('Specifies the role definition ID used in the role assignment.')
param roleDefinitionId string

@description('Specifies the prinicpal ID assigned to the role.')
param principalId string

var roleAssignmentName = guid(principalId, roleDefinitionId, subscription().subscriptionId)

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: roleAssignmentName
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
    principalId: principalId
  }
}
