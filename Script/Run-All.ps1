Write-Host "==============================="
Write-Host "EHR Setup Started"
Write-Host "==============================="

.\01-Prerequisites.ps1

.\02-CloneRepository.ps1

.\03-BuildDotNet.ps1

.\04-BuildAngular.ps1

.\05-SetupIIS.ps1

Write-Host "==============================="
Write-Host "Setup Completed"
Write-Host "==============================="