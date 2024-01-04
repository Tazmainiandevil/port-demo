@description('The application name')
param name string  
@description('The environment name')
param env string  
@description('The location')
param location string 
@description('Index for the resource')
param index string = ''
@description('The separator to use to make the naming convention')
param separator string = '-'
var shortNames = {
  // Europe
  westeurope: {
    shortName: 'weu'
  }
  northeurope: {
    shortName: 'neu'
  }
  germanynorth: {
    shortname: 'gn'
  }
  germanywestcentral: {
    shortname: 'gwc'
  }
  francesouth: {
    shortname: 'frs'
  }
  francecentral: {
    shortname: 'frc'
  }
  switzerlandwest: {
    shortname: 'sw'
  }
  switzerlandnorth: {
    shortname: 'sn'
  }
  norwaywest: {
    shortname: 'nww'
  }
  norwayeast: {
    shortname: 'nwe'
  }
  swedencentral: {
    shortname: 'csw'
  }
  // UK
  uksouth: {
    shortName: 'uks'
  }
  ukwest: {
    shortName: 'ukw'
  }
  // USA
  westus: {
    shortName: 'wus'
  }
  centralus: {
    shortName: 'cus'
  }
  eastus: {
    shortName: 'eus'
  }
  eastus2: {
    shortname: 'eus2'
  }
  westus2: {
    shortname: 'wus2'
  }
  westus3: {
    shortname: 'wus3'
  }
  southcentralus: {
    shortname: 'scus'
  }
  northcentralus: {
    shortname: 'ncus'
  }
  westcentralus: {
    shortname: 'wcus'
  }
  // ASIA
  eastasia: {
    shortname: 'ea'
  }
  southeastasia: {
    shortname: 'sea'
  }
  westindia: {
    shortname: 'win'
  }
  southindia: {
    shortname: 'sin'
  }
  centralindia: {
    shortname: 'cin'
  }
  japanwest: {
    shortname: 'jpw'
  }
  japaneast: {
    shortname: 'jpe'
  }
  australiaeast: {
    shortname: 'aue'
  }
  australiasoutheast: {
    shortname: 'ause'
  }
  australiacentral: {
    shortname: 'auc'
  }
  australiacentral2: {
    shortname: 'auc2'
  }
  // Africa
  southafricawest: {
    shortname: 'saw'
  }
  southafricanorth: {
    shortname: 'san'
  }
}
var shortLocation  = shortNames[location].shortName
var separated_prefix = '${env}${separator}'
var separated_name = '${name}${separator}'
var separated_suffix = index == '' ? '[RT]${separator}${shortLocation}' : '[RT]${separator}${shortLocation}${separator}${padLeft(index,2,'0')}'
var separated_output = '${separated_prefix}${separated_name}${separated_suffix}'
output names  object = {
  logAnalyticsWorkspace: replace(separated_output, '[RT]', 'log')
  aksCluster: replace(separated_output, '[RT]', 'aks')
  storage: replace(replace(toLower(replace(separated_output, '[RT]', 'st')), '${separator}', ''), '_', '')
  containerRegistry: replace(replace(toLower(replace(separated_output, '[RT]', 'cr')), '${separator}', ''), '_', '')
  appServicePlan: replace(separated_output, '[RT]', 'plan')
  applicationGateway: replace(separated_output, '[RT]', 'agw')
  applicationInsights: replace(separated_output, '[RT]', 'appi')
  automationAccount: replace(separated_output, '[RT]', 'aa')
  apiManagement: replace(separated_output, '[RT]', 'apim')
  functionApp: replace(separated_output, '[RT]', 'func')
  frontdoor: replace(separated_output, '[RT]', 'afd')
  FrontdoorEndpoint: replace(separated_output, '[RT]', 'fde')
  FrontdoorFirewallPolicy: replace(separated_output, '[RT]', 'fdfp')
  CdnProfile: replace(separated_output, '[RT]', 'cdnp')
  CdnEndpoint: replace(replace(toLower(replace(separated_output, '[RT]', 'cdne')), '${separator}', ''), '_', '')
  eventgridTopic: replace(separated_output, '[RT]', 'evgt')
  appService: replace(separated_output, '[RT]', 'app')
  containerApp: replace(separated_output, '[RT]', 'ca')
  containerAppEnv: replace(separated_output, '[RT]', 'cae')
  containerInstance: replace(separated_output, '[RT]', 'ci')
  appConfiguration: replace(separated_output, '[RT]', 'appcg')
  dataFactory: replace(separated_output, '[RT]', 'adf')
  logicApp: replace(separated_output, '[RT]', 'logic')
  virtualNetwork: replace(separated_output, '[RT]', 'vnet')
  virtualNetworkPeer:  replace(separated_output, '[RT]', 'peer')
  subnet: replace(separated_output, '[RT]', 'snet')
  networkSecurityGroup: replace(separated_output, '[RT]', 'nsg')
  networkInterface: replace(separated_output, '[RT]', 'nic')
  routeTable: replace(separated_output, '[RT]', 'rt')
  publicIp: replace(separated_output, '[RT]', 'pip')
  redisCache: replace(separated_output, '[RT]', 'redis')
  resourceGroup: replace(separated_output, '[RT]', 'rg')
  aksNodesResourceGroup: replace(separated_output, '[RT]', 'rg-aks-nodes')
  servicebusNamespace: replace(separated_output, '[RT]', 'sb')
  sqlServer: replace(separated_output, '[RT]', 'sql')
  sqlDatabase: replace(separated_output, '[RT]', 'sqldb')
  sqlElasticpool: replace(separated_output, '[RT]', 'sqlep')
  privateLink: replace(separated_output, '[RT]', 'pl')
  privateEndpoint: replace(separated_output, '[RT]', 'pep')
  webApplicationFirewall: replace(separated_output, '[RT]', 'waf')
  webApplicationFirewallPolicyGroup: replace(separated_output, '[RT]', 'wafrg')
  LoadBalancerInternal: replace(separated_output, '[RT]', 'lbi')
  LoadBalancerExternal: replace(separated_output, '[RT]', 'lbe')
  LoadBalancerRule: replace(separated_output, '[RT]', 'rule')
}
output resourceTemplate string = '${separated_prefix}${separated_name}${separated_suffix}'
output resourceTemplateNoSeparator string = replace(toLower('${separated_prefix}${separated_name}${separated_suffix}'), '${separator}', '')
