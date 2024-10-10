Write-Host "Bitte wählen Sie eine der folgenden Optionen, um ein Programm herunterzuladen:"
Write-Host "1) RegistryChangesView"
Write-Host "2) USBDriveLog"
Write-Host "3) ShellExView"
Write-Host "4) JumpList"
Write-Host "5) USBForensicLookup"
Write-Host "6) DNSDataView"
Write-Host "q) Beenden"
Write-Host ""

$urls = @{
    "1" = "https://www.nirsoft.net/utils/registrychangesview-x64.zip"
    "2" = "https://www.nirsoft.net/utils/usbdrivelog.zip"
    "3" = "https://www.nirsoft.net/utils/shexview-x64.zip"
    "4" = "https://www.nirsoft.net/utils/jumplistsview.zip"
    "5" = "https://e5hforensics.com/wp-content/uploads/2023/03/USB-Forensic-Tracker-v1.1.3.zip"
    "6" = "https://www.nirsoft.net/utils/dnsdataview.zip"
}

$downloadFolder = "$env:USERPROFILE\Desktop\Pc Check"

if (-not (Test-Path -Path $downloadFolder)) {
    New-Item -ItemType Directory -Path $downloadFolder | Out-Null
}

do {
    $selection = Read-Host "Geben Sie die Zahl der Option ein, die Sie herunterladen möchten (oder 'q' zum Beenden)"

    if ($selection -eq 'q') {
        Write-Host "Programm wird beendet."
        break
    }

    if ($urls.ContainsKey($selection)) {
        $url = $urls[$selection]
        $fileName = Split-Path $url -Leaf
        $outputPath = Join-Path $downloadFolder $fileName
        Write-Host "Herunterladen von $fileName..."
        
        try {
            Invoke-WebRequest -Uri $url -OutFile $outputPath -ErrorAction Stop
            Write-Host "Download abgeschlossen: $outputPath"
        } catch {
            Write-Host "Fehler beim Herunterladen von $fileName. Überprüfen Sie die URL oder Ihre Internetverbindung."
        }
    } else {
        Write-Host "Ungültige Auswahl. Bitte erneut versuchen."
    }

} while ($true)
