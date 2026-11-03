$solutionPath = "C:\Projects\project\Backend\EhrApi.sln"

$msbuild = "C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe"

& $msbuild $solutionPath `
/p:Configuration=Release `
/p:DeployOnBuild=true

Write-Host ".NET Build Completed"