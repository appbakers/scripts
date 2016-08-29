param (
        [string]$master= 'http://localhost:8080/',
        [string]$username= 'jenkins',
        [string]$password= 'jenkins',
        [string]$labels= "master=$master"
)
Write-Output "-labels: $labels"


$url = 'http://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar'
$storageDir = $pwd
$filename = $url.Substring($url.LastIndexOf("/") + 1);
$file = "$storageDir\$filename"

if( -Not (Test-Path $filename) ) {
 $client = New-Object System.Net.WebClient;
 $client.DownloadFile($url, $file);
}

cmd.exe /c java -jar $file -master $master -username $username -password $password -labels $labels
