param location string = 'eastus'
param storagedveusaccount string = 'mystorageaccount483'

param namePrefix string = 'paulon'

targetScope = 'resourceGroup'


// How to consume modules
module storageaccount 'Storage.bicep' = {
  name:'${namePrefix}-mystorageaccount'
  params: {
    storagedveusaccount:storagedveusaccount 
    location:location
  }

}

module appPlanDeploy 'ServicePlan.bicep' = {
   name: '${namePrefix}-appPlanDeploy'

   params:{
    namePrefix:namePrefix
    location:location
   }  
}

module deploywebApp 'webApp.bicep' = {
  name: '${namePrefix}-deploy-website'

  params:{
    namePrefix:namePrefix
    location:location
    appPlanId:appPlanDeploy.outputs.planId
  }
}

output siteUrl string = deploywebApp.outputs.siteUrl




// // param location string = resourceGroup().location // resourceGroup() scope fetch location where the Azure resources are being deployed or managed.

// // param mystorageaccount string = 'space${uniqueString(resourceGroup().id)}'

// // resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
// //   name: mystorageaccount
// //   location: location
// //   kind: 'StorageV2'
// //   sku: {
// //     name: 'Premium_LRS' // different sizes for our resource
// //   }
// //   properties: {
// //     accessTier: 'Hot'
// //   }
// // }


// // // Data Types
// // // arrays, bool, int, object, string

// // var nameArray = [
// //    'James'
// //    'Andrew'
// //    30
// //    0

// // ]

// // // output result string = nameArray[0]

// // var person = {
// //   name: 'Jay'  //string
// //   lastName: 'Rite' // string
// //   age: 34 //int
// //   isMarried: false // bool
// //   educactions: {
// //     college: 'UW'
// //     year: 1987
// //   }
// // }

// // output result string = person.educactions.college
