# List of junky app names
$AppList = @(
    "Minecraft",
    "3dbuilder",
    "WindowsAlarms",
    "Appconnector",
    "Asphalt8Airborne",
    "WindowsCalculator",
    "windowscommunicationsapps",
    "WindowsCamera",
    "CandyCrushSodaSaga",
    "DrawboardPDF",
    "Facebook",
    "FarmVille2CountryEscape",
    "WindowsFeedbackHub",
    "officehub",
    "Microsoft.SkypeApp",
    "Getstarted",
    "ZuneMusic",
    "WindowsMaps",
    "Messaging",
    "MicrosoftSolitaireCollection",
    "Wallet",
    "ConnectivityStore",
    "bingfinance",
    "ZuneVideo",
    "BingNews",
    "OneConnect",
    "Microsoft.People",
    "CommsPhone",
    "Microsoft.SkypeApp",
    "windowsphone",
    "bingsports",
    "bingweather",
    "HolographicFirstRun",
    "XboxApp"
    "Microsoft.YourPhone"
)

"Scanning for first-party apps..."

# Set up empty array to store installed matched apps
$InstalledList = @()

# For each app in the junk list
foreach ($AppID in $AppList) {
    $a = Get-AppxPackage -Name "*$AppID*"  # Find appx object
    If ($a.Name) {  # If it's installed (i.e. name isn't empty)
        $InstalledList += $a  # Add it to the list of installed apps
    }
}

# Print a list of apps, and their array indices
foreach ($a in $InstalledList) {
    $name = $a.Name
    $index = $InstalledList.IndexOf($a)
    "$index : $name"
}

# Prompt user for app index
[uint16]$number = Read-Host -Prompt 'Enter a number'

$App = $InstalledList[$number]
$AppName = $app.Name
If ($AppName) {
    $reply = Read-Host -Prompt "Remove $AppName ? [y/n]"
    If ( $reply -match "[yY]" ) { 
        Get-AppxPackage -Name *$AppName* | Remove-AppxPackage
    }
}
Else {
    "No app found. Exiting."
}