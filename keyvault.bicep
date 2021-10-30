param namePrefix string = ''

var name = '${namePrefix}kv${uniqueString(resourceGroup().id)}'

resource keyVault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: name
  location: resourceGroup().location
  properties: {
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    tenantId: subscription().tenantId
    accessPolicies: [
    ]
    sku: {
      name: 'standard'
      family: 'A'
    }
  }
}


output id string = keyVault.id 
