$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$RepoRoot = Split-Path -Parent $PSScriptRoot
$LiveReadme = Join-Path $RepoRoot "README.md"
$LiveBanner = Join-Path $RepoRoot "assets\profile-banner.svg"
$GeneratedReadme = Join-Path $RepoRoot "generated\README.md"
$GeneratedBanner = Join-Path $RepoRoot "generated\assets\profile-banner.svg"

Write-Host ""
Write-Host "PortfolioForge Compare" -ForegroundColor Cyan
Write-Host "Repository: $RepoRoot" -ForegroundColor Cyan
Write-Host ""

$Files = @(
    [ordered]@{
        Name = "README"
        Live = $LiveReadme
        Generated = $GeneratedReadme
    },
    [ordered]@{
        Name = "Banner"
        Live = $LiveBanner
        Generated = $GeneratedBanner
    }
)

$ChangesDetected = $false

foreach ($File in $Files) {
    if (-not (Test-Path -LiteralPath $File.Live)) {
        throw "Missing live file: $($File.Live)"
    }

    if (-not (Test-Path -LiteralPath $File.Generated)) {
        throw "Missing generated file: $($File.Generated)"
    }

    $LiveHash = (Get-FileHash -LiteralPath $File.Live -Algorithm SHA256).Hash
    $GeneratedHash = (Get-FileHash -LiteralPath $File.Generated -Algorithm SHA256).Hash

    Write-Host "$($File.Name):" -ForegroundColor White
    Write-Host "  Live SHA256:      $LiveHash" -ForegroundColor DarkGray
    Write-Host "  Generated SHA256: $GeneratedHash" -ForegroundColor DarkGray

    if ($LiveHash -eq $GeneratedHash) {
        Write-Host "  Status: IDENTICAL" -ForegroundColor Green
    }
    else {
        Write-Host "  Status: DIFFERENT" -ForegroundColor Yellow
        $ChangesDetected = $true
    }

    Write-Host ""
}

if ($ChangesDetected) {
    Write-Host "COMPARE RESULT: CHANGES DETECTED" -ForegroundColor Yellow
    exit 2
}
else {
    Write-Host "COMPARE RESULT: NO CHANGES" -ForegroundColor Green
    exit 0
}