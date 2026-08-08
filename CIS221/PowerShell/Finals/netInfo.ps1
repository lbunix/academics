clear

Write-Host "===== Network Information ====="
Get-CimInstance -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=$true |
    Select-Object -ExpandProperty IPAddress

Get-CimInstance -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=$true |
    Select-Object -ExcludeProperty IPX*,WINS*

Get-NetAdapter |
    Format-Table Name, Status, LinkSpeed, MacAddress

Read-Host "`nPress ENTER to return to the menu" |
    Out-Host