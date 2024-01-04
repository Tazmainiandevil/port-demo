@description('The database name')
param name string
param parentName string
param location string = resourceGroup().location
param environment string
param runId string

module NamingModule 'modules/naming.bicep' = {
  name: 'naming-deploy-${runId}'
  params: {
    name: name
    env: environment
    location: location
  }
}
module sqlDatabaseModule 'modules/sqldatabase.bicep' = {
  name: 'database-deploy-${runId}'
  params: {
    location: location
    databaseName: NamingModule.outputs.names.sqlDatabase
    serverName: parentName
  }
  dependsOn: [NamingModule]
}
