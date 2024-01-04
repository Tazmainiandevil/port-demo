@description('The resource location') 
param location string
param tags object
param sqlServerName string 
param administratorLogin string 
@secure()
param administratorLoginPassword string

resource SqlServerResource 'Microsoft.Sql/servers@2022-11-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
  tags:tags
}

output name string = SqlServerResource.name
output id string = SqlServerResource.id
