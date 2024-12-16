Import-Module -Name Az.Resources

Describe 'Azure VM Tests' {

    # Test 1: VM should exist
    It 'VM should exist' {
        $vm = Get-AzVM -ResourceGroupName 'YourResourceGroupName' -Name 'YourVMName'
        $vm | Should -Not -BeNullOrEmpty
    }

    # Test 2: VM should be in running state
    It 'VM should be in running state' {
        $vm = Get-AzVM -ResourceGroupName 'YourResourceGroupName' -Name 'YourVMName'
        $vm.Statuses[1].Code | Should -Be 'PowerState/running'
    }

    # Test 3: VM should have correct size
    It 'VM should have correct size' {
        $vm = Get-AzVM -ResourceGroupName 'YourResourceGroupName' -Name 'YourVMName'
        $vm.HardwareProfile.VmSize | Should -Be 'Standard_DS1_v2'  # Change this to your expected size
    }

}
