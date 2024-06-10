@echo off
echo WARNING: YOU MUST HAVE REMOVEBG CLI EXE IN THE SAME FOLDER AS THE SCRIPT
set /p Path="Enter the path: "
set /p Key="Enter Your RemoveBG API key: "
echo The path you entered is: %Path%
color 03
echo "Converting Files..."
color 0F
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command "removebg --api-key '%Key%' '%Path%\*.jpg'"
color 03
echo "Removing removeBG added name..."
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command "$filesToRemoveBgFrom = Get-ChildItem -Path '%Path%' -Filter '*-removebg*.png'; foreach ($file in $filesToRemoveBgFrom) { $newFileName = $file.Name.Replace('-removebg', ''); Rename-Item -Path $file.FullName -NewName $newFileName }"
color 03
echo "Deleting Originals..."
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Command "Remove-Item -Path '%Path%\*.jpg'"

pause & exit
