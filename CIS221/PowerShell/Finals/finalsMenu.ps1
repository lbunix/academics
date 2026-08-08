function mainMenu {
    param (
        $title = 'CIS221 FINALS Menu'
    )

    Write-Host "`n========== $title =========="
    Write-Host "`n1) CSV Importer"
    Write-Host "2) System Information"
    Write-Host "3) Network Information"
    Write-Host "4) Storage Information"
    Write-Host "5) Failed login attempt viewer"
    Write-Host "6) Quit menu"

}

function csvImporter {
    Clear-Host
            
    $ipList = Import-CSV "C:\Users\student\Documents\CIS221\FINAL\IPAddress.csv"

    $result = foreach ($item in $ipList) {
        $ip = $item.IPAddress

        Test-Connection $ip -Count 2
    }

    $result | Format-Table -AutoSize

    Read-Host "Press ENTER to return to the menu" |
        Out-Null

    Clear-Host
}

function failedLoginFinder {
    Clear-host

    Write-Host "===== Recent Failed Logins ====="

    $failedLogins = Get-WinEvent -FilterHashtable @{
        LogName = 'Security'
        Id = 4625
    } -MaxEvents 10 | Select-Object TimeCreated, Id, Message

    Read-Host "`nPress ENTER to return to the menu" |
        Out-Null
}

$quit = "no"

while ($quit -ne "yes") {

    Clear-Host

    mainMenu

    $select = Read-Host "`nSelect an option (number) from the menu"

    switch ($select) {
        1 {

           csvImporter

        }
        
        2 {

            & "C:\Users\student\Documents\CIS221\FINAL\systemInfo.ps1"

        }

        3 {

           & "C:\Users\student\Documents\CIS221\FINAL\netInfo.ps1"
        
        }

        4 {

           & "C:\Users\student\Documents\CIS221\FINAL\diskInfo.ps1"

        }

        5 {
           
           failedLoginFinder
        
        }

        6 {
           Write-Host "`nEnding session."
           $quit = "yes"

        }

        Default {
            Write-Host "`nIncorrect input."
        }
        

    }
}
