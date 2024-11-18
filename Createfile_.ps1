#Createfile_.ps1
Param(
    $Path
)
If (-Not $Path -eq '') {
    New-Item $Path
    Write-Host "Archivo fue creado en la ruta $Path"
}
Else {
    Write-Error "Ruta no puede estar vacío"
}