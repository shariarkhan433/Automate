@echo off
set VS_INSTALLER= "D:\Eagle3D\task\vs_professional__1855540188.1634744814.exe"

:: Start the installation with predefined workloads and components

echo Installing VS and Its components
%VS_INSTALLER% --quiet --wait --norestart ^
--add Microsoft.VisualStudio.Workload.Node ^
--add Microsoft.VisualStudio.Workload.NativeDesktop ^
--add Microsoft.VisualStudio.Workload.NativeGame ^
--add Microsoft.VisualStudio.Component.Windows10SDK ^
--add Microsoft.VisualStudio.Workload.NativeCrossPlat ^
--includeRecommended

echo installation is done