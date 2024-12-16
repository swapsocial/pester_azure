Describe 'Azure CLI Tests' {

    BeforeAll {
        # Ensure that Azure CLI is authenticated
        # Use the Service Principal login in a CI/CD environment or manually in a local environment
        az login --service-principal -u $env:AZURE_CLIENT_ID -p $env:AZURE_CLIENT_SECRET --tenant $env:AZURE_TENANT_ID
    }

    Context 'Check if Resource Group exists' {

        It 'Should verify that the resource group exists' {
            # Run Azure CLI to check if the resource group exists
            $resourceGroupName = 'YourResourceGroupName'
            $result = az group show --name $resourceGroupName --output json

            # Assert that the resource group exists (it should not be null)
            $result | Should -Not -BeNullOrEmpty

            # Optionally, assert specific properties of the resource group
            $resourceGroup = $result | ConvertFrom-Json
            $resourceGroup.name | Should -BeExactly $resourceGroupName
        }

    }

    Context 'Check if a Virtual Machine exists' {

        It 'Should verify that the VM exists in the resource group' {
            $resourceGroupName = 'YourResourceGroupName'
            $vmName = 'YourVMName'
            
            # Run Azure CLI to check if the VM exists
            $result = az vm show --name $vmName --resource-group $resourceGroupName --output json

            # Assert that the VM exists (it should not be null)
            $result | Should -Not -BeNullOrEmpty

            # Optionally, assert specific properties of the VM
            $vm = $result | ConvertFrom-Json
            $vm.name | Should -BeExactly $vmName
        }
        
    }

    AfterAll {
        # Clean up or log out if needed
        az logout
    }
}
