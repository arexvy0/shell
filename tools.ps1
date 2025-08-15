Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
$downloadFolder = "$env:USERPROFILE\Desktop\Pc Check"
if (-not (Test-Path -Path $downloadFolder)) {
    New-Item -ItemType Directory -Path $downloadFolder | Out-Null
}

$urls = @{
    "1" = "https://www.nirsoft.net/utils/registrychangesview-x64.zip"
    "2" = "https://www.nirsoft.net/utils/usbdrivelog.zip"
    "3" = "https://www.nirsoft.net/utils/shexview-x64.zip"
    "4" = "https://www.nirsoft.net/utils/jumplistsview.zip"
    "5" = "https://e5hforensics.com/wp-content/uploads/2023/03/USB-Forensic-Tracker-v1.1.3.zip"
    "6" = "https://www.nirsoft.net/utils/recentfilesview.zip"
    "7" = "https://www.nirsoft.net/utils/lastactivityview.zip"
    "8" = "https://www.nirsoft.net/utils/opensavefilesview-x64.zip"
    "9" = "https://www.nirsoft.net/utils/simpleprogramdebugger-x64.zip"
    "10" = "https://www.nirsoft.net/utils/resourcesextract-x64.zip"
    "11" = "https://www.nirsoft.net/utils/regscanner-x64.zip"
    "12" = "https://www.nirsoft.net/utils/previousfilesrecovery-x64.zip"
    "13" = "https://github.com/winsiderss/si-builds/releases/download/3.2.25225.2244/systeminformer-3.2.25225.2244-canary-setup.exe"
    "14" = "https://www.nirsoft.net/utils/winprefetchview-x64.zip"
}

while ($true) {
    Write-Host "Bitte wählen Sie eine der folgenden Optionen, um ein Programm herunterzuladen:"
    Write-Host "1) RegistryChangesView"
    Write-Host "2) USBDriveLog"
    Write-Host "3) ShellExView"
    Write-Host "4) JumpList"
    Write-Host "5) USBForensicLookup"
    Write-Host "6) RecentFilesView"
    Write-Host "7) LastActivityView"
    Write-Host "8) OpenSavedFilesView"
    Write-Host "9) SimpleProgramDebugger"
    Write-Host "10) ResourceExtractor"
    Write-Host "11) RegScanner"
    Write-Host "12) PreviousFiles"
    Write-Host "13) System Informer"
    Write-Host "14) WinPrefetchView"
    Write-Host "q) Beenden"

    $selection = Read-Host "Ihre Auswahl"

    if ($selection -eq "q") {
        break
    } elseif ($urls.ContainsKey($selection)) {
        $url = $urls[$selection]
        $fileName = Split-Path $url -Leaf
        $outputPath = Join-Path $downloadFolder $fileName
        Write-Host "Herunterladen von $fileName..."
        Invoke-WebRequest -Uri $url -OutFile $outputPath
        Write-Host "Download abgeschlossen: $outputPath"
    } else {
        Write-Host "Ungültige Auswahl. Bitte erneut versuchen."
    }
}




