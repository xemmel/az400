targetScope = 'resourceGroup'

param identityId string
param roleNameGuid string

resource role 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
  scope: subscription()
  name: roleNameGuid
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(resourceGroup().id, identityId, role.id)
  scope: resourceGroup()
  properties: {
    principalId: identityId
    roleDefinitionId: role.id
  }
}
