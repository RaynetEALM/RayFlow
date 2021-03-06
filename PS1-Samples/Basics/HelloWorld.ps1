## Module RayFlow is required, see readme.md for more details

## Replace with your values
$url = 'https://<rayflow-server-url>:<port>/<instance>';

## If you do not want to enter plain text password here, you can skip creation of credentials object and call the subsequent commands
## without credentials. You will be asked interactively to provide them.
$userName = '<your-user-name>';
$password = '<your-password>';

$cred = Get-RayFlowCredentials -UserName $userName -PlainTextPassword $password;

$projects = Get-RayFlowProject -RayFlowServerUrl $url -Credentials $cred;

Write-Host "Hello world, your instance seems to have the following projects:";
Write-Host $projects | Format-List;