param namePrefix string = 'DefaultPrefix'
// param nameSuffix string = 'DefaultSuffix'
param sku string = 'Standard_LRS'
param environment string = 'dev' 

// resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
//   name: 'datafactory${nameSuffix}'
//   location: resourceGroup().location
// }

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: '${environment}datalake'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: sku
    }
  properties: {
    accessTier: 'Hot'
    isHnsEnabled: true
  }
}

// output planId array = [storageAccount.id, dataFactory.id]
output storAcctId string = storageAccount.id
