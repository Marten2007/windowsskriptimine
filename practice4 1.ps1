# Practice 4 i
$num1 = [double](Read-Host "Enter first number")
$num2 = [double](Read-Host "Enter second number")

if ($num1 -gt $num2) {
    Write-Host "The higher number is $num1"
}
else {
    Write-Host "The higher number is $num2"
}