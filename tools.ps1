Write-Host "Bitte wählen Sie eine der folgenden Optionen, um ein Programm herunterzuladen:"
Write-Host "1) RegestryChangesView"
Write-Host "2) USBDriveLog"
Write-Host "3) ShellExView"
Write-Host "4) JumpList"
Write-Host "5) USBForensicLookup"
Write-Host "6) DNSDataView"
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

$selection = Read-Host "Geben Sie die Zahl der Option ein, die Sie herunterladen möchten"

if ($urls.ContainsKey($selection)) {
    $url = $urls[$selection]
    $fileName = Split-Path $url -Leaf
    $outputPath = Join-Path $downloadFolder $fileName
    Write-Host "Herunterladen von $fileName..."
    Invoke-WebRequest -Uri $url -OutFile $outputPath
    Write-Host "Download abgeschlossen: $outputPath"
} else {
    Write-Host "Ungültige Auswahl. Bitte erneut versuchen."
}
