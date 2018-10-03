$GameList = @(
    "Minecraft",
    "Asphalt8Airborne",
    "CandyCrushSodaSaga",
    "FarmVille2CountryEscape",
    "MicrosoftSolitaireCollection"
)

$reply = Read-Host -Prompt "Remove pre-loaded games? [y/n]"
if ( $reply -match "[yY]" ) { 
    foreach ($App in $GameList) {
        Get-AppxPackage -Name *$App* | Remove-AppxPackage
    }
}

$AppList = @(
    "DrawboardPDF",
    "Facebook",
    "Netflix",
    "PandoraMediaInc",
    "Twitter"
)

$reply = Read-Host -Prompt "Remove third-party apps? [y/n]"
if ( $reply -match "[yY]" ) { 
    foreach ($App in $AppList) {
        Get-AppxPackage -Name *$App* | Remove-AppxPackage
    }
}