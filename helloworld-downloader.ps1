# ------------------------------------------------------------------
# [Author] Original script for MagpiDownloader from @rubemlrm - https://github.com/joergi/MagPiDownloader
#          adapted by @joergi for HelloWorld Downloader: https://github.com/joergi/HelloWorldDownloader
#          they are downloadable for free under https://helloworld.raspberrypi.org/issues
#          or you can buy the paper issues under: https://store.rpipress.cc/collections/hello-world-magazine
#          this script is under GNU GENERAL PUBLIC LICENSE 3
# ------------------------------------------------------------------

# VERSION=0.1.0
# USAGE="Usage: powershell helloworld-downloader.ps1 [-f firstissue] [-l lastissue]"


Param(
    [string]$f,
    [string]$l
)

# control variables
$i = 1
$baseDir = ($PSScriptRoot)
$issues = Get-Content "$baseDir\regular-issues.txt" -First 1
$baseUrl = "https://www.raspberrypi.org/hello-world/issues/"
$web = New-Object system.net.webclient
$errorCount = 0

# Check if directory dont exist and try create
if (-Not (Test-Path -Path "$baseDir\issues"))
{
    New-Item -ItemType directory -Path "$baseDir\issues"
}


if ($f)
{
    $i = [int]$f
}

if ($l)
{
    $issues = [int]$l
}

do
{
    #start scrapping directory and download files

    $tempCounter = $i

    $fileReponse = ((Invoke-WebRequest -UseBasicParsing "$baseUrl$tempCounter").Links | Where-Object { $_.href -like "*H*W*.pdf" })
    if ($fileReponse)
    {
        try
        {
            $filePath = "$baseDir\issues\HelloWorld_$tempCounter.pdf"
            Invoke-WebRequest $fileReponse.href -OutFile $filePath -ErrorAction Stop
            Write-Verbose -Message "Downloaded $fileReponse.href"
        }
        Catch
        {
            Write-Host $_.Exception | format-list -force
            Write-Host "Ocorred an error trying download " + $fileReponse.download
            $errorCount++
        }
        finally
        {
            # Code to be executed regardless of whether an exception was thrown or not
            if ($errorCount -gt 0)
            {
                exit 1
            }
        }
    }
    $i++
} While ($i -le $issues)


