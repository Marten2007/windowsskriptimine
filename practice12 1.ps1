function Count-Services {
    $running = (Get-Service | Where-Object {$_.Status -eq "Running"}).Count
    $stopped = (Get-Service | Where-Object {$_.Status -eq "Stopped"}).Count

    Write-Host "Total services in running state = $running"
    Write-Host "Total services in stopped state = $stopped"
}

Count-Services
