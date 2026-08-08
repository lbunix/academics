clear

Write-Host "===== Storage Info ====="
Write-Host

Get-CimInstance Win32_LogicalDisk |
    Select-Object DeviceID,
        @{Name="Size (GB)"; Expression={[math]::Round($_.Size / 1GB, 2)}},
        @{Name="Free (GB)"; Expression={[math]::Round($_.FreeSpace / 1GB, 2)}}

Read-Host "`nPress ENTER to return to the menu" |
    Out-Null