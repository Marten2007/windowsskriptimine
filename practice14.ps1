
# Practice 14 – Kokkuvõttev ülesanne

$reportFile = "report.txt"

# Tühjendame faili
"" | Out-File -FilePath $reportFile

# Funktsioon: salvestab faili
function Save-ToFile {
    param (
        [string]$Text
    )
    $Text | Out-File -FilePath $reportFile -Append
}

# 1. Kasutaja sisend

Write-Host "KASUTAJA SISEND" -ForegroundColor Yellow
Save-ToFile "KASUTAJA SISEND"

$name = Read-Host "Sisesta oma nimi"
$count = Read-Host "Mitu korda tervitust kuvada"

Save-ToFile "Nimi: $name"
Save-ToFile "Kordade arv: $count"
Save-ToFile ""

# 2. Tsükkel

Write-Host "`nTERVITUSED" -ForegroundColor Green
Save-ToFile "TERVITUSED"

for ($i = 1; $i -le [int]$count; $i++) {
    Write-Host "Tere, $name! ($i)" -ForegroundColor Green
    Save-ToFile "Tere, $name! ($i)"
}

Save-ToFile ""

# 3. Süsteemiinfo

Write-Host "`nSÜSTEEMIINFO" -ForegroundColor Cyan
Save-ToFile "SÜSTEEMIINFO"

Write-Host "Arvuti nimi: $env:COMPUTERNAME" -ForegroundColor Cyan
Write-Host "Kasutaja: $env:USERNAME" -ForegroundColor Cyan
Write-Host "PowerShelli versioon: $($PSVersionTable.PSVersion)" -ForegroundColor Cyan

Save-ToFile "Arvuti nimi: $env:COMPUTERNAME"
Save-ToFile "Kasutaja: $env:USERNAME"
Save-ToFile "PowerShelli versioon: $($PSVersionTable.PSVersion)"
Save-ToFile ""

# 4. Cmdlet'id

Write-Host "`nPROTSESSID" -ForegroundColor Magenta
Save-ToFile "PROTSESSID"

Get-Process | Select-Object -First 3 | ForEach-Object {
    Write-Host $_.Name -ForegroundColor Magenta
    Save-ToFile $_.Name
}

Write-Host "`nTEENUSED" -ForegroundColor Magenta
Save-ToFile ""
Save-ToFile "TEENUSED"

Get-Service | Select-Object -First 3 | ForEach-Object {
    Write-Host "$($_.Name) - $($_.Status)" -ForegroundColor Magenta
    Save-ToFile "$($_.Name) - $($_.Status)"
}

Save-ToFile ""

# 5. Tingimuslause

if ($PSVersionTable.PSVersion.Major -lt 5) {
    Write-Host "HOIATUS: PowerShelli versioon on alla 5!" -ForegroundColor Red
    Save-ToFile "HOIATUS: PowerShelli versioon on alla 5!"
}
else {
    Write-Host "PowerShelli versioon on sobiv." -ForegroundColor Green
    Save-ToFile "PowerShelli versioon on sobiv."
}

Save-ToFile ""

# 6. Lõppteade

Write-Host "===========================" -ForegroundColor Cyan
Write-Host "Script finished successfully" -ForegroundColor Red
Write-Host "===========================" -ForegroundColor Cyan

Save-ToFile "==========================="
Save-ToFile "Script finished successfully"
Save-ToFile "==========================="