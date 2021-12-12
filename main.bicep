targetScope = 'subscription'
@allowed([
  'dev'
  'prod'
])

param environmentType string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'meltlake-dev-bicep-rg'
  location: 'westeurope'
}

module datalake 'modules/adlgen2.bicep' = {
  name: 'datalakeDeploy'
  scope: rg
  params: {
    namePrefix: 'v001'
  }
}

// module adf 'modules/adf.bicep' = {
//   name: 'adfDeploy'
//   scope: rg
//   params: {
//       }
// }

output datalakeId string = datalake.outputs.storAcctId


