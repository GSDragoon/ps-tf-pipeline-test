# Package the PowerShell module(s) to a local repository

$repoName = 'local'
$powershellDir = "${pwd}\PowerShell"
$publishDir = "${powershellDir}\bin"
$date = Get-Date
$versionPrefix = "$($date.Year).$($date.Month).$($date.Day)"
$versionSuffix = "-dev0"

# https://docs.github.com/en/actions/learn-github-actions/variables#default-environment-variables
if ($Env:GITHUB_RUN_ATTEMPT)
{
  $versionSuffix = $Env.GITHUB_RUN_ATTEMPT
}

$Env:PSModulePath += ";$powershellDir"
New-Item -ItemType Directory -Path $publishDir -Force | Out-Null


Register-PSRepository -Name $repoName -SourceLocation $publishDir -InstallationPolicy Trusted


Get-ChildItem -Path $powershellDir -Directory -Exclude 'bin' -Name | ForEach-Object {
  Write-Output "Publishing module: $_"
  Update-ModuleManifest -Path "$powershellDir/$_/$_.psd1" -ModuleVersion $versionPrefix -Prerelease $versionSuffix
  Publish-Module -Name $_ -Repository $repoName -Exclude '*.Tests.ps1'
}
