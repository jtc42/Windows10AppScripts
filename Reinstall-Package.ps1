$AppName = Read-Host -Prompt "Enter a package name"

$AppPath = @()
$AppPath += Get-ChildItem 'C:\Program Files\WindowsApps\' -Filter "*$AppName*x86*" | Select -ExpandProperty FullName
$AppPath += Get-ChildItem 'C:\Program Files\WindowsApps\' -Filter "*$AppName*x64*" | Select -ExpandProperty FullName

Add-AppxPackage -DisableDevelopmentMode -Register "$AppPath\AppxManifest.xml"