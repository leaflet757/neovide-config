$srcDir = ".\nvim"
$dstDir = "$($env:LOCALAPPDATA)\nvim"

$multiVar = 'NEOVIDE_MULTIGRID'

Write-Host "Copying $srcDir to $dstDir"
Invoke-Expression "xcopy $srcDir $dstDir /S /Y"

if (-not [Environment]::GetEnvironmentVariable($multiVar, 'User'))
{
	Write-Host "Setting env var $multiVar=1"
    [Environment]::SetEnvironmentVariable($multiVar, '1', [EnvironmentVariableTarget]::User)
}

Write-Host "Done!"
