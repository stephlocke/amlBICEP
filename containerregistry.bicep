param namePrefix string = ''

var name = '${namePrefix}cr${uniqueString(resourceGroup().id)}'

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: name
  location: resourceGroup().location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}


output id string = containerRegistry.id 

