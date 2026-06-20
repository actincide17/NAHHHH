# Place this at the very top of your .ps1 file to hide the window
Add-Type -Name Window -Namespace Win -MemberDefinition '[DllImport("user32.dll")] public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);'
[Win.Window]::ShowWindow((Get-Process -Id $PID).MainWindowHandle, 0)

# --- Your original code below ---
$tempFolder = "$env:TEMP\MyNewFolder"
$sourceFile = "$HOME\Downloads\Frozo\script.py"

if (-not (Test-Path -Path $tempFolder)) {
    New-Item -Path $tempFolder -ItemType Directory
}

Copy-Item -Path $sourceFile -Destination $tempFolder -Force
