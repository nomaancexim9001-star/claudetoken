# ==============================================================================
# PowerShell Setup Script for Claude Desktop & OmniRoute Gateway (Windows)
# Organization ID: ab582751-b90d-48cf-81a6-620979f5541a
# Repository: https://github.com/nomaancexim9001-star/claudetoken
# ==============================================================================

$ErrorActionPreference = "Stop"

Write-Host "==> Configuring Claude Desktop for Windows..." -ForegroundColor Cyan

$configDir = "$env:APPDATA\Claude"

if (!(Test-Path -Path $configDir)) {
    New-Item -ItemType Directory -Path $configDir -Force | Out-Null
    Write-Host "Created directory: $configDir" -ForegroundColor Gray
}

$destConfig = Join-Path $configDir "claude_desktop_config.json"

if (Test-Path -Path $destConfig) {
    Copy-Item -Path $destConfig -Destination "$destConfig.bak" -Force
    Write-Host "Backed up existing config to claude_desktop_config.json.bak" -ForegroundColor Yellow
}

Copy-Item -Path "claude_desktop_config.json" -Destination $destConfig -Force

Write-Host "✅ Configuration placed at: $destConfig" -ForegroundColor Green
Write-Host ""
Write-Host "Gateway URL: http://localhost:20128" -ForegroundColor Cyan
Write-Host "Gateway Key: sk-omniroute-local-token-9b" -ForegroundColor Cyan
Write-Host "Organization ID: ab582751-b90d-48cf-81a6-620979f5541a" -ForegroundColor Cyan
Write-Host ""
Write-Host "Launch Claude Desktop and test inference in the Code tab." -ForegroundColor Green
