#guia2_b.ps1
$valor = 0  
if ($valor -le -1) {
    Write-Host "Es negativo"
}
elseif ($valor -eq 0) {
    Write-Host "Es cero"
}
Else {
    Write-Host "Es positivo"
}