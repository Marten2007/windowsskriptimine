# Practice 2
$hashtable1 = @{
    John = 12
    Joe  = 20
    Mary = 18
}

$hashtable2 = @{
    John = 100
    Joe  = 120
    Mary = 150
}

$hashtable3 = @{}

foreach ($name in $hashtable1.Keys) {
    $hashtable3[$name] = $hashtable1[$name] * $hashtable2[$name]
}

$hashtable3
