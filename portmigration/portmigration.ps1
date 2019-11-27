$VDPortGroups =  Import-Csv -Path D:\path\to\csv
 
foreach ($VDPortGroup in $VDPortGroups) {
$pg = Get-VDSwitch VDS switch name | Get-VDPortgroup -Name $VDPortGroup.VLANName
$natemp = $VDPortGroup.NetworkAdapter
$na = Get-VM $VDPortGroup.VM | Get-NetworkAdapter -Name "$natemp"
Set-NetworkAdapter -NetworkAdapter $na -Portgroup $pg -Confirm:$false
Set-NetworkAdapter -NetworkAdapter $na -Connected:$true -Confirm:$false
 get-vm $VDPortGroup.VM | Get-NetworkAdapter
 
}
