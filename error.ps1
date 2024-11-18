Try {
    Get-Content './file.txt' -ErrorAction Stop
}
Catch {
    Write-Error "Archivo no ha sido encontrado"
}
