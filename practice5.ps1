# -------------------------------
# i) Ava kaks Notepadi ja kuva nende Process ID
# -------------------------------

# Avame kaks Notepadi instantsi
Start-Process notepad
Start-Process notepad

# Väike paus, et protsessid jõuaksid käivituda
Start-Sleep -Seconds 2

# Kuvame Notepadi protsessid (Process Name ja Id)
Get-Process notepad | Select-Object ProcessName, Id


# -------------------------------
# ii) Kausta loomine ja failidega töötamine
# -------------------------------

# Määrame kausta tee
$folderPath = "C:\Temp\Test"

# Loome kausta (kui seda pole olemas)
if (-not (Test-Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory
}

# Loome näidisfailid
New-Item "$folderPath\Notepad1.txt" -ItemType File
New-Item "$folderPath\Notepad2.txt" -ItemType File
New-Item "$folderPath\SampleFile.csv" -ItemType File

# -------------------------------
# Kuvame kõik failid kaustas
# -------------------------------

Get-ChildItem $folderPath


# -------------------------------
# Leiame ainult CSV faili ja kuvame selle suuruse
# -------------------------------

$csvFile = Get-ChildItem $folderPath -Filter "*.csv"

# Faili suurus baitides
$sizeBytes = $csvFile.Length

# Teisendame KB ja MB
$sizeKB = $sizeBytes / 1KB
$sizeMB = $sizeBytes / 1MB

# Kuvame tulemuse samas stiilis nagu ekraanipildil
Write-Host ""
Write-Host "FileName : $($csvFile.Name)"
Write-Host "Size in KB : $sizeKB"
Write-Host "Size in MB : $sizeMB"