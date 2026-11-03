$angularPath = "C:\Projects\project\Frontend\AngularApp"

cd $angularPath

npm install

npm run build -- --configuration production

Write-Host "Angular Build Completed"