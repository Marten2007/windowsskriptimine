# Practice 6 - CSV loomine
$data = @(
    [PSCustomObject]@{Name="John"; Age=8}
    [PSCustomObject]@{Name="Joe"; Age=12}
    [PSCustomObject]@{Name="Mary"; Age=7}
    [PSCustomObject]@{Name="Tom"; Age=15}
    [PSCustomObject]@{Name="Lily"; Age=16}
    [PSCustomObject]@{Name="Emily"; Age=9}
)

$path = "C:\Temp\students.csv"
$data | Export-Csv $path -NoTypeInformation

# Import ja kooliastme määramine
$students = Import-Csv $path

$result = foreach ($student in $students) {
    $age = [int]$student.Age

    if ($age -ge 4 -and $age -le 10) {
        $school = "Junior"
    }
    elseif ($age -ge 11 -and $age -le 17) {
        $school = "Senior"
    }

    [PSCustomObject]@{
        Name = $student.Name
        School = $school
    }
}

$result | Export-Csv "C:\Temp\students_school.csv" -NoTypeInformation
