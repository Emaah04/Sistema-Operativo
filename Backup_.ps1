#Backup_.ps1
Param(
    [string]$Path = './app',
    [string]$DestinationPath = './',
    [switch]$PathIsWebApp
)
If ($PathIsWebApp -eq $True) {
    Try {
        $ContainsApplicationFiles = "$((Get-ChildItem $Path).Extension | Sort-Object -Unique)" -match '\.js|\.html|\.css'
        If ( -Not $ContainsApplicationFiles) {
            Throw "No es una app web"
        }
        Else {
            Write-Host "Archivos fuentes se ven bien, continuando"
        }
    }
    Catch {
        Throw "No se ha creado el respaldo debido a: $($_.Exception.Message)"
    }
}
If (-Not (Test-Path $Path)) {
    Throw "El directorio fuente $Path no existe, por favor específique uno existente"
}
$date = Get-Date -format "yyyy-MM-dd"
$DestinationFile = "$($DestinationPath + 'backup-' + $date + '.zip')"
If (-Not (Test-Path $DestinationFile)) {
    Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup-' + $date)"
    Write-Host "Backup creado en"+ $DestinationPath
}
else {
    Write-Error "Ya existe un respaldo para hoy"
}