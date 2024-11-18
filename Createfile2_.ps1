Param(
    [Parameter(Mandatory, HelpMessage = 'Debe ingresar  un nombre de archivo para crearlo en variaarble Path')]
    $Path
)
New-Item $Path
Write-Host "Archivo fue creado en la ruta $Path"