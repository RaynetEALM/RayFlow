## Module RayFlow is required, see readme.md for more details

## Replace with your values
$rayflowUrl = 'https://<rayflow-server-url>:<port>/<instance>'
$rayflowUser = '<your-user-name>'
$rayflowPass = '<your-password>'
$rayflowProjectName = '<your-project-name>'
$rayflowDatafieldName = '<datafield-name'

#Connect to RayFlow
$rayflowCredential = Get-RayFlowCredentials -UserName $rayflowUser -PlainTextPassword $rayflowPass
$rayflowProject = Get-RayFlowProject -ProjectName $rayflowProjectName -RayFlowServerUrl $rayflowUrl -Credentials $rayflowCredential 

#Get all packages from POA phase
$poaPhase = Get-RayFlowPhase -Project $rayflowProject -PhaseName 'POA'
$poaPackages = Get-RayFlowTask -Phase $poaPhase
$packagesCount = $poaPackages.Count

for ($i = 0; $i -lt $packagesCount; $i++) {
    $appId = $poaPackages[$i].DataFields['AppId'];
    $name = $poaPackages[$i].DataFields['AppName'];
    $version = $poaPackages[$i].DataFields['AppVersion'];

    $packageIdValue = "$appId - $name - $version";
    Write-Progress -Activity "Processing $packageIdValue..." -Status "$($i+1) of $packagesCount"
    Update-RayFlowTaskDataField -Task $poaPackages[$i] -DataField $rayflowDatafieldName -Value $packageIdValue
}