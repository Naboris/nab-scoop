#Requires -Version 5
param(
    [String] $dir = "$PSScriptRoot\..\bucket",
    [Parameter(ValueFromRemainingArguments = $true)]
    [String[]] $remainArgs = @()
)

if (!$env:SCOOP_HOME) { $env:SCOOP_HOME = Resolve-Path (scoop prefix scoop) }
$missing_checkver = "$env:SCOOP_HOME\bin\missing-checkver.ps1"
$remainArgs = ($remainArgs | Select-Object -Unique) -join ' '

Invoke-Expression -command "$missing_checkver -dir $dir $remainArgs"