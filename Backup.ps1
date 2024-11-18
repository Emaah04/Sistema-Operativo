#Backup.ps1
Param(
    [string]$Path = './app',
    [string]$DestinationPath = './'
)
try {
    If (-Not (Test-Path $Path)) {
        Throw "El directorio fuente $Path no existe, por favor específique uno existente"
    }
    $date = Get-Date -format "yyyy-MM-dd"
    $DestinationFile = "$($DestinationPath + 'backup-' + $date + '.zip')"
    If (-Not (Test-Path $DestinationFile)) {
        Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup-' + $date)"
        Write-Host "Backup creado en"+ $DestinationPath
    }
}
catch {
    Write-Error "Ya existe un respaldo para hoy"
}
