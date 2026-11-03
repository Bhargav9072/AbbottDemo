$repoUrl = "https://github.com/company/project.git"
$targetPath = "C:\Projects"

if (!(Test-Path $targetPath))
{
    New-Item -ItemType Directory -Path $targetPath
}

cd $targetPath

git clone $repoUrl

Write-Host "Repository cloned successfully."