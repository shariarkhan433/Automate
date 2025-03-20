@echo off
rem Installing some basic app
echo Installing Apps

start /wait winget install Git.Git --accept-package-agreements --accept-source-agreements

start /wait winget install Github-Desktop --accept-package-agreements --accept-source-agreements

start /wait winget install Google.Chrome --accept-package-agr

eements --accept-source-agreements

start /wait winget install Notepad++ --accept-package-agreements --accept-source-agreements

start /wait winget install Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements

start /wait winget install 7zip.7zip --accept-package-agreements --accept-source-agreements

start /wait winget install WinMerge.WinMerge --accept-package-agreements --accept-source-agreements


rem Installing Mellanox driver
set URL="https://www.dropbox.com/scl/fi/kb6vjqnxz3vr55g4z954i/MLNX_VPI_WinOF-5_50_53000_All_Win2019_x64.exe?rlkey=s4d3mhlw7wnqfsnbawfg7qgan&e=1&dl=0"
set File="D:\Eagle3D\task\Automate\MELANOX_DRIVER.exe"

echo Downloading MELANOX_DRIVER...
curl -L -o %File% %URL%

echo Running the installer...
start /wait "" %File% /S /v"/qn ACCEPT_EULA=YES"

rem installing unreal prerequisities
set UnrealFile="D:\Eagle3D\task\unreal.exe"
set UnrealURL="https://www.dropbox.com/scl/fi/9of1zu5y45l678w5u8uox/UEPrereqSetup_x64-5.5.exe?rlkey=jn5h5n1s5obarw767hg9czbdv&e=1&st=ygwqm84v&dl=0"

curl -L -o  %UnrealFile% %UnrealURL%

start /wait "" %UnrealFile% /S /v"/qn ACCEPT_EULA=YES"


rem installing VBSCABLE
powershell -Command "Expand-Archive -Path 'C:\0.ps\eagle3dstreaming_b_v1\Extras\VBCABLE_Driver_Pack43.zip' -DestinationPath 'C:\0.ps\eagle3dstreaming_b_v1\Extras\VBCABLE_Driver_Pack43' -Force"

cd "C:\0.ps\eagle3dstreaming_b_v1\Extras\VBCABLE_Driver_Pack43"
start /wait VBCABLE_Setup_x64.exe /S

rem install Node 19.9.msi
cd "C:\0.ps\eagle3dstreaming_b_v1\Extras\"

msiexec /i node-v19.9.0-x64.msi /passive /norestart


