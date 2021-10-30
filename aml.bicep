param namePrefix string = ''
param incContainerRegistry bool = true

module storage 'storage.bicep' = {
  name: 'storageaccount'
  params: {
    namePrefix: namePrefix
  }  
}

module applicationinsights 'applicationinsights.bicep' = {
  name: 'appInsights'
  params: {
    namePrefix: namePrefix
  }  
}

module keyVault 'keyvault.bicep' = {
  name: 'keyvault'
  params: {
    namePrefix: namePrefix
  }  
}

module containerRegistry 'containerregistry.bicep' = if(incContainerRegistry) {
  name: 'containerregistry'
  params: {
    namePrefix: namePrefix
  }  
}

var name = '${namePrefix}_aml_${uniqueString(resourceGroup().id)}'

resource aml 'Microsoft.MachineLearningServices/workspaces@2021-07-01' = {
  name: name
  location: resourceGroup().location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    friendlyName: name
    storageAccount: storage.outputs.id
    keyVault: keyVault.outputs.id
    containerRegistry: ((!empty(containerRegistry)) ? containerRegistry.outputs.id : json('null'))
    applicationInsights: applicationinsights.outputs.id
  }
}
