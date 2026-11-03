Import-Module WebAdministration

$siteName = "EHR"

$physicalPath = "C:\Deploy\EHR"

if (!(Test-Path $physicalPath))
{
    New-Item -ItemType Directory -Path $physicalPath
}

if (!(Get-Website -Name $siteName -ErrorAction SilentlyContinue))
{
    New-Website `
    -Name $siteName `
    -Port 8080 `
    -PhysicalPath $physicalPath
}

Write-Host "IIS Site Created"