@echo off

rem installing VBSCABLE

powershell -Command "Expand-Archive -Path 'C:\0.ps\eagle3dstreaming_b_v1\Extras\VBCABLE_Driver_Pack43.zip' -DestinationPath 'C:\0.ps\eagle3dstreaming_b_v1\Extras\VBCABLE_Driver_Pack43' -Force"

cd "C:\0.ps\eagle3dstreaming_b_v1\Extras\VBCABLE_Driver_Pack43"

start /wait VBCABLE_Setup_x64.exe /S

echo done