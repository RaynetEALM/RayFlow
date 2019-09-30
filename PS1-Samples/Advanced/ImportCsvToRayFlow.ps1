## Module RayFlow is required, see readme.md for more details

## Replace with your values
$pathToCSV = '<csv_file_full_path>'
$csvDelimeter = ';'

$rayflowUrl = 'https://<rayflow-server-url>:<port>/<instance>'
$rayflowUser = '<your-user-name>'
$rayflowPass = '<your-password>'
$rayflowProjectName = '<your-project-name>'

#Defaults
$category = '<app-category>'
$schedule = '<app-schedule>'
$type = '<app-type>'

#Import CSV
$csvObjects = Import-CSV -Path $pathToCSV -Delimiter $csvDelimeter

#Connect to RayFlow
$rayflowCredential = Get-RayFlowCredentials -UserName $rayflowUser -PlainTextPassword $rayflowPass
$rayflowProject = Get-RayFlowProject -ProjectName $rayflowProjectName -RayFlowServerUrl $rayflowUrl -Credentials $rayflowCredential 

foreach ($package in $csvObjects) {
    Write-Progress -Activity "Processing task [$package.ApplicationName]...";
    $rayflowOrder = New-RayFlowOrder -Project $rayflowProject -Category $category -Schedule $schedule -Type $type -Datafields $package
    Publish-RayFlowOrder -Order $rayflowOrder    
}
