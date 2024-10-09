Write-Host "Bitte wählen Sie eine der folgenden Optionen, um ein Programm herunterzuladen:"
Write-Host "1) RegestryChangesView"
Write-Host "2) USBDriveLog"
Write-Host "3) ShellExView"
Write-Host "4) JumpList"
Write-Host "5) USBForensicLookup"
Write-Host ""

$urls = @{
    "1" = "https://www.nirsoft.net/utils/registrychangesview-x64.zip"
    "2" = "https://www.nirsoft.net/utils/usbdrivelog.zip"
    "3" = "https://www.nirsoft.net/utils/shexview-x64.zip"
    "4" = "https://www.nirsoft.net/utils/jumplistsview.zip"
    "5" = "https://e5hforensics.com/wp-content/uploads/2023/03/USB-Forensic-Tracker-v1.1.3.zip"
}

$downloadFolder = "$env:USERPROFILE\Desktop\Pc Check"

if (-not (Test-Path -Path $downloadFolder)) {
    New-Item -ItemType Directory -Path $downloadFolder | Out-Null
}

while ($true) {
    $choice = Read-Host "Gebe die jeweilige Zahl für den Download ein (oder drücke 'q' zum Beenden)"

    if ($choice -eq 'q') {
        break
    }

    if ($urls.ContainsKey($choice)) {
        $url = $urls[$choice]
        $fileName = Split-Path $url -Leaf
        $output = "$downloadFolder\$fileName"

        Write-Host "Das Programm wird heruntergeladen..."
        Invoke-WebRequest -Uri $url -OutFile $output

        Write-Host "Download abgeschlossen. Datei gespeichert unter $output"
    } else {
        Write-Host "Ungültige Auswahl. Bitte wähle eine Zahl von 1 bis 5."
    }
}
