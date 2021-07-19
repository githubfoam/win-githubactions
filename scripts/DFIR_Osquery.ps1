#--------------------------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/set-psdebug?view=powershell-7.1
Set-PSDebug -Trace 2 #turns script debugging features on and off, sets the trace level

$VerbosePreference = "continue"
Write-Output $VerbosePreference
#--------------------------------------------------------------------------------------------------------

Write-Host "#################################################"
osqueryi --json 'select * from listening_ports ;' > listening_ports.json
Get-Content -Path listening_ports.json

Write-Host "#################################################"
# Check the processes that have a deleted executable
osqueryi --json 'SELECT * FROM processes WHERE on_disk = 0' > deleted_executable.json
Get-Content -Path deleted_executable.json


