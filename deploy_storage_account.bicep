param appname string
@allowed(['dev','prd'])
param environment string
param location string
param tags object = {
  purpose: 'Storage Account'
  environment: environment
  location: location
}
param runId string
@description('The access tier for the blob services')
@allowed([
  'Hot'
  'Cool'
  'Premium'
])
param accessTier string = 'Hot'
@description('The storage account sku')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GZRS'
  'Standard_RAGZRS'
])
param sku string = 'Standard_LRS'

module NamingModule 'modules/naming.bicep' = {
  name: 'naming-deploy-${runId}'
  params: {
    name: appname
    env: environment
    location: location
  }
}
module StorageModule 'modules/storage.bicep' = {
  name: 'storage-deploy-${runId}' 
  params: {
    storageAccountName: NamingModule.outputs.names.storage
    tags: tags
    location: location
    sku: sku
    accessTier: accessTier
  }
  dependsOn: [NamingModule]
}

output resourceName string = StorageModule.outputs.name
output resourceId string = StorageModule.outputs.id
