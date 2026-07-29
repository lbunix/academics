$total = 0

for ($num = 1; $num -le 20
     $num++) {

    if ($num % 2 -eq 0) {
        Write-Host $num
        $total = $total + $num
    }
}

Write-Host "The sum of the even numbers is: $total"
