#description: A runbook script
#tags: Preview

<# Notes:
    This script will do things in Azure!
#>

<# Variables:
{
    "Param1": {
        "Description": "The first parameter",
        "IsRequired": true
    },
    "Param2": {
        "Description": "An optional parameter",
        "IsRequired": false
    }
}
#>

$ErrorActionPreference = 'Stop'

# Your script here


$RestricUntil = (Get-Date).AddHours([int]$Hours)
$TimeZoneId = (Get-TimeZone).Id

Write-output "Setting VM Tags"
foreach ($VM in $VMs) {
    $tags = $vm.tags

    # Add the scale in restriction tag to prevent Nerdio from turning the Vms off
    $tags["WAP_SCALE_IN_RESTRICTION"] = $RestrictUntil.ToString("yyyy-MM-ddTHH") + ";$TimeZoneId"
    Set-AzResource -ResourceGroupName -Name $vm.name -ResourceType "Microsoft.Compute/VirtualMachines" -Tag $tags -Force
}


