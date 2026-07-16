$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$RepoRoot = Split-Path -Parent $PSScriptRoot
$ConfigFile = Join-Path $RepoRoot "config\profile.json"
$ReadmeTemplateFile = Join-Path $RepoRoot "templates\README.template.md"
$BannerTemplateFile = Join-Path $RepoRoot "templates\profile-banner.template.svg"
$GeneratedRoot = Join-Path $RepoRoot "generated"
$GeneratedAssets = Join-Path $GeneratedRoot "assets"
$GeneratedReadme = Join-Path $GeneratedRoot "README.md"
$GeneratedBanner = Join-Path $GeneratedAssets "profile-banner.svg"
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

Write-Host ""
Write-Host "PortfolioForge Build" -ForegroundColor Cyan
Write-Host "Repository: $RepoRoot" -ForegroundColor Cyan
Write-Host ""

$RequiredInputs = @(
    $ConfigFile,
    $ReadmeTemplateFile,
    $BannerTemplateFile
)

foreach ($InputFile in $RequiredInputs) {
    if (-not (Test-Path -LiteralPath $InputFile)) {
        throw "Missing generator input: $InputFile"
    }
}

try {
    $Config = Get-Content -LiteralPath $ConfigFile -Raw | ConvertFrom-Json
}
catch {
    throw "Invalid profile configuration: $($_.Exception.Message)"
}

if (-not (Test-Path -LiteralPath $GeneratedRoot)) {
    New-Item -ItemType Directory -Path $GeneratedRoot -Force | Out-Null
}

if (-not (Test-Path -LiteralPath $GeneratedAssets)) {
    New-Item -ItemType Directory -Path $GeneratedAssets -Force | Out-Null
}

$Readme = Get-Content -LiteralPath $ReadmeTemplateFile -Raw
$Banner = Get-Content -LiteralPath $BannerTemplateFile -Raw

$ReadmeValues = [ordered]@{
    "{{FULL_NAME}}" = [string]$Config.profile.fullName
    "{{EMAIL}}" = [string]$Config.profile.email
    "{{PRIMARY_TITLE}}" = [string]$Config.branding.primaryTitle
    "{{TAGLINE}}" = [string]$Config.branding.tagline
    "{{BOOTCAMP_PROGRAM}}" = [string]$Config.education.program
    "{{ORGANIZATION_NAME}}" = [string]$Config.organization.name
    "{{ORGANIZATION_URL}}" = [string]$Config.organization.url
    "{{GITHUB_URL}}" = [string]$Config.links.github
    "{{GITHUB_USERNAME}}" = [string]$Config.profile.username
    "{{AVAILABILITY}}" = [string]$Config.profile.availability
    "{{LOCATION}}" = [string]$Config.profile.location
    "{{MOTTO}}" = [string]$Config.branding.motto
}

foreach ($Item in $ReadmeValues.GetEnumerator()) {
    $Readme = $Readme.Replace([string]$Item.Key, [string]$Item.Value)
}

$BannerValues = [ordered]@{
    "{{FULL_NAME_UPPER}}" = ([string]$Config.profile.fullName).ToUpperInvariant()
    "{{PRIMARY_TITLE_UPPER}}" = ([string]$Config.branding.primaryTitle).ToUpperInvariant()
    "{{BANNER_MOTTO}}" = [string]$Config.branding.bannerMotto
}

foreach ($Item in $BannerValues.GetEnumerator()) {
    $Banner = $Banner.Replace([string]$Item.Key, [string]$Item.Value)
}

$UnresolvedReadmeTokens = [regex]::Matches($Readme, "\{\{[A-Z0-9_]+\}\}")
$UnresolvedBannerTokens = [regex]::Matches($Banner, "\{\{[A-Z0-9_]+\}\}")

if ($UnresolvedReadmeTokens.Count -gt 0) {
    $Tokens = $UnresolvedReadmeTokens.Value | Sort-Object -Unique
    throw "Unresolved README tokens: $($Tokens -join ', ')"
}

if ($UnresolvedBannerTokens.Count -gt 0) {
    $Tokens = $UnresolvedBannerTokens.Value | Sort-Object -Unique
    throw "Unresolved banner tokens: $($Tokens -join ', ')"
}

[System.IO.File]::WriteAllText($GeneratedReadme, $Readme, $Utf8NoBom)
[System.IO.File]::WriteAllText($GeneratedBanner, $Banner, $Utf8NoBom)

if (-not (Test-Path -LiteralPath $GeneratedReadme)) {
    throw "Generated README was not created."
}

if (-not (Test-Path -LiteralPath $GeneratedBanner)) {
    throw "Generated banner was not created."
}

$ReadmeCheck = Get-Content -LiteralPath $GeneratedReadme -Raw
$BannerCheck = Get-Content -LiteralPath $GeneratedBanner -Raw

$RequiredReadmeValues = @(
    [string]$Config.profile.fullName,
    [string]$Config.branding.primaryTitle,
    [string]$Config.profile.email,
    [string]$Config.organization.name
)

foreach ($RequiredValue in $RequiredReadmeValues) {
    if ($ReadmeCheck -notmatch [regex]::Escape($RequiredValue)) {
        throw "Generated README missing required value: $RequiredValue"
    }
}

if ($BannerCheck -notmatch [regex]::Escape(([string]$Config.profile.fullName).ToUpperInvariant())) {
    throw "Generated banner is missing the profile name."
}

Write-Host "Configuration: PASS" -ForegroundColor Green
Write-Host "README generation: PASS" -ForegroundColor Green
Write-Host "Banner generation: PASS" -ForegroundColor Green
Write-Host "Placeholder validation: PASS" -ForegroundColor Green
Write-Host ""
Write-Host "BUILD RESULT: PASS" -ForegroundColor Green
Write-Host "Generated preview:" -ForegroundColor White
Write-Host $GeneratedRoot -ForegroundColor Cyan