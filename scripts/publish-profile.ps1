param(
    [string]$CommitMessage = "Publish generated professional profile",
    [switch]$Push,
    [switch]$Force
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$RepoRoot = Split-Path -Parent $PSScriptRoot
$BuildScript = Join-Path $PSScriptRoot "build-profile.ps1"
$CompareScript = Join-Path $PSScriptRoot "compare-profile.ps1"
$LiveReadme = Join-Path $RepoRoot "README.md"
$LiveBanner = Join-Path $RepoRoot "assets\profile-banner.svg"
$GeneratedReadme = Join-Path $RepoRoot "generated\README.md"
$GeneratedBanner = Join-Path $RepoRoot "generated\assets\profile-banner.svg"
$BackupRoot = Join-Path $RepoRoot "backups"

Write-Host ""
Write-Host "PortfolioForge Publisher" -ForegroundColor Cyan
Write-Host "Repository: $RepoRoot" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path -LiteralPath $BuildScript)) {
    throw "Build script not found: $BuildScript"
}

if (-not (Test-Path -LiteralPath $CompareScript)) {
    throw "Compare script not found: $CompareScript"
}

Write-Host "Step 1: Rebuilding generated profile..." -ForegroundColor Yellow
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $BuildScript

if ($LASTEXITCODE -ne 0) {
    throw "Generated profile build failed."
}

Write-Host ""
Write-Host "Step 2: Comparing generated and live files..." -ForegroundColor Yellow
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $CompareScript
$CompareExitCode = $LASTEXITCODE

if ($CompareExitCode -eq 0) {
    Write-Host ""
    Write-Host "Generated profile is already identical to the live profile." -ForegroundColor Green
    Write-Host "No replacement, commit, or push is required." -ForegroundColor Green
    exit 0
}

if ($CompareExitCode -ne 2) {
    throw "Profile comparison failed with exit code $CompareExitCode."
}

if (-not $Force) {
    Write-Host ""
    Write-Host "Changes were detected, but publication was not authorized." -ForegroundColor Yellow
    Write-Host "Review the generated folder first." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To publish locally, run this script with -Force." -ForegroundColor White
    Write-Host "To publish and push, run this script with -Force -Push." -ForegroundColor White
    exit 3
}

Write-Host ""
Write-Host "Step 3: Creating safety backup..." -ForegroundColor Yellow

if (-not (Test-Path -LiteralPath $BackupRoot)) {
    New-Item -ItemType Directory -Path $BackupRoot -Force | Out-Null
}

$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$BackupDirectory = Join-Path $BackupRoot "publish-$Timestamp"
New-Item -ItemType Directory -Path $BackupDirectory -Force | Out-Null

Copy-Item -LiteralPath $LiveReadme -Destination (Join-Path $BackupDirectory "README.md") -Force
Copy-Item -LiteralPath $LiveBanner -Destination (Join-Path $BackupDirectory "profile-banner.svg") -Force

Write-Host "Backup created: $BackupDirectory" -ForegroundColor Green

Write-Host ""
Write-Host "Step 4: Replacing live files..." -ForegroundColor Yellow

Copy-Item -LiteralPath $GeneratedReadme -Destination $LiveReadme -Force
Copy-Item -LiteralPath $GeneratedBanner -Destination $LiveBanner -Force

if (-not (Test-Path -LiteralPath $LiveReadme)) {
    throw "Live README replacement failed."
}

if (-not (Test-Path -LiteralPath $LiveBanner)) {
    throw "Live banner replacement failed."
}

Write-Host "Live profile files replaced successfully." -ForegroundColor Green

Write-Host ""
Write-Host "Step 5: Verifying replacement..." -ForegroundColor Yellow
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $CompareScript

if ($LASTEXITCODE -ne 0) {
    throw "Post-publication comparison failed."
}

Set-Location -LiteralPath $RepoRoot

if (-not (Test-Path -LiteralPath ".git")) {
    git init
    if ($LASTEXITCODE -ne 0) {
        throw "git init failed."
    }

    git branch -M main
    if ($LASTEXITCODE -ne 0) {
        throw "Unable to configure main branch."
    }
}

Write-Host ""
Write-Host "Step 6: Preparing Git commit..." -ForegroundColor Yellow
git add --all

if ($LASTEXITCODE -ne 0) {
    throw "git add failed."
}

$Staged = git diff --cached --name-only

if (-not $Staged) {
    Write-Host "No staged changes remain after publication." -ForegroundColor Green
}
else {
    Write-Host "Staged files:" -ForegroundColor White
    $Staged | ForEach-Object { Write-Host " - $_" }

    git commit -m $CommitMessage

    if ($LASTEXITCODE -ne 0) {
        throw "git commit failed."
    }

    Write-Host "Commit created successfully." -ForegroundColor Green
}

if ($Push) {
    Write-Host ""
    Write-Host "Step 7: Pushing to GitHub..." -ForegroundColor Yellow

    $Origin = git remote get-url origin 2>$null

    if ([string]::IsNullOrWhiteSpace($Origin)) {
        git remote add origin "https://github.com/CodeDeityX/CodeDeityX.git"

        if ($LASTEXITCODE -ne 0) {
            throw "Unable to configure GitHub origin."
        }
    }

    git push -u origin main

    if ($LASTEXITCODE -ne 0) {
        throw "git push failed."
    }

    Write-Host "GitHub push completed." -ForegroundColor Green
}
else {
    Write-Host ""
    Write-Host "No GitHub push was requested." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "PUBLISH RESULT: PASS" -ForegroundColor Green
Write-Host "Latest commit:" -ForegroundColor White
git log -1 --oneline
Write-Host ""
Write-Host "Git status:" -ForegroundColor White
git status --short