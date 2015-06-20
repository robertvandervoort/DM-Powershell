#adds the DM snap in
add-pssnapin sqldmsnapin

#Creates a new SQL DM drive NOTE: PLEASE CHANGE SQLDM-AG to your SQL DM repository DB Instance name
# and SQLDMREPOSITORY to your SQL DM Repository DB name if necessary
New-SQLdmDrive SQLDM SQLDM-AG SQLdmRepository

#Set the location to the SQLdm Instances directory
Set-Location SQLDM:\Instances

#Get a list of all instances
$instances = Get-ChildItem

#Step through every instance
foreach ($i in $instances)
{
    # Turn on maintenance mode
    Set-SQLdmMonitoredInstance -Path (Escape-SQLdmName -Name $i.InstanceName) -OsMCollectByWMI -OsMConnectThruCollectionSvc 1
}