New-Item ProdServernames.csv -Force
Set-Content ProdServernames.csv 'VmName,ResourceGroupName,SubscriptionName'
$vmList = Get-AzVM
foreach ($vm in $vmList) {
$resourceGroupName = $vm.ResourceGroupName
$ServerName = $vm.Name
$subid = ($vm.Id -split '/')[2]
$subscriptionname = (Get-AzSubscription -SubscriptionId $subid).Name
Add-Content ProdServernames.csv "$ServerName,$resourceGroupName,$subscriptionname"
}
