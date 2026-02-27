# Practice 4 ii
Write-Host "1. Estonia"
Write-Host "2. Finland"
Write-Host "3. Sweden"

$choice = Read-Host "Select country (1-3)"

switch ($choice) {
    1 { Write-Host "Capital is Tallinn" }
    2 { Write-Host "Capital is Helsinki" }
    3 { Write-Host "Capital is Stockholm" }
    default { Write-Host "Invalid selection" }
}
