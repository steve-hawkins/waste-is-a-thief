$ErrorActionPreference = 'Stop'

Write-Host "Configuring PowerShell profile to include Node.js (via NVM)..."
$ProfileDir = Split-Path $PROFILE -Parent
if (!(Test-Path $ProfileDir)) { New-Item -ItemType Directory -Path $ProfileDir -Force | Out-Null }

$NvmSetupBlock = @'
# NVM setup for PowerShell
$env:NVM_DIR = "$HOME/.nvm"
if (Test-Path "$env:NVM_DIR/nvm.sh") {
    # Source NVM bash script.
    # Note: 'bash -c' is used because NVM's init script is bash-specific.
    # Output redirection to /dev/null to prevent verbose output in profile.
    bash -c ". `"$env:NVM_DIR/nvm.sh`" --no-use > /dev/null 2>&1"

    # Get current active Node.js version and add its bin path to PATH
    $currentVersion = bash -c ". `"$env:NVM_DIR/nvm.sh`" && nvm current" 2>$null
    if ($currentVersion -and $currentVersion -ne 'none') {
        $nodeBinPath = "$env:NVM_DIR/versions/node/$currentVersion/bin"
        if (Test-Path $nodeBinPath) {
            $env:PATH = "${nodeBinPath}:$env:PATH"
        }
    }
}
'@

if (!(Test-Path $PROFILE)) {
    New-Item -Path $PROFILE -ItemType File -Force | Out-Null
}

$CurrentProfileContent = Get-Content $PROFILE -Raw -ErrorAction SilentlyContinue | Out-String
if ($CurrentProfileContent -notmatch "nvm.sh") { # Simple check to avoid duplicate additions
    Add-Content -Path $PROFILE -Value "`n$NvmSetupBlock`n"
    Write-Host "Added NVM initialization to PowerShell profile."
} else {
    Write-Host "NVM initialization already present in PowerShell profile."
}

Write-Host "Sourcing NVM and Node.js for current session..."
# Source NVM for the current session to make 'npm' available immediately
$env:NVM_DIR = "$HOME/.nvm"
bash -c ". `"$env:NVM_DIR/nvm.sh`" --no-use > /dev/null 2>&1 && nvm use --silent default" # Use --silent default to avoid output from nvm use
# Re-evaluate PATH for current session
$currentVersion = bash -c ". `"$env:NVM_DIR/nvm.sh`" && nvm current" 2>$null
if ($currentVersion -and $currentVersion -ne 'none') {
    $nodeBinPath = "$env:NVM_DIR/versions/node/$currentVersion/bin"
    if (Test-Path $nodeBinPath) {
        $env:PATH = "${nodeBinPath}:$env:PATH"
    }
}

Write-Host "Installing Gemini CLI with preview features..."
npm install -g @google/gemini-cli@preview
