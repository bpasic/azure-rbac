targetScope = 'subscription'

@description('Array of actions for the roleDefinition.')
param actions array

@description('Array of notActions for the roleDefinition.')
param notActions array

@description('Friendly name of the role definition.')
param roleName string

@description('Detailed description of the role definition.')
param roleDescription string

var roleDefinitionName = guid(subscription().id, string(actions), string(notActions))

resource roleDefinition 'Microsoft.Authorization/roleDefinitions@2018-01-01-preview' = {
  name: roleDefinitionName
  properties: {
    roleName: roleName
    description: roleDescription
    type: 'customRole'
    permissions: [
      {
        actions: actions
        notActions: notActions
      }
    ]
    assignableScopes: [
      subscription().id
    ]
  }
}
