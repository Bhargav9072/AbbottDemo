Write-Host "======================================="
Write-Host "Checking Prerequisites"
Write-Host "======================================="

# Git
try {
    $gitVersion = git --version 2>$null
    Write-Host "[Installed] Git : $gitVersion"
}
catch {
    Write-Host "[Not Installed] Git"
}

# Node
try {
    $nodeVersion = node --version 2>$null
    Write-Host "[Installed] Node.js : $nodeVersion"
}
catch {
    Write-Host "[Not Installed] Node.js"
}

# NPM
try {
    $npmVersion = npm --version 2>$null
    Write-Host "[Installed] NPM : $npmVersion"
}
catch {
    Write-Host "[Not Installed] NPM"
}

# IIS
try {
    $iis = Get-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole -ErrorAction SilentlyContinue

    if ($iis.State -eq "Enabled")
    {
        Write-Host "[Installed] IIS"
    }
    else
    {
        Write-Host "[Not Installed] IIS"
    }
}
catch {
    Write-Host "[Not Installed] IIS"
}

# Visual Studio Build Tools
$msbuildPaths = @(
    "C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe",
    "C:\Program Files\Microsoft Visual Studio\2022\Professional\MSBuild\Current\Bin\MSBuild.exe",
    "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin\MSBuild.exe",
    "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\MSBuild\Current\Bin\MSBuild.exe"
)

$msbuildInstalled = $false

foreach($path in $msbuildPaths)
{
    if(Test-Path $path)
    {
        $msbuildInstalled = $true
        Write-Host "[Installed] MSBuild : $path"
        break
    }
}

if(!$msbuildInstalled)
{
    Write-Host "[Not Installed] MSBuild / Visual Studio Build Tools"
}

# .NET Framework 4.7+
try
{
    $release = Get-ItemProperty `
        -Path "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" `
        -Name Release `
        -ErrorAction SilentlyContinue

    if($release.Release)
    {
        Write-Host "[Installed] .NET Framework v4.x"
    }
    else
    {
        Write-Host "[Not Installed] .NET Framework 4.7+"
    }
}
catch
{
    Write-Host "[Not Installed] .NET Framework 4.7+"
}

Write-Host ""
Write-Host "======================================="
Write-Host "Prerequisite Check Completed"
Write-Host "======================================="