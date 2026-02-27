# Practice 9
$count = 0

do {
    if (Get-Process notepad -ErrorAction SilentlyContinue) {
        Write-Host "Notepad is running"
        $count++
        Start-Sleep -Seconds 1
    }
}
while (Get-Process notepad -ErrorAction SilentlyContinue)

Write-Host "Displayed $count times"