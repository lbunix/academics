function ShowMenu {
    param (
        $title = 'Random Commands'
    )

    Clear-Host

    Write-Host "===== $title ====="
    Write-Host "`n1. Display your hostname"
    Write-Host "2. List active apps & background processes"
    Write-Host "3. Open Network Tools"
    Write-Host "4. Display commands"
    Write-Host "5. Quit the menu"

}

$quit = "no"

while ($quit -ne "yes") {
    ShowMenu

    $select = Read-Host "`nSelect a number from the list"
    switch ($select) {

        1 {$hostName = $env:COMPUTERNAME
           Write-Host "The hostname of this machine is: $hostName"
        }

        2 {Get-Process |
           select -First 10
        }

        3 {& 'C:\Users\student\Documents\CIS221\LAB 6\netToolsMenu.ps1'}

        4 {Get-Commands}

        5 {Write-Host "`nEnding session."
           $quit = "yes"
        }

        Default {Write-Host "`nIncorrect input."}

    }

    if ($quit -ne "yes") {
        Read-Host "Press ENTER to return to the menu" | Out-Null
    }
}
