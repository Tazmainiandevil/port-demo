param appname string
@allowed(['dev','prd'])
param environment string
param location string
param tags object = {
  purpose: 'SQL Server'
  environment: environment
  location: location
}
param runId string

module NamingModule 'modules/naming.bicep' = {
  name: 'naming-deploy-${runId}'
  params: {
    name: appname
    env: environment
    location: location
  }
}

var tempCreds = '!76${uniqueString(NamingModule.outputs.names.sqlServer)}#245'
module SqlModule 'modules/sqlserver.bicep' = {
  name: 'sql-deploy-${runId}'  
  params: {
    sqlServerName: NamingModule.outputs.names.sqlServer
    tags: tags
    location: location
    administratorLogin: 'sqladmin'
    administratorLoginPassword: tempCreds
  }
  dependsOn: [NamingModule]
}

output resourceName string = SqlModule.outputs.name
output resourceId string = SqlModule.outputs.id
