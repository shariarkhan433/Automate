@echo off
:: Read repository URL
set /p REPO_URL=<env.txt

:: Check if URL is empty
if not defined REPO_URL (
    echo Repository URL is empty.
    exit /b 1
)

:: First Clone - Beta Branch
cd C:\
mkdir 0.ps 2>nul
cd 0.ps

git clone "%REPO_URL%" eagle3dstreaming_b_v1
cd eagle3dstreaming_b_v1
git fetch origin
git checkout beta

:: Second Clone into ms6-streamer-branch folder
cd ..
mkdir ms6-streamer-branch 2>nul
cd ms6-streamer-branch

:: Cloning into this folder without the extra folder name
git clone --single-branch --branch ms6-aws1-unity3d "%REPO_URL%" .
