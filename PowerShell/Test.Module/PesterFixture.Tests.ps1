BeforeAll {
  $RepositoryModuleDirectory = Get-Item -Path (Split-Path -Path $PSScriptRoot -Parent)
  if (!($Env:PSModulePath -like "*${RepositoryModuleDirectory}*"))
  {
    $Env:PSModulePath += ";${RepositoryModuleDirectory}";
  }

  $ModuleNameUnderTest = Split-Path -Path $PSScriptRoot -Leaf
  Get-Module -Name $ModuleNameUnderTest | Remove-Module -Force
  Import-Module -Name $PSScriptRoot

  $ModuleUnderTest = Get-Module -Name $ModuleNameUnderTest
  $ModuleMockParameters = @{ 'ModuleName' = $ModuleNameUnderTest }
}

AfterAll {
  Get-Module -Name $ModuleNameUnderTest | Remove-Module -Force
}
