. "$PSScriptRoot\PesterFixture.Tests.ps1"

Describe 'Start-Work' {
  It 'Should return 1'{
    Start-Work | Should -Be 1
  }
}

Describe 'Stop-Work' {
  It 'Should return 2' {
    Stop-Work | Should -Be 2
  }
}
