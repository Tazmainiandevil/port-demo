param databaseName string
param serverName string
param location string

resource sqlServerResource 'Microsoft.Sql/servers@2023-02-01-preview' existing = {
  name: serverName
}

resource sqlDB 'Microsoft.Sql/servers/databases@2023-02-01-preview' = {
  parent: sqlServerResource
  name: databaseName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}
