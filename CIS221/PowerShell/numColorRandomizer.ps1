$colors = "red", "blue", "green", "yellow", "purple", "brown", "pink", "white", "black"

$numSelect = Read-Host "Choose a number between 1 - 3 and recieve the amount of different colors based on your choice."

switch ($numSelect)
{
    1 { $single = Get-Random -InputObject $colors -Count 1 
        Write-Host $single
    }

    2 { $double = Get-Random -InputObject $colors -Count 2 
        Write-Host $double
    }
    3 { $triple = Get-Random -InputObject $colors -Count 3 
        Write-Host $triple
    }
    Default { Write-Host "Incorrect input." }
}
