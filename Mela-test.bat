@echo off
rem Installing Mellanox driver
set URL="https://www.dropbox.com/scl/fi/kb6vjqnxz3vr55g4z954i/MLNX_VPI_WinOF-5_50_53000_All_Win2019_x64.exe?rlkey=s4d3mhlw7wnqfsnbawfg7qgan&e=1&dl=0"
set File="D:\Eagle3D\task\Automate\MELANOX_DRIVER.exe"

echo Downloading MELANOX_DRIVER...
curl -L -o %File% %URL%

if %ERRORLEVEL% neq 0 (
    echo Failed to download MELANOX_DRIVER.
    exit /b 1
)

echo Running the installer...
start /wait "" %File% /S /v"/qn ACCEPT_EULA=YES"

if %ERRORLEVEL% equ 0 (
    echo MELANOX_DRIVER installed successfully!
) else (
    echo MELANOX_DRIVER installation failed.
    exit /b 1
)