@echo off
set VERSION=572.60
set DRIVER_URL=https://us.download.nvidia.com/Windows/%VERSION%/%VERSION%-desktop-win10-win11-64bit-international-dch-whql.exe
set DEST_PATH=C:\Drivers\NVIDIA-Driver.exe

echo Downloading NVIDIA driver version %VERSION%...
powershell -Command "& {Invoke-WebRequest -Uri '%DRIVER_URL%' -OutFile '%DEST_PATH%'}"
echo Download complete.

echo Installing NVIDIA driver...
start /wait %DEST_PATH% -s -noreboot
echo Installation complete.
