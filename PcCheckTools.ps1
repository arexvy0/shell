# PowerShell-Skript: PC-Check-Tools Downloader

# Download-Links (URLs + optional festgelegter Dateiname)
$downloads = @(
    @{ Url = "https://github.com/winsiderss/si-builds/releases/download/3.2.25228.309/systeminformer-3.2.25228.309-canary-setup.exe" },
    @{ Url = "https://www.nirsoft.net/utils/winprefetchview-x64.zip" },
    @{ Url = "https://www.nirsoft.net/utils/usbdrivelog.zip" },
    @{ Url = "https://www.nirsoft.net/utils/executedprogramslist.zip" },
    @{ Url = "https://www.nirsoft.net/utils/opensavefilesview-x64.zip" },
    @{ Url = "https://www.nirsoft.net/utils/lastactivityview.zip" },
    @{ Url = "https://dl.echo.ac/tool/journal"; OpenBrowser = $true },   # wird im Browser geöffnet
    @{ Url = "https://dl.echo.ac/tool/bam"; OpenBrowser = $true },       # wird im Browser geöffnet
    @{ Url = "https://download.ericzimmermanstools.com/net6/AmcacheParser.zip" },
    @{ Url = "https://accessdata-ftk-imager.software.informer.com/download/?ca81189-3.1.2&t=1755601620"; File = "FTK-Imager-Setup.exe" },
    @{ Url = "https://www.voidtools.com/Everything-1.4.1.1028.x64-Setup.exe" },
    @{ Url = "https://github.com/Zack-src/Service-Execution/releases/download/1.0/Service-Execution.exe" },
    @{ Url = "https://www.nirsoft.net/utils/registrychangesview-x64.zip" },
    @{ Url = "https://www.nirsoft.net/utils/regscanner-x64.zip" },
    @{ Url = "https://www.nirsoft.net/utils/browsinghistoryview-x64.zip" },
    @{ Url = "https://www.nirsoft.net/utils/resourcesextract-x64.zip" },
    @{ Url = "https://www.nirsoft.net/utils/usbdrivelog.zip" },
    @{ Url = "https://www.nirsoft.net/utils/previousfilesrecovery-x64.zip" },
    @{ Url = "https://www.nirsoft.net/utils/shellbagsview.zip" }
)

Write-Host "Möchten Sie alle PC-Check-Tools herunterladen?"
Write-Host "Drücken Sie [Enter] zum Bestätigen oder [Strg + C] zum Abbrechen."
[void][System.Console]::ReadLine()

# Download-Ordner festlegen (z. B. Downloads-Ordner des Benutzers)
$downloadPath = "$env:USERPROFILE\Downloads\PC-Check-Tools"
if (-not (Test-Path $downloadPath)) {
    New-Item -ItemType Directory -Path $downloadPath | Out-Null
}

# Dateien herunterladen
foreach ($item in $downloads) {
    $url = $item.Url

    if ($item.ContainsKey("OpenBrowser") -and $item.OpenBrowser) {
        Write-Host "`nÖffne im Browser: $url" -ForegroundColor Yellow
        Start-Process $url
        Start-Sleep 5
        Write-Host "Bitte prüfen Sie den Standard-Download-Ordner auf die Datei." -ForegroundColor Green
    }
    else {
        # Wenn kein Dateiname manuell angegeben ist, aus URL ermitteln
        if ($item.ContainsKey("File")) {
            $fileName = $item.File
        } else {
            $fileName = Split-Path $url -Leaf
            if (-not $fileName) {
                $fileName = "download_" + [guid]::NewGuid().ToString() + ".bin"
            }
        }

        $targetFile = Join-Path $downloadPath $fileName

        Write-Host "Lade herunter: $url -> $targetFile"
        try {
            Invoke-WebRequest -Uri $url -OutFile $targetFile -UseBasicParsing
            Write-Host "✅ Erfolgreich heruntergeladen: $fileName"
        }
        catch {
            Write-Host "❌ Fehler beim Herunterladen von $url"
        }
    }
}

Write-Host "`nAlle Downloads abgeschlossen!"
Write-Host "Dateien befinden sich in: $downloadPath"
