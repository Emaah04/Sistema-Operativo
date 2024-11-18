# Createfile.ps1
param(
    $Path
)
New-Item $Path #Crea un nuevo arvhivo en $Path
Write-Host "Archivo $Path fue creado"
