targetScope = 'resourceGroup'

param appName string
param env string
param appNamePrefix string = ''
param location string
param skuTier string = 'Standard'
param skuName string = 'S1'
param capacity int = 1



var planName = '${appNamePrefix}${appName}-${env}-plan'






resource plan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: planName
  location: location
  sku: {
    name: skuName
    tier: skuTier
    capacity: capacity
  }
  
}

output id string = plan.id
