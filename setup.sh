# Run as Administrator

# Define essential system paths
$essentialPaths = @(
  "C:\Windows\system32",
  "C:\Windows",
  "C:\Windows\System32\Wbem",
  "C:\Windows\System32\WindowsPowerShell\v1.0\"
)

# Custom path to add
$customPath = "C:\Program Files\7-Zip"

# Get current User PATH
$userPath = [Environment]::GetEnvironmentVariable("PATH", "User") -split ";" | Where-Object { $_ -ne "" }

# Merge all paths: essential + user + custom
$mergedPaths = $essentialPaths + $userPath + $customPath

# Remove duplicates while preserving order
$uniquePaths = [System.Collections.Generic.List[string]]::new()
foreach ($p in $mergedPaths) {
    if (-not $uniquePaths.Contains($p)) {
        $uniquePaths.Add($p)
    }
}

# Join into single string
$newSystemPath = $uniquePaths -join ";"

# Write to system PATH
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
Set-ItemProperty -Path $regPath -Name PATH -Value $newSystemPath

# Broadcast change to running apps
$signature = '[DllImport("user32.dll")] public static extern int SendMessageTimeout(int hWnd, int Msg, int wParam, string lParam, int fuFlags, int uTimeout, out int lpdwResult);'
$SendMessageTimeout = Add-Type -MemberDefinition $signature -Name 'Win32SendMessageTimeout' -Namespace Win32Functions -PassThru
$HWND_BROADCAST = 0xffff
$WM_SETTINGCHANGE = 0x1A
$result = 0
$SendMessageTimeout::SendMessageTimeout($HWND_BROADCAST, $WM_SETTINGCHANGE, 0, "Environment", 2, 5000, [ref]$result)

Write-Output "`n✅ System PATH updated:"
$uniquePaths | ForEach-Object { Write-Output "  $_" }
