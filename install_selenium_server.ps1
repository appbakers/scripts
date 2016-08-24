function LogWrite {
   Param ([string]$logstring)
   $now = Get-Date -format s
   Add-Content $Logfile -value "$now $logstring"
   Write-Host $logstring
}
 
$Logfile = "C:\Windows\Temp\selenium-install.log"
 
$source = "http://selenium-release.storage.googleapis.com/2.46/selenium-server-standalone-2.46.0.jar"
$destination = "C:\Windows\Temp\selenium-server.jar"
LogWrite 'Starting to download selenium file.'
try {
  (New-Object System.Net.WebClient).DownloadFile($source, $destination)
} catch [Exception] {
  LogWrite "Exception during download. Probable cause could be that the directory or the file didn't exist."
  LogWrite '$_.Exception is' $_.Exception
}
LogWrite 'Download done. Checking if file exists.'
if (!(Test-Path $destination)) {
  LogWrite 'Downloading dotnet Failed!'
} else {
  LogWrite 'Download successful.'
}
 
LogWrite 'All done. Goodbye.'
