# Practice 1
$array1 = @(1,2,3)
$array2 = @(4,5,6)

$array3 = for ($i = 0; $i -lt $array1.Length; $i++) {
    $array1[$i] + $array2[$i]
}

Write-Host "Array1: $array1"
Write-Host "Array2: $array2"
Write-Host "Array3 (Sum): $array3"