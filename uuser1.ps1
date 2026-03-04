# Kontroll, kas skript jookseb administraatorina
if (-not ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {

    Write-Host "VIGA: Käivita PowerShell ISE administraatorina!" -ForegroundColor Red
    exit
}

# Küsi kasutaja andmed
$firstName = Read-Host "Sisesta eesnimi"
$lastName  = Read-Host "Sisesta perenimi"

# Kasutajanimi
$username = ("$firstName.$lastName").ToLower()

$fullName = "$firstName $lastName"
$description = "Lokaalne kasutaja: $fullName"

# Kontroll: kas kasutaja on juba olemas
$existingUser = Get-LocalUser -Name $username -ErrorAction SilentlyContinue

if ($existingUser) {
    Write-Host "VIGA: Kasutaja '$username' on juba olemas!" -ForegroundColor Red
    exit
}

# Parool
$password = ConvertTo-SecureString "Parool1!" -AsPlainText -Force

# Kasutaja loomine
New-LocalUser `
    -Name $username `
    -Password $password `
    -FullName $fullName `
    -Description $description `
    -ErrorAction SilentlyContinue

# Tulemus
if ($?) {
    Write-Host "OK: Kasutaja '$username' loodi edukalt." -ForegroundColor Green
}
else {
    Write-Host "VIGA: Kasutaja loomine ebaõnnestus!" -ForegroundColor Red
}