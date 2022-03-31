$srcDir = ".\nvim"
$dstDir = "$($env:LOCALAPPDATA)\nvim"
Write-Host "Copying $srcDir to $dstDir"
Invoke-Expression "xcopy $srcDir $dstDir /S /Y"
Write-Host "Done!"

# TODO: set NEOVIDE_MULTIGRID=1 env var