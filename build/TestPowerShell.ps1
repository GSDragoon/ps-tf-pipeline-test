# Test the PowerShell module(s) using Pester

$powershellDir = "${pwd}\PowerShell"

# https://pester.dev/docs/commands/New-PesterConfiguration
$config = New-PesterConfiguration
$config.Run.Path = $powershellDir
$config.Run.Exit = $true
$config.Run.Throw = $true
$config.Output.Verbosity = 'Detailed'
$config.TestResult.Enabled = $true
$config.TestResult.OutputFormat = 'JUnitXml'
$config.TestResult.OutputPath = "$powershellDir\bin\TestResults.junit.xml"

# https://pester.dev/docs/commands/Invoke-Pester
Invoke-Pester -Configuration $config
