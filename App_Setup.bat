@echo off
:: Installing some basic app
echo Installing Apps

start /wait winget install Git.Git --accept-package-agreements --accept-source-agreements

start /wait winget install Github-Desktop --accept-package-agreements --accept-source-agreements

start /wait winget install Google.Chrome --accept-package-agreements --accept-source-agreements

start /wait winget install Notepad++ --accept-package-agreements --accept-source-agreements

start /wait winget install Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements

start /wait winget install 7zip.7zip --accept-package-agreements --accept-source-agreements

start /wait winget install WinMerge.WinMerge --accept-package-agreements --accept-source-agreements


:: Installing Mellanox driver
set URL="https://www.dropbox.com/scl/fi/kb6vjqnxz3vr55g4z954i/MLNX_VPI_WinOF-5_50_53000_All_Win2019_x64.exe?rlkey=s4d3mhlw7wnqfsnbawfg7qgan&e=1&dl=0"
set File="D:\Eagle3D\task\Automate\MELANOX_DRIVER.exe"

echo Downloading MELANOX_DRIVER...
curl -L -o %File% %URL%

echo Running the installer...
start /wait "" %File% /S /v"/qn ACCEPT_EULA=YES"

:: installing unreal prerequisities
set UnrealFile="D:\Eagle3D\task\unreal.exe"
set UnrealURL="https://www.dropbox.com/scl/fi/9of1zu5y45l678w5u8uox/UEPrereqSetup_x64-5.5.exe?rlkey=jn5h5n1s5obarw767hg9czbdv&e=1&st=ygwqm84v&dl=0"

curl -L -o  %UnrealFile% %UnrealURL%

start /wait "" %UnrealFile% /S /v"/qn ACCEPT_EULA=YES"


:: installing VBSCABLE
powershell -Command "Expand-Archive -Path 'C:\0.ps\eagle3dstreaming_b_v1\Extras\VBCABLE_Driver_Pack43.zip' -DestinationPath 'C:\0.ps\eagle3dstreaming_b_v1\Extras\VBCABLE_Driver_Pack43' -Force"

cd "C:\0.ps\eagle3dstreaming_b_v1\Extras\VBCABLE_Driver_Pack43"
start /wait VBCABLE_Setup_x64.exe /S

:: install Node 19.9.msi
cd "C:\0.ps\eagle3dstreaming_b_v1\Extras\"

msiexec /i node-v19.9.0-x64.msi /passive /norestart


:: Installing Visual Studio with its necessary components
:: These are the components
:: “Node Js Development“, “Desktop Development with C++“,
:: “Game Development with C++“(Must Select the Windows 10 SDK) , “Linux Development with C++“

set VS_INSTALLER= "C:\0.ps\eagle3dstreaming_b_v1\Extras\vs_professional__1855540188.1634744814.exe"

echo Installing VS and Its components
%VS_INSTALLER% --quiet --wait --norestart ^
--add Microsoft.VisualStudio.Workload.Node ^
--add Microsoft.VisualStudio.Workload.NativeDesktop ^
--add Microsoft.VisualStudio.Workload.NativeGame ^
--add Microsoft.VisualStudio.Component.Windows10SDK ^
--add Microsoft.VisualStudio.Workload.NativeCrossPlat ^
--includeRecommended

echo VisualStudio installation is done


:: Adding 7-Zip path to the system variables
setlocal
:: Define the path to 7-Zip
set "zipPath=C:\Program Files\7-Zip"

:: Get the current System PATH
for /f "tokens=*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH 2^>nul') do set "currentPath=%%A"

:: Add the 7-Zip path to the end of the System PATH
set "newPath=%currentPath%;%zipPath%"

:: Update the System PATH
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /t REG_EXPAND_SZ /d "%newPath%" /f

:: Broadcast the change to running applications
%SystemRoot%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo 7-Zip path added to the System PATH.

endlocal