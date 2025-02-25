$downloadFolder = "$env:USERPROFILE\Downloads"
$output = Join-Path $downloadFolder "tools.ps1"
$url = "https://raw.githubusercontent.com/arexvy0/shell/main/tools.ps1"

Invoke-WebRequest -Uri $url -OutFile $output

Write-Host "Datei wurde erfolgreich heruntergeladen: $output"