function ShowMenu {
    param (
        $title = 'Network Tools'
    )

    Clear-Host

    Write-Host "===== $title ====="
    Write-Host "1. Run Traceroute"
    Write-Host "2. Local IP address configurations"
    Write-Host "3. Eth health & speeds"
    Write-Host "4. Ping a domain"
    Write-Host "5. Quit the menu"

}

$quit = "no"

while ($quit -ne "yes") {

    ShowMenu
    $select = Read-Host "Select a number from the list."
    switch ($select) {

        1 {$target = Read-Host "What domain would you like to traceroute? "
           Test-NetConnection -ComputerName $target -TraceRoute
        }
        
        2 {Get-NetIPConfiguration}

        3 {Get-NetAdapter | 
           Format-Table Name, Status, LinkSpeed, MacAddress
        }

        4 {$target = Read-Host "What domain would you like to ping? "
           Test-NetConnection -ComputerName $target
        }

        5 {Write-Host "Ending session."
           $quit = "yes"
        
        }

        Default {Write-Host "Incorrect input."}
    }

    if ($quit -ne "yes") {
        Read-Host "Press ENTER to return to the menu" | Out-Null
    }
}
