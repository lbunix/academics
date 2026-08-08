clear

Write-Host "===== System Info ====="
Write-Host
Write-Host "Computer Name:" ([System.Environment]::MachineName)
Write-Host "User:" ([System.Environment]::UserName)
Write-Host "Operating System:" ([System.Environment]::OSVersion)
Write-Host "Processor:" ([System.Environment]::ProcessorCount)

Write-Host "`n===== Other System Info ====="
Write-Host
Get-CimInstance -ClassName Win32_ComputerSystem

Read-Host "`nPress ENTER to return to the menu" |
    Out-Host