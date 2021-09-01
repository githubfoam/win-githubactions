#--------------------------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/set-psdebug?view=powershell-7.1
Set-PSDebug -Trace 2 #turns script debugging features on and off, sets the trace level

$VerbosePreference = "continue"
Write-Output $VerbosePreference
#--------------------------------------------------------------------------------------------------------

docker version
docker pull kalilinux/kali-rolling
docker images ls 
# all the images below do not come with the “default” metapackage. You will need to apt update && apt -y install kali-linux-headless
# docker run --tty --interactive kalilinux/kali-rolling /bin/bash

# docker run -ti kalilinux/kali-rolling /bin/bash
# https://www.kali.org/blog/kali-linux-metapackages/
# apt install kali-tools-top10
#--------------------------------------------------------------------------------------------------------

$dw = @{ HostAddress = 'npipe://./pipe/win_engine' }
Request-ContainerImage @dw microsoft/nanoserver
Request-ContainerImage ubuntu

docker image ls 

$w = New-Container @dw microsoft/nanoserver | Start-Container @dw -Passthru
$session = New-PSSession -Name Nano -ContainerId $w.ID

# enter and `exit` , or use Copy-Item -ToSession
Enter-PSSession $session
# Copy-Item -ToSession $session

# Installing PowerShell on Ubuntu
$u = New-Container ubuntu -Input -Terminal -name psu | Start-Container -Passthru
Start-ContainerProcess $u apt-get update
Start-ContainerProcess $u apt-get install libicu55 libunwind8

# download here and push in, just to show how:
Invoke-WebRequest https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.9/powershell_6.0.0-alpha.9-1ubuntu1.16.04.1_amd64.deb -OutFile ~/Downloads/powershell_6.0.0-alpha.9-1ubuntu1.16.04.1_amd64.deb
Copy-ContainerFile $u ~/Downloads/powershell_6.0.0-alpha.9-1ubuntu1.16.04.1_amd64.deb -Destination /home -ToContainer 

# Install it using dpkg -i
Start-ContainerProcess $u dpkg '-i' /home/powershell_6.0.0-alpha.9-1ubuntu1.16.04.1_amd64.deb

# docker exec -it psu powershell
# docker attach psu


#--------------------------------------------------------------------------------------------------------

# Write-Output "displays a list of running services."
# tasklist | findstr "osqueryd.exe"

# Write-Output "display a list of all processes along with their corresponding PID, and services that are tied to them"
# tasklist /svc | findstr "osqueryd"

# Get all services on the computer
# Get-Service -Name "osqueryd"
# Get-Service "osquery*"
# Get-Service "osqueryd" -RequiredServices #gets the services that the osqueryd service requires

# Get-Service -Name "osqueryd" | Stop-Service -Force

# Start-Service -DisplayName *osqueryd* -WhatIf

# Get-Service -Displayname "osqueryd"

# Get-CimInstance win32_service | Where-Object Name -eq "osqueryd"

# Start-Service osqueryd

# Get-CimInstance win32_service | Where-Object Name -eq "osqueryd"

