# Practice 7
$colors = @("Red","Green","Yellow","Blue")

$students = for ($i=1; $i -le 20; $i++) {
    [PSCustomObject]@{
        RollNumber = $i
        Group = Get-Random $colors
    }
}

$students
