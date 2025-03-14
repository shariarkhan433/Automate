@echo off
rem Installing some basic app
echo Installing Apps

start /wait winget install Git.Git --accept-package-agreements --accept-source-agreements

start /wait winget install Github-Desktop --accept-package-agreements --accept-source-agreements

start /wait winget install Google.Chrome --accept-package-agreements --accept-source-agreements

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
