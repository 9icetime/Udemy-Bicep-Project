@minLength(5)
@maxLength(24)
@description('StorageName must have min 5 chars and max of 24 chars')

param storagedveusaccount string 
param location string = 'eastus'


resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storagedveusaccount
  location:location 
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS' // different sizes for our resource
  }
  properties: {
    accessTier: 'Hot'
  }
}
